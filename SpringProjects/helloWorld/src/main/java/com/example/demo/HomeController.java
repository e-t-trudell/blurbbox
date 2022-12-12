package com.example.demo;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("")
public class HomeController {
	@RequestMapping("/")
	public String begin() {
		return "demo.jsp";
	}
	@RequestMapping("/index")
	public String index(@RequestParam(value="q", required=false) String searchQuery) {
		if(searchQuery == null) {
			return "You searched for: Nothing";
		} else {
			return "Hello, you searched for: " + searchQuery;
		}
		
	}
	
	@RequestMapping("/goodbye")
	public String world() {
		return "<h1 style='color: red;'>Hello World </h1>";
	}
	
	@RequestMapping("/m/{track}/{module}/{lesson}")
    public String showLesson(@PathVariable("track") String track, @PathVariable("module") String module, @PathVariable("lesson") String lesson){
    	return "Track: " + track + ", Module: " + module + ", Lesson: " + lesson;
    }
}
