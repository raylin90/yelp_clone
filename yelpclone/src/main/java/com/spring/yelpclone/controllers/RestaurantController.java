package com.spring.yelpclone.controllers;

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

import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.services.RestaurantService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	// base route for all the restaurant
	@GetMapping("/")
	public String homePage(Model model) {
		List<Restaurant> allRestaurants = this.restaurantService.findAllRestaurant();
		model.addAttribute("allRestaurants", allRestaurants);
		return "index.jsp";
	}
	
	// route to create a new restaurant
	@GetMapping("/create/restaurant")
	public String createNewRest(@ModelAttribute("restaurant") Restaurant restaurant) {
		return "restaurant/create.jsp";
	}
	
	// POST route to add the new restaurant to database
	@PostMapping("/add/restaurant")
	public String addNewRest(@Valid @ModelAttribute("restaurant") Restaurant restaurant, BindingResult result) {
        if (result.hasErrors()) {
            return "restaurant/create.jsp";
        } else {
        	this.restaurantService.saveRestaurant(restaurant);
            return "redirect:/";
        }
	}
	
	// view a restaurant
	@GetMapping("/view/restaurant/{id}")
	public String viewOneRestaurant(@PathVariable("id") Long id, Model model) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		return "restaurant/view.jsp";
	}
}
