package com.spring.yelpclone.services;

import java.util.List;

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

	public List<Review> findAllReviewsByRestaurant(Long restaurantId) {
		return (List<Review>) this.reviewRepo.findByrestaurant_id(restaurantId);
	}

	public String findAvgReview(List<Review> reviews, int count) {
		// get the average review percentage per restaurant
		double sum = 0;
		for(int i = 0; i < reviews.size(); i++) {
			// get the rating percentage (it's a string with % at end)
			String strRating = reviews.get(i).getRating();
			// System.out.println(strRating);
			// remove the % at the end
			String newStrRating = strRating.substring(0, strRating.length()-1);
			// System.out.println(newStrRating);
			// parse it to double
			double numRating = Double.parseDouble(newStrRating);
			// System.out.println(numRating);
			sum += numRating;
		}
		// find the average
		double avg = sum / count;
		// convert back to string with %
		String totalRating = String.valueOf(avg + "%");
//		System.out.println(totalRating);
		return totalRating;
	}
}
