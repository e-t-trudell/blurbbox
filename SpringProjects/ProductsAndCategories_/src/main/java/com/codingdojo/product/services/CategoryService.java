package com.codingdojo.product.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.product.models.Category;
import com.codingdojo.product.models.Product;
import com.codingdojo.product.repositories.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	
	public CategoryService (CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}
	
	//finds list of all the categories
	public List<Category>allCategories() {
		return categoryRepository.findAll();
	}
	
	// all categories associated with a certain product
	public List<Category> getAssignedCategories (Product product) {
		return categoryRepository.findAllByProducts(product);
	}
	// all categories not associated with a certain product
	public List<Category> getUnassignedCategories (Product product) {
		return categoryRepository.findByProductsNotContains(product);
	}
	
	
	// finding individual categories
	public Category findById(Long id) {
		Optional<Category> optionalCategory = categoryRepository.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		}
		return null;
	}
	
	// create one
	public Category addCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	// update one
	public Category updateCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	// delete one 
	public void deleteCategory(Category category) {
		categoryRepository.delete(category);
	}
	
}
