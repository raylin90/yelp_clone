package com.spring.yelpclone.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import com.spring.yelpclone.services.RestaurantService;


@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
}
