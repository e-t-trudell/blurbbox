package com.erictrudell.blurbbox.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erictrudell.blurbbox.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository <Category, Long> {
	List <Category> findAll();
}
