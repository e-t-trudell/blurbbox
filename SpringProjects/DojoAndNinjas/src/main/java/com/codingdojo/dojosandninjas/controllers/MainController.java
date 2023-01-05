package com.codingdojo.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.models.Ninja;
import com.codingdojo.dojosandninjas.services.AppService;


@Controller
public class MainController {
	
	@Autowired
	private AppService appService;
	
	@GetMapping("/")
	public String pre() {
		return "redirect:/dojos/new";
	}
	
	
	@GetMapping("/dojos/new")
	public String index(Model model, @ModelAttribute("dojo")Dojo dojo) {
		
		return "newDojo.jsp";
	}
	
	@PostMapping("/dojos/create")
    public String create(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		System.out.println("lolololololololol");
	        if (result.hasErrors()) {
	        	
	        	System.out.println("an error is supposed to show");
	            return "newDojo.jsp";
	        } else {
	        	
	            appService.createDojo(dojo);
	            return "redirect:/ninja/new";
	        }
	}
	
	@GetMapping("/ninja/new")
	public String addNinja(@ModelAttribute("ninja") Ninja ninja, Model viewModel) {
		List<Dojo> allDojos = this.appService.allDojos();
		viewModel.addAttribute("allDojos", allDojos);
		
		return "newNinja.jsp";
	}
	
	@PostMapping("/ninja/create")
	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model viewModel) {
		if (result.hasErrors()) {
			List<Dojo> allDojos = this.appService.allDojos();
			viewModel.addAttribute("allDojos", allDojos);
			return "newNinja.jsp";
		} else {
			appService.createNinja(ninja);
			return "redirect:/dojos/" + ninja.getDojo().getId();
		}
	}
	
	// this line of code below will be a little bit different from previous iterations since 
	// we will be doing a one to many relationship.
	
	@GetMapping("/dojos/{id}")
	public String Dojo(Model viewModel, @PathVariable("id") Long id) {
		viewModel.addAttribute("dojo", this.appService.getOneDojo(id));
		System.out.println("the page is trying to render");
		return "allDojos.jsp";
	// yes Im very aware that the name allDojos isnt really related to what its actually doing, but lets roll with it for now
	}	
	
}
