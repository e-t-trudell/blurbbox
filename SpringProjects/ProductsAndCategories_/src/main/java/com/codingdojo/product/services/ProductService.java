package com.codingdojo.product.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.product.models.Category;
import com.codingdojo.product.models.Product;
import com.codingdojo.product.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public ProductService (ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	public List<Product>allProducts() {
		return productRepository.findAll();
	}
	
	// all categories associated with a certain product
	public List<Product> getAssignedProducts (Category category) {
		return productRepository.findAllByCategories(category);
	}
	// all categories not associated with a certain product
	public List<Product> getUnassignedProducts (Category category) {
		return productRepository.findByCategoriesNotContains(category);
	}
	
	
	// finding individual categories
	public Product findById(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		}
		return null;
	}
	
	// create one
	public Product addProduct(Product product) {
		return productRepository.save(product);
	}
	
	// update one
	public Product updateProduct(Product product) {
		return productRepository.save(product);
	}
	
	// delete one 
	public void deleteProduct(Product product) {
		productRepository.delete(product);
	}
	
}
