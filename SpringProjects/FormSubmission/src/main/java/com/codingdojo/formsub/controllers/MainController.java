package com.codingdojo.formsub.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping("/login")
	public String login(
		@RequestParam(value="email") String email,
    	@RequestParam(value="password") String password,
		HttpSession session,
		RedirectAttributes redirectAttributes
		) {
		if(password.length()<5) {
			redirectAttributes.addFlashAttribute("error", "The password must be 5 or more characters!");
			return "redirect:/"; // here we implement our code being redirected and the explanation for how to do it
		}
    	session.setAttribute("email", email);
    	return "redirect:/home"; // <-- we'll change this when we learn redirecting
	}
	@RequestMapping("/home")
	public String home() {
		
		return "home.jsp";
	}
}
	