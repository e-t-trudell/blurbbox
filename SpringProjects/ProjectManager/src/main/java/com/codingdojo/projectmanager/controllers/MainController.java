package com.codingdojo.projectmanager.controllers;



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
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.projectmanager.models.LoginUser;
import com.codingdojo.projectmanager.models.Project;
import com.codingdojo.projectmanager.models.User;
import com.codingdojo.projectmanager.services.ProjectService;
import com.codingdojo.projectmanager.services.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService userServ;
	
	@Autowired
	private ProjectService projectServ;
	
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
    
        return "redirect:/home";
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
        
    
        return "redirect:/home";
    }
    
    // the bottom is important because we want to make sure we can log the user OUT of session
    // if we dont do this their account may be easy to access for unwanted visitors
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.setAttribute("userId", null);
    	return "redirect:/";
    }
    
    @GetMapping("/home")
    public String welcome(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findById(userId);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("unassignedProjects", projectServ.getUnassignedProjects(user));
    	model.addAttribute("assignedProjects", projectServ.getAssignedProjects((user)));
    	return "home.jsp";
    }
    
    @GetMapping("/projects/new")
    public String newProject(@ModelAttribute("project") Project project, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	model.addAttribute("userId", userId);
    	return "new_project.jsp";
    }
    
    @PostMapping("/projects/add")
    public String addProject(@Valid @ModelAttribute("project") Project project, BindingResult result , HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	if(result.hasErrors()) {
    		return "new_project.jsp";
    	}else {
    		projectServ.addProject(project);
    		
    		Long userId = (Long) session.getAttribute("userId");
    		User user = userServ.findById(userId);
    		user.getProjects().add(project);
    		userServ.updateUser(user);
    		return "redirect:/home";
    	}
    }
    
    @GetMapping("/projects/{id}")
    public String showProject(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Project project = projectServ.findById(id);
    	model.addAttribute("project", project);
    	return "show.jsp";
    	
    }
    
    @RequestMapping("/home/join/{id}")
    public String joinTeam(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "retdirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	Project project = projectServ.findById(id);
    	User user = userServ.findById(userId);
    	
    	user.getProjects().add(project); // this part adds the user to a project 
    	userServ.updateUser(user);
    	
    	model.addAttribute("user", user);
    	model.addAttribute("unassignedProjects", projectServ.getUnassignedProjects(user));
    	model.addAttribute("assignedProjects", projectServ.getAssignedProjects(user));
    	
    	return "redirect:/home";
    }
    
    @RequestMapping("/home/leave/{id}")
    public String leaveTeam(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	Project project = projectServ.findById(id);
    	User user = userServ.findById(userId);
    	
    	user.getProjects().remove(project); // this removes a user from a project 
    	userServ.updateUser(user); 
    	
    	model.addAttribute("user", user);
    	model.addAttribute("unassignedProjects", projectServ.getUnassignedProjects(user));
    	model.addAttribute("assignedProjects", projectServ.getAssignedProjects(user));
    	
    	return "redirect:/home";
    }
    
    @GetMapping("/projects/edit/{id}")
    public String editProject(@PathVariable("id") Long id, HttpSession session, Model model) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Project project = projectServ.findById(id);
    	model.addAttribute("project", project);
    	return "edit.jsp";
    }
    
    @PostMapping("/projects/update/{id}")
    public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("project") Project project,
    		BindingResult result, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	
    	User user = userServ.findById(userId);
    	
    	if(result.hasErrors()) {
    		return "edit.jsp";
    	}else {
    		Project mainProject = projectServ.findById(id);
    		project.setUsers(mainProject.getUsers());
    		project.setLead(user);
    		projectServ.updateProject(project);
    		return "redirect:/home";
    	}
    }
    
    
    @DeleteMapping("/projects/delete/{id}")
    public String destroy(@PathVariable("id") Long id, HttpSession session) {
    	
    	if(session.getAttribute("userId")== null) {
    		return "redirect:/";
    	}
    	
    	Project project = projectServ.findById(id);
        projectServ.deleteProject(project);
        return "redirect:/home";
    }
    
}
