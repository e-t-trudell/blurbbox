package com.erictrudell.blurbbox.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erictrudell.blurbbox.models.Category;
import com.erictrudell.blurbbox.repositories.CategoryRepository;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryRepository repo;
	
	public Category findById(Long id) {
		Optional<Category> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
//	@Bito this is a duplicate do we need?
//	public Category findCategory(Long id) {
//        Optional<Category> optionalCategory = repo.findById(id);
//        if(optionalCategory.isPresent()) {
//            return optionalCategory.get();
//        } else {
//            return null;
//	        }
//    }
	public List<Category> all() {
		return repo.findAll();
	}
	
	public Category create(Category category) {
		return repo.save(category);
	}
	
	public Category updateCategory(Category category) {
		return repo.save(category);
	}
	
	
	
	public void deleteCat(Category category) {
		repo.delete(category);
}
}
