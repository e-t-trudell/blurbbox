package com.codingdojo.renderingbooks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.renderingbooks.models.Book;
import com.codingdojo.renderingbooks.services.BookService;

@Controller 
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@GetMapping("/")
	public String start() {
		return "home.jsp";
	}
	
	@GetMapping("/books/{id}")
	public String book(@PathVariable("id") Long id, Model model) {
		
		Book book = bookService.findBook(id);
		
		model.addAttribute("Book", book);
		System.out.println(book);
		
		return "show.jsp";
	}
}
