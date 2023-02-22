package com.erictrudell.blurbbox.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erictrudell.blurbbox.models.User;
import com.erictrudell.blurbbox.services.UserService;
import com.erictrudell.blurbbox.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userServ;
    @Autowired
    private UserValidator userValidator;
    
//    @GetMapping("/")
//    public String land() {
//    	return"index.jsp";
//    }
    @GetMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registration.jsp";
    }
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user,
    		BindingResult result,
    		Model model, 
    		HttpSession session) {
    	userValidator.validate(user, result);
    	if (result.hasErrors()) {
            return "registration.jsp";
        }
//        userServ.saveWithUserRole(user);
    	userServ.saveUserWithAdminRole(user);
        return "redirect:/login";
    }
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userServ.findByUsername(username));
        return "adminPage.jsp";
    }
//    @GetMapping("/login")
//    public String login() {
//        return "login.jsp";
//    }
    @GetMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error,
    		@RequestParam(value="logout", required=false) String logout,
    		Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "login.jsp";
    }
//	On a login attempt, Spring Security will automatically call the loadUserByUsername(String) in UserDetailsServiceImplementation class. 
//	From there, Spring Security will have two options:
//	Successful Login: The user is authenticated, saves them in a context, and redirects to "/" (root route). More information on the context below.
//	Unsuccessful Login: The client is redirected to "/login?error".
//	It is important to note that the form must have a name field with the username value for Spring Security to correctly grab the information in the loadUserByUsername(String) method.
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
        // 1
        String username = principal.getName();
        model.addAttribute("currentUser", userServ.findByUsername(username));
        return "home.jsp";
    }
//    The most basic object in Spring Security is the SecurityContextHolder. This is where Spring Security stores the details of the present security context of the application, such as the principal currently using the application. In our example, the principal is the current user logged in. But where is Spring Security storing all this information? 
//    If you guessed in HttpSession, you are absolutely correct! Therefore, when using Spring Security, we should NOT access user information directly HttpSession, but instead, via the SecurityContextHolder.
}