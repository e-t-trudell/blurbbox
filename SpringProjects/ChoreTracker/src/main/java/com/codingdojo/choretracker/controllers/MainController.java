package com.codingdojo.choretracker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.choretracker.models.Chore;
import com.codingdojo.choretracker.models.LoginUser;
import com.codingdojo.choretracker.models.User;
import com.codingdojo.choretracker.services.ChoreService;
import com.codingdojo.choretracker.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private ChoreService choreServ;
	
	@GetMapping("/")
	public String index(Model model) {
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
    
        return "redirect:/dashboard";
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
        
    
        return "redirect:/dashboard";
    }
    
    // the bottom is important because we want to make sure we can log the user OUT of session
    // if we dont do this their account may be easy to access for unwanted visitors
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.setAttribute("userId", null);
    	return "redirect:/";
    }
    
    @GetMapping("/dashboard")
    public String welcome(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findById(userId);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("unassignedChores", choreServ.getUnassignedChores(user));
    	model.addAttribute("assignedChores", choreServ.getAssignedChores((user)));
    	return "home.jsp";
    }
    
    @GetMapping("/addJob")
    public String newChore(@ModelAttribute("chore") Chore chore, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	model.addAttribute("userId", userId);
    	return "newChore.jsp";
    }
    
    @PostMapping("/chores/add")
    public String addChore(@Valid @ModelAttribute("chore") Chore chore, BindingResult result, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	if(result.hasErrors()) {
    		return "newChore.jsp";
    	}else {
    		choreServ.addChore(chore);
    		
    		Long userId = (Long) session.getAttribute("userId");
    		User user = userServ.findById(userId);
    		user.getChores().add(chore);
    		userServ.updateUser(user);
    		return "redirect:/dashboard";
    	}
    	
    }
    
}
