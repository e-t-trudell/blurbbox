package com.codingdojo.savetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;


import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.savetravels.services.ExpenseService;

@Controller 
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/")
	public String pre() {
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses")
	public String index(Model model, @ModelAttribute("expense")Expense expense) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		return "expenses.jsp";
	}
	

//	@GetMapping("/expense")
//	public String newExpense(@ModelAttribute("expense") Expense expense) {
//		return "expenses.jsp";
//	}
	
	// creates one
	@PostMapping("/expenses")
	    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		System.out.println("lolololololololol");
	        if (result.hasErrors()) {
	        	
	        	System.out.println("an error is supposed to show");
	            return "expenses.jsp";
	        } else {
	        	System.out.println("the error is occuring before creation");
	            expenseService.createExpense(expense);
	            System.out.println("the error is occuring after creation");
	            return "redirect:/expenses";
	        }
    }
	
	// Displays one 
	@GetMapping("/expenses/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		
		return "one.jsp";
	}
	
	// BELOW is marked for the editing and updating
	@GetMapping("/expenses/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }
    
    @PutMapping("/update/{id}")
    public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("expense")Expense expense, BindingResult result, Expense e) {
        if (result.hasErrors()) {
        	
            return "edit.jsp";
        } else {
            expenseService.updateExpense(e);
            return "redirect:/expenses";
        }
    }
    
    
    // Below is simply a shorthand for the same Delete functionality
    @DeleteMapping("/destroy/{id}")
    public String destroy(@PathVariable("id") Long id) {
        expenseService.deleteExpense(id);
        return "redirect:/expenses";
    }
    
    
    
    
}
