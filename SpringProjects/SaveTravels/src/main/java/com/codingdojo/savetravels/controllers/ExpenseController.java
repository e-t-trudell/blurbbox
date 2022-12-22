package com.codingdojo.savetravels.controllers;

import java.awt.print.Book;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.savetravels.models.Expense;
import com.codingdojo.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/books")
	public String index(Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		return "allBooks.jsp";
	}
	
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book) {
		return "new.jsp";
	}
	
	
	// creates one
	@PostMapping("/books")
	    public String create(@Valid @ModelAttribute("book") Book book, BindingResult result) {
	        if (result.hasErrors()) {
	            return "new.jsp";
	        } else {
	            bookService.createBook(book);
	            return "redirect:/books";
	        }
    }
	
	// Displays one 
	@GetMapping("/books/{id}")
	public String showbook(@PathVariable("id") Long id, Model model) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		
		return "oneBook.jsp";
	}
	
	// BELOW is marked for the editing and updating
	@GetMapping("/books/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Book book = bookService.findBook(id);
        model.addAttribute("book", book);
        return "edit.jsp";
    }
    
    @PutMapping("/books/{id}")
    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            bookService.updateBook(book);
            return "redirect:/books";
        }
    }
    
    // implementing Delete/Destroy function
    @RequestMapping(value="/books/{id}", method=RequestMethod.DELETE)// is there a difference between RequestMapping and GetMapping???
    public String destroy(@PathVariable("id") Long id) {
        bookService.deleteBook(id);
        return "redirect:/books";
    }
    
    // Below is simply a shorthand for the same Delete functionality
//    @DeleteMapping("/books/{id}")
//    public String destroy(@PathVariable("id") Long id) {
//        bookService.deleteBook(id);
//        return "redirect:/books";
//    }
}
