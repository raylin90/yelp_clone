package com.spring.yelpclone.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.models.Review;
import com.spring.yelpclone.services.RestaurantService;
import com.spring.yelpclone.services.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping("/create/review/restaurant/{id}")
	public String createReview(@PathVariable("id") Long id,  HttpSession session, Model model, @ModelAttribute("review") Review review) {
		
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
		
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		
		return "review/create.jsp";
	}

}
