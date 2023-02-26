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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erictrudell.blurbbox.models.Blurb;
import com.erictrudell.blurbbox.models.User;
import com.erictrudell.blurbbox.services.BlurbService;
import com.erictrudell.blurbbox.services.UserService;
import com.erictrudell.blurbbox.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userServ;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private BlurbService blurbServ;
    
    @GetMapping("/index")
    public String land() {
    	return"index.jsp";
    }
    @GetMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registration.jsp";
    }
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user,
    		BindingResult result,
    		Model model, 
    		HttpSession session,
    		Principal principal) {
    	userValidator.validate(user, result);
    	if (result.hasErrors()) {
            return "registration.jsp";
        }
    	
        userServ.saveWithUserRole(user);
//    	userServ.saveUserWithAdminRole(user);
        return "redirect:/login";
    }
    @GetMapping("/loginPage")
    public String loginPage() {
    	return"login.jsp";
    }
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userServ.findByUsername(username));
        return "adminPage.jsp";
    }

//	On a login attempt, Spring Security will automatically call the loadUserByUsername(String) in UserDetailsServiceImplementation class. 
//	From there, Spring Security will have two options:
//	Successful Login: The user is authenticated, saves them in a context, and redirects to "/" (root route). More information on the context below.
//	Unsuccessful Login: The client is redirected to "/login?error".
//	It is important to note that the form must have a name field with the username value for Spring Security to correctly grab the information in the loadUserByUsername(String) method.
    
//   ERIC - log in current redirects to bootstrap error page on successful login
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
        model.addAttribute("newUser", new User());
        return "login.jsp";
    }
    @GetMapping("/logout")
    public String logout(@RequestParam(value="logout", required=false) String logout,
    		Model model) {
    	if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        model.addAttribute("newUser", new User());
    	
    	return "redirect;/login";
    }
    @GetMapping(value = {"/","/home"})
    public String home(Principal principal, Model model) {
        // 1
        String username = principal.getName();
//        String username = principal.getName();
//    	User userOne = userServ.findByUsername(username);
//    	Long userId = userOne.getId();
        model.addAttribute("blurbs", blurbServ.all());
        model.addAttribute("currentUser", userServ.findByUsername(username));
        return "home.jsp";
    }
    
//	 TO ADD BLURBS / POST TO DB
	 
	 @GetMapping("/addBlurb")
	 public String addBlurb(@ModelAttribute("blurb") Blurb blurb, Model model, Principal principal) {
	 	
	        String username = principal.getName();
	        model.addAttribute("currentUser", userServ.findByUsername(username));
	        
	 	return "newBlurb.jsp";
	 }
	 
	 @PostMapping("/blurbs")
	 public String createBlurb(@Valid @ModelAttribute("blurb") Blurb blurb, BindingResult result) {

	 	if (result.hasErrors()) {
	 		return "newBlurb.jsp";
	 	}
	 	
	 	blurbServ.create(blurb);
	 	
	 	return "redirect:/home";
	 }
	 
//	  TO DELETE BLURBS
	 
	 @RequestMapping("/blurbs/delete/{id}")
		public String deleteBlurb(@PathVariable("id") Long id) {
			Blurb blurb = blurbServ.findBlurb(id);
			blurbServ.deleteBlurb(blurb);
			return "redirect:/home";
		}
//    The most basic object in Spring Security is the SecurityContextHolder. This is where Spring Security stores the details of the present security context of the application, such as the principal currently using the application. In our example, the principal is the current user logged in. But where is Spring Security storing all this information? 
//    If you guessed in HttpSession, you are absolutely correct! Therefore, when using Spring Security, we should NOT access user information directly HttpSession, but instead, via the SecurityContextHolder.
}