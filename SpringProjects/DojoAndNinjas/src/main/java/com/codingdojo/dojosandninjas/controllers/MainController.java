package com.codingdojo.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosandninjas.models.Dojo;
import com.codingdojo.dojosandninjas.services.DojoService;
import com.codingdojo.dojosandninjas.services.NinjaService;


@Controller
public class MainController {
	
	@Autowired
	private DojoService dojoService;
	private NinjaService ninjaService;
	
	@GetMapping("/")
	public String pre() {
		return "redirect:/dojos/new";
	}
	
	
	@GetMapping("/dojos/new")
	public String index(Model model, @ModelAttribute("dojo")Dojo dojo) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		
		return "newDojo.jsp";
	}
	
	@PostMapping("/dojos/new")
    public String create(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		System.out.println("lolololololololol");
	        if (result.hasErrors()) {
	        	
	        	System.out.println("an error is supposed to show");
	            return "newDojo.jsp";
	        } else {
	        	
	            dojoService.createDojo(dojo);
	            
	            return "redirect:/dojos/{id}";
	        }
	}
	
	@GetMapping("dojos/{id}")
	public String Dojo(Model model, @ModelAttribute("dojo")Dojo dojo) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		
		return "allDojos.jsp";
	// yes Im very aware that the name allDojos isnt really related to what its actually doing, but lets roll with it for now
	}	
	
}
