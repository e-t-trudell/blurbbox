package com.example.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HomeController {
	@RequestMapping("")
	public String index() {
		return "Hello pisssssaaaaaaaaaaaaa";
	}
	@RequestMapping("/world")
	public String world() {
		return "Class level annotations are cool too!";
	}
}
