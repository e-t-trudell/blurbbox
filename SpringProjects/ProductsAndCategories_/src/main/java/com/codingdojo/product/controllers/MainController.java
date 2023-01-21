package com.codingdojo.product.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.product.models.Category;
import com.codingdojo.product.models.Product;
import com.codingdojo.product.services.CategoryService;
import com.codingdojo.product.services.ProductService;

@Controller
public class MainController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@GetMapping("/")
	public String index(Model model) {
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home(Model model) {
		List<Product> products = productService.allProducts();
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return "home.jsp";
	}
	
	@GetMapping("/categories/create")
	public String newCategory(@ModelAttribute("category") Category category) {
		return "newCategory.jsp";
	}
	
	@PostMapping("/categories/create")
	public String addCategory(@ModelAttribute("category") Category category, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:/";
		}
		categoryService.addCategory(category);
		return "redirect:/";
	}
	
	@GetMapping("/categories/{id}")
	public String showCategory(@PathVariable("id") Long id, Model model) {
		Category category = categoryService.findById(id);
		model.addAttribute("category", category);
		model.addAttribute("assignedProducts", productService.getAssignedProducts(category));
		model.addAttribute("unassignedProducts", productService.getUnassignedProducts(category));
		return "category.jsp";
	}
	
	@PostMapping("/categories/{id}")
	public String updateCategory(@PathVariable("id") Long id, @RequestParam(value="productId") Long productId, Model model) {
		Category category = categoryService.findById(id);
		Product product = productService.findById(productId);
		category.getProducts().add(product);
		categoryService.updateCategory(category);
		return "redirect:/categories/"+id;
	}
	
	
	@GetMapping("/product/create")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "newProduct.jsp";
	}
	
	@PostMapping("/product/create")
	public String addProduct(@ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:/";
		}
		productService.addProduct(product);
		return "redirect:/";
	}
	
	@GetMapping("/products/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		Product product = productService.findById(id);
		model.addAttribute("product", product);
		model.addAttribute("assignedCategories", categoryService.getAssignedCategories(product));
		model.addAttribute("unassignedCategories", categoryService.getUnassignedCategories(product));
		return "product.jsp";
	}
	
	@PostMapping("/products/{id}")
	public String updateProduct(@PathVariable("id") Long id, @RequestParam(value="categoryId") Long categoryId, Model model) {
		Product product = productService.findById(id);
		Category category = categoryService.findById(categoryId);
		product.getCategories().add(category);
		productService.updateProduct(product);
		return "redirect:/products/"+id;
	}
	
}
