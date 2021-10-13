package com.spring.yelpclone.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.models.Review;
import com.spring.yelpclone.models.User;
import com.spring.yelpclone.repositories.RestaurantRepository;
import com.spring.yelpclone.repositories.ReviewRepository;
import com.spring.yelpclone.repositories.UserRepository;

@Service
public class ReviewService {

	@Autowired
	private ReviewRepository reviewRepo;
	@Autowired
	private RestaurantRepository restaurantRepo;
	@Autowired
	private UserRepository userRepository;
	

	public Review saveReview(Long userId, Long restaurantId, String rating, String comment) {
		User u = this.userRepository.findById(userId).orElse(null);
		Restaurant r = this.restaurantRepo.findById(restaurantId).orElse(null);
		Review newReview = new Review(rating, comment);
		// System.out.println(u);
		// System.out.println(r);
		// System.out.println(newReview);
		newReview.setRestaurant(r);
		newReview.setUser(u);
		return this.reviewRepo.save(newReview);
		
	}
	
	public Review saveReview(Long userId, Long restaurantId, String rating, String comment, String file) {
		User u = this.userRepository.findById(userId).orElse(null);
		Restaurant r = this.restaurantRepo.findById(restaurantId).orElse(null);
		Review newReview = new Review(rating, comment, file);
		newReview.setRestaurant(r);
		newReview.setUser(u);
		return this.reviewRepo.save(newReview);
	}
}
