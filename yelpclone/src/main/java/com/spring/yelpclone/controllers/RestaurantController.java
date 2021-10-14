package com.spring.yelpclone.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
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
import com.spring.yelpclone.models.Review;
import com.spring.yelpclone.services.RestaurantService;
import com.spring.yelpclone.services.ReviewService;

@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private ReviewService reviewService;
	
	// base route for all the restaurant
	@GetMapping("/")
	public String homePage(Model model, HttpSession session) {
		List<Restaurant> allRestaurants = this.restaurantService.findAllRestaurant();
		model.addAttribute("allRestaurants", allRestaurants);
		
		// check if there's any user login, if yes, set the session, otherwise return null; ( we use it to display front-end button)
		Long loginUserId = (Long) session.getAttribute("user_id");
		Boolean isUserLogin = false;
		if(loginUserId != null) {
			isUserLogin = true;
		} else {
			isUserLogin = false;
		}
		// System.out.println(isUserLogin);
		// System.out.println(loginUserId);
		model.addAttribute("isUserLogin", isUserLogin);
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
		System.out.println(restaurant);
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
		
		// find all the reviews
		List<Review> reviews = this.reviewService.findAllReviewsByRestaurant(id);
		model.addAttribute("reviews", reviews);
		
		// how many count of review(s) per restaurant
		int count = reviews.size();
		System.out.println(count);
		model.addAttribute("count", count);
		
		if(count == 0) {
			String totalRating = "0%";
			model.addAttribute("totalRating", totalRating);	
		} else {
			String totalRating = this.reviewService.findAvgReview(reviews, count);
			model.addAttribute("totalRating", totalRating);	
		}
		return "restaurant/view.jsp";
	}
	
	// edit a restaurant (view page)
	@GetMapping("/edit/restaurant/{id}")
	public String editOneRestaurant(@PathVariable("id") Long id, Model model) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		return "restaurant/edit.jsp";
	}
	
	// update a restaurant (post route)
	@PostMapping("/update/restaurant/{id}")
	public String updateOneRestaurant(@PathVariable("id") Long id, @Valid @ModelAttribute("oneRestaurant") Restaurant restaurant, BindingResult result) {
        if (result.hasErrors()) {
            return "restaurant/edit.jsp";
        } else {
        	this.restaurantService.saveRestaurant(restaurant);
    			return "redirect:/view/restaurant/" + id;
        }
	}
}
