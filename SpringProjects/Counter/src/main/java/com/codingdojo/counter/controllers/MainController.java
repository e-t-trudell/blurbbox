package com.codingdojo.counter.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/")
	public String index(HttpSession session, Model model) { // going to inject HttpSession
		
		if (session.getAttribute("count") == null) { // if our session "count" is null
			session.setAttribute("count", 0); // set the count to be 0
		} else { // but if it's not null
			Integer currentCount = (Integer) session.getAttribute("count"); // save the Integer currentCount to Integer, 
			// and cast the session data from the attribute "count".
			currentCount++; // simply add one to currentCount
			session.setAttribute("count", currentCount);
		}
		return "index.jsp";
	}
	
	@GetMapping("/counter/")
	public String counter(HttpSession session, Model model, HttpServletRequest request) {
		Integer currentCount = 0;
		
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		} else {
			currentCount = (Integer) session.getAttribute("count");
		}
		
		String homeUrl = request.getRequestURL().toString();
		
		model.addAttribute("count", currentCount);
		
		model.addAttribute("page", homeUrl.substring(0,homeUrl.length()-9));
		return "counter.jsp";
	}
	
	@GetMapping("/reset-counter/")
	public String resetCounter(HttpSession session, Model model, HttpServletRequest request) {
		
		session.setAttribute("count", 0);

		return "redirect:/counter/";
	}
}
