package com.erictrudell.blurbbox.controllers;

import java.security.Principal;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.erictrudell.blurbbox.models.Blurb;
import com.erictrudell.blurbbox.models.User;
import com.erictrudell.blurbbox.repositories.UserRepository;
import com.erictrudell.blurbbox.services.BlurbService;
import com.erictrudell.blurbbox.services.UserService;

@Controller
@RequestMapping("/blurb")
public class BlurbController {
	// Schwoop die whoop test comment lol
	// another cool comment!
	@Autowired
	private BlurbService blurbServ;
	@Autowired
	private UserService userServ;
	@Autowired
	private UserRepository userRepo;
	
//	Removed Corbett's blurb functions as they were combined here -ET
	@GetMapping("/addBlurb")
	public String getCreateView(Model model,
			Principal principal) {
		model.addAttribute("blurb", new Blurb());
		String username = principal.getName();
		User user = userRepo.findByUsername(username);
		model.addAttribute("user", user);
		return "newBlurb.jsp";
	}
	
	@PostMapping("/create")
	public String createNewBlurb(@Valid @ModelAttribute("blurb") Blurb blurb,
			BindingResult result,
			Principal principal,
			Model model) {
		if(result.hasErrors()) {
			return "newBlurb.jsp";
		} else {
			String username = principal.getName();
	    	User userOne = userServ.findByUsername(username);
	    	Long userId = userOne.getId();
	    	blurb.setUser(userOne);
	    	
			blurbServ.create(blurb);
			System.out.println("Blurb created");
			return "redirect:/home";
		}
	}
	
	@GetMapping("/{id}/view")
	public String viewOne(@PathVariable("id") Long blurbId, Model model) {
		model.addAttribute("blurb", blurbServ.findBlurb(blurbId));
		return "oneBlurb.jsp";
	}
	
	@GetMapping("/{id}/edit")
	public String editView(@PathVariable("id") Long blurbId, Model model) {
		model.addAttribute("blurb", blurbServ.findBlurb(blurbId));
		return "editBlurb.jsp";
	}
	
	@PostMapping("/{id}/update")
	public String updateBlurb(@Valid @ModelAttribute("blurb") Blurb blurb, 
			BindingResult result, 
			@PathVariable("id") Long blurbId) {
		if(result.hasErrors()) {
			return "editBlurb.jsp";
		} else {
			blurbServ.updateBlurb(blurb);
			return "redirect:/blurb/{id}/view";
		}
	}
	
	@GetMapping("/{id}/delete")
	public String deleteBlurb(@PathVariable("id") Long blurbId) {
		Blurb blurb = blurbServ.findBlurb(blurbId);
		blurbServ.deleteBlurb(blurb);
		return "redirect:/home";
	}

	
}