package com.codingdojo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.repositories.ExpenseRepository;



@Service
public class ExpenseService {
private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	// returns all the books
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
    // creates a book
    public Expense createExpense(Expense e) {
        return expenseRepository.save(e);
    }
    // retrieves a book
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    //updates a book
    public Expense updateExpense(Expense e) {
    	return expenseRepository.save(e);

    }
    
    // Delete a book
    public void deleteExpense(Long id) {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if(optionalExpense.isPresent()) {
    		 expenseRepository.deleteById(id);
    	}
    	
    }
}
