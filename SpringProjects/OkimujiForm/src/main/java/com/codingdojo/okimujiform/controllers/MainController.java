package com.codingdojo.okimujiform.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller //what is the difference between a restController and normal controller?
public class MainController {
	@GetMapping("/")
	public String start() {
		return "redirect:/omikuji";
	}
	
	@GetMapping("/omikuji")
	public String index() {
		
		return "index.jsp";
	}	
	
	
	@PostMapping("/login")
	public String login(
			@RequestParam("number") int number, 
			@RequestParam("city") String city,
			@RequestParam("person") String person,
			@RequestParam("hobby") String hobby,
			@RequestParam("livingThing") String livingThing,
			@RequestParam("message") String message,
			HttpSession session 
			) {
		String actualOmikuji = String.format(
				"In %s years you will live in %s with %s as your roommate, %s for a living. The next time you see a %s, you will"
				+ " have good luck. Also, %s. ", number, city, person, hobby, livingThing, message);
		
    	
		session.setAttribute("actualOmikuji", actualOmikuji);
    	return "redirect:/omikuji/show"; // <-- we'll change this when we learn redirecting
	}
	
	@GetMapping("/omikuji/show")
	public String show(HttpSession session, Model model) {
		
		String result = (String) session.getAttribute("actualOmikuji");
		model.addAttribute("result", result);
		return "show.jsp";
	}
}
