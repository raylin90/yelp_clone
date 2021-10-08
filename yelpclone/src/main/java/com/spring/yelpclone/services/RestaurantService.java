package com.spring.yelpclone.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.repositories.RestaurantRepository;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantRepository restaurantRepo;
	
	// save a restaurant to database
	public Restaurant saveRestaurant(Restaurant restaurant) {
    	System.out.println("HERE 2");
		return this.restaurantRepo.save(restaurant);
	}
}
