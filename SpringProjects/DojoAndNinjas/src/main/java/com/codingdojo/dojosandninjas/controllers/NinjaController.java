//package com.codingdojo.dojosandninjas.controllers;
//
//import java.util.List;
//
//import javax.validation.Valid;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.codingdojo.dojosandninjas.models.Dojo;
//import com.codingdojo.dojosandninjas.models.Ninja;
//import com.codingdojo.dojosandninjas.services.AppService;
//
//@Controller
//@RequestMapping("/ninjas")
//public class NinjaController {
//	@Autowired
//	private AppService appService;
//	
//	@GetMapping("/new")
//	public String addNinja(@ModelAttribute("ninja") Ninja ninja, Model viewModel) {
//		List<Dojo> allDojos = this.appService.allDojos();
//		viewModel.addAttribute("allDojos", allDojos);
//		
//		return "newNinja.jsp";
//	}
//	
//	@PostMapping("/create")
//	public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model viewModel) {
//		if (result.hasErrors()) {
//			List<Dojo> allDojos = this.appService.allDojos();
//			viewModel.addAttribute("allDojos", allDojos);
//			return "newNinja.jsp";
//		} else {
//			appService.createNinja(ninja);
//			return "redirect:/dojo/" + ninja.getDojo().getId();
//		}
//	}
//}
