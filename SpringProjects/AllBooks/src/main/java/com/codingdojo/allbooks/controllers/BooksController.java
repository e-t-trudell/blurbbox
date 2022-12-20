package com.codingdojo.allbooks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.allbooks.models.Book;
import com.codingdojo.allbooks.services.BookService;

@Controller
public class BooksController {
	
	
	@Autowired
	BookService bookService;
	
	
	@GetMapping("/books")
	public String index(Model model) {
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "all.jsp";
	}
	@GetMapping("/books/{id}")
	public String book(@PathVariable("id") Long id, Model model) {
		
		Book book = bookService.findBook(id);
		
		model.addAttribute("Book", book);
		System.out.println(book);
		
		return "show.jsp";
	}
}
