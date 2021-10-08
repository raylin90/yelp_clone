package com.spring.yelpclone.controllers;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.services.RestaurantService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/")
	public String homePage() {
		return "index.jsp";
	}
	
	@GetMapping("/create/restaurant")
	public String createNewRest(@ModelAttribute("restaurant") Restaurant restaurant) {
		return "restaurant/create.jsp";
	}
	
	@PostMapping("/add/restaurant")
	public String addNewRest(@Valid @ModelAttribute("restaurant") Restaurant restaurant, BindingResult result) {
        if (result.hasErrors()) {
        	System.out.println("ERROR");
            return "restaurant/create.jsp";
        } else {
        	System.out.println("HERE");
        	this.restaurantService.saveRestaurant(restaurant);
            return "redirect:/";
        }
	}
}
