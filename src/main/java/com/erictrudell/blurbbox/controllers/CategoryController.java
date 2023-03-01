package com.erictrudell.blurbbox.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.blurbbox.models.Category;
import com.erictrudell.blurbbox.models.User;
import com.erictrudell.blurbbox.repositories.UserRepository;
import com.erictrudell.blurbbox.services.BlurbService;
import com.erictrudell.blurbbox.services.CategoryService;
import com.erictrudell.blurbbox.services.UserService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private UserService userServ;
	@Autowired
	private CategoryService catServ;
	@Autowired
	private BlurbService blurbServ;
	
	@GetMapping("/addCategory")
	public String getCreateView(Model model,
			Principal principal) {
		model.addAttribute("category", new Category());
		String username = principal.getName();
		User user = userRepo.findByUsername(username);
		model.addAttribute("user", user);
		return "newCategory.jsp";
	}
	@PostMapping("/create")
	public String createNewCategory(@Valid @ModelAttribute("category") Category category,
			BindingResult result,
			Principal principal,
			Model model) {
//		Add redirect attributes to indicate success
		if(result.hasErrors()) {
			return "newCategory.jsp";
		} else {
			String username = principal.getName();
			User userOne = userServ.findByUsername(username);
			Long userId = userOne.getId();
			catServ.create(category);
			return"redirect:/home";
		}
	}
	@GetMapping("/{id}/view")
	public String viewOne(@PathVariable("id") Long catId, 
			Model model) {
		model.addAttribute("blurbs", blurbServ.all());
		model.addAttribute("category", catServ.findById(catId));
		System.out.println("Dogs rule cats drool");
		return "oneCategory.jsp";
	}
	@GetMapping("/{id}/edit")
	public String editView(@PathVariable("id") Long catId,
			Model model) {
		model.addAttribute("category", catServ.findById(catId));
		return "editCategory.jsp";
	}
	
	@PostMapping("/{id}/update")
	public String updateBlurb(@Valid @ModelAttribute("category") Category category, 
			BindingResult result, 
			@PathVariable("id") Long catId) {
		if(result.hasErrors()) {
			return "editCategory.jsp";
		} else {
			catServ.updateCategory(category);
			return "redirect:/category/{id}/view";
		}
	}
	
	@GetMapping("/{id}/delete")
	public String deleteBlurb(@PathVariable("id") Long catId) {
		Category cat = catServ.findById(catId);
		catServ.deleteCat(cat);
		System.out.println("Dogs for the win!");
		return "redirect:/home";
	}
	
	
	
	
}
