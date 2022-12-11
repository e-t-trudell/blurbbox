package com.codingdojo.daichivariables;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/daikichi")
public class DaikichiController {
	@RequestMapping("")
	public String welcome() {
		return "Welcome";
	}
	
	@RequestMapping("/")
	public String today() {
		return "Today you will find luck in all your endeavors!";
	}
	
	@RequestMapping("/tomorrow")
	public String tomorrwo() {
		return "Tomorrow, an oppurtunity will arise, so be sure to open to new ideas!";
	}
	
	@RequestMapping("/travel/{city}")
	public String travel(@PathVariable String city) {
		return "Congratulations! You will soon travel to " + city;
	}
	
	@RequestMapping("/lotto/{number}")
	public String lottery(@PathVariable int number) {
		if (number % 2 == 0) {
			return "You will take a grand journey in the near future, but the weary of tempting offers";
		}
		else {
			return "You have enjoyed the fruits of your labor but now is a great time to spend time with family and friends";
		}
			
	}
}
