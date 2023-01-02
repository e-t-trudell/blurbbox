package com.codingdojo.languages.controllers;

import java.util.List;

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

import com.codingdojo.languages.models.Language;
import com.codingdojo.languages.services.LanguageService;




@Controller
public class LanguageController {
	
	@Autowired
	private LanguageService languageService;
	
	@GetMapping("/")
	public String pre() {
		return "redirect:/languages";
	}
	
	@GetMapping("/languages")
	public String index(Model model, @ModelAttribute("language")Language language) {
		List<Language> languages = languageService.allLanguages();
		model.addAttribute("languages", languages);
		
		return "index.jsp";
	}
	
	@PostMapping("/languages")
	    public String create(@Valid @ModelAttribute("language") Language language, BindingResult result, Model model) {
		System.out.println("lolololololololol");
	        if (result.hasErrors()) {
	        	
	        	System.out.println("an error is supposed to show");
	            return "index.jsp";
	        } else {
	        	System.out.println("the error is occuring before creation");
	            languageService.createLanguage(language);
	            System.out.println("the error is occuring after creation");
	            return "redirect:/languages";
	        }
	}
	
	// Displays one 
	@GetMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageService.findLanguage(id);
		model.addAttribute("language", language);
		
		return "one.jsp";
	}
	
	// BELOW is marked for the editing and updating
		@GetMapping("/languages/edit/{id}")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Language language = languageService.findLanguage(id);
	        model.addAttribute("language", language);
	        return "edit.jsp";
	    }
	    
	    @PutMapping("/update/{id}")
	    public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("language")Language language, BindingResult result, Language l) {
	        if (result.hasErrors()) {
	        	
	            return "edit.jsp";
	        } else {
	            languageService.updateLanguage(language);
	            return "redirect:/languages";
	        }
	    }
	    
	 // Below is simply a shorthand for the same Delete functionality
	    @DeleteMapping("/destroy/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	        languageService.deleteLanguage(id);
	        return "redirect:/languages";
	    }

	    
}

