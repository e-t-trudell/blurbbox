package com.erictrudell.blurbbox.controllers;

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
import com.erictrudell.blurbbox.services.BlurbService;

@Controller
@RequestMapping("/blurb")
public class BlurbController {
	@Autowired
	BlurbService blurbServ;
	
	@GetMapping("/create")
	public String getCreateView(Model model) {
		model.addAttribute("model", new Blurb());
		return "newBlurb.jsp";
	}
	
	@PostMapping("/create")
	public String createNewBlurb(@Valid @ModelAttribute("blurb") Blurb blurb, BindingResult result) {
		if(result.hasErrors()) {
			return "newBlurb.jsp";
		} else {
			blurbServ.create(blurb);
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
	
	@PutMapping("/{id}/edit")
	public String updateBlurb(@Valid @ModelAttribute("blurb") Blurb blurb, BindingResult result, @PathVariable("id") Long blurbId) {
		if(result.hasErrors()) {
			return "editBlurb.jsp";
		} else {
			blurbServ.updateBlurb(blurb);
			return "redirect:/{id}/view";
		}
	}
	
	@DeleteMapping("/{id}/delete")
	public String deleteBlurb(@PathVariable("id") Long blurbId) {
		Blurb blurb = blurbServ.findBlurb(blurbId);
		blurbServ.deleteBlurb(blurb);
		return "redirect:/home";
	}
}