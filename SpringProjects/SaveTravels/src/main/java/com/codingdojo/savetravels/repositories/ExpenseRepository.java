package com.codingdojo.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.savetravels.models.Expense;



@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {
List<Expense> findAll();
	
	// this method finds expenses with descriptions containing the search string
    List<Expense> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByTitleContaining(String search);
    // this method deletes an expense that starts with a specific title
    Long deleteByTitleStartingWith(String search);
}
