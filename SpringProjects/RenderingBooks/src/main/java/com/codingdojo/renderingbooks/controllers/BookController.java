package com.codingdojo.renderingbooks.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller 
public class BookController {
	@GetMapping("/")
	public String start() {
		return "home.jsp";
	}
	
	@GetMapping("/books/{id}")
	public String book(@PathVariable("id") Long id, Model model) {

		return "show.jsp";
	}
}
