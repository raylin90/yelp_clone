package com.spring.yelpclone.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.spring.yelpclone.services.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/create/review/restaurant/{id}")
	public String createReview(@PathVariable("id") Long id) {
		return "review/create.jsp";
	}

}
