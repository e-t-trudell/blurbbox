package com.codingdojo.test1.controllers;

import javax.servlet.http.HttpSession;
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

import com.codingdojo.test1.models.LoginUser;
import com.codingdojo.test1.models.Show;
import com.codingdojo.test1.models.User;
import com.codingdojo.test1.services.ShowServices;
import com.codingdojo.test1.services.UserServices;

@Controller
public class ShowController {
	@Autowired
	private UserServices userServ;
	
	@Autowired
	private ShowServices showServ;
	
	@GetMapping("/")
	public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        userServ.register(newUser, result);
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", newUser.getId());
    
        return "redirect:/shows";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userServ.login(newLogin, result);
    	
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        
    
        return "redirect:/shows";
    }
    
    // the bottom is important because we want to make sure we can log the user OUT of session
    // if we dont do this their account may be easy to access for unwanted visitors
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.setAttribute("userId", null);
    	return "redirect:/";
    }
    
    @GetMapping("/shows")
    public String welcome(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	model.addAttribute("shows", showServ.all());
    	model.addAttribute("user", userServ.findById((Long)session.getAttribute("userId")));
    	return "welcome.jsp";
    }
    
    @GetMapping("/shows/new")
    public String newShow(Model model, @ModelAttribute("show")Show show,  HttpSession session) {
    	User user = userServ.findById((Long)session.getAttribute("userId")); // always make sure our user is in session
    	model.addAttribute("user", user);
    	
    	return "newShow.jsp"; 
    }
    
    @PostMapping("/shows/create")
    public String createShow(@Valid @ModelAttribute("show")Show show, BindingResult result, HttpSession session, Model model) {
    	if (result.hasErrors()) {
    		
    		return "newShow.jsp";
    	}
    	
		showServ.createShow(show);
		return "redirect:/shows";
    
    }
    
 // the page linked for viewing the individual book
    @GetMapping("/shows/{id}")
    public String show(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Show show = showServ.findById(id);
    	model.addAttribute("show", show);
    	model.addAttribute("user", userServ.findById((Long)session.getAttribute("userId")));
    	
    	return "show.jsp";
    }
    
    
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
    	Show show = showServ.findById(id);
    	model.addAttribute("show", show);
    	return "edit.jsp";
    }
    
    @PutMapping("/update/{id}")
    public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("show")Show show, BindingResult result) {
        if (result.hasErrors()) {
        	
            return "edit.jsp";
        } else {
            showServ.updateShow(show);
            return "redirect:/shows";
        }
    }
    
    @DeleteMapping("/destroy/{id}")
    public String destroy(@PathVariable("id") Long id) {
        showServ.deleteShow(id);
        return "redirect:/shows";
    }
}
