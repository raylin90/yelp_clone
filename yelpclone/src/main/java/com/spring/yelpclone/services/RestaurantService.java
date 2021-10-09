package com.spring.yelpclone.services;

import java.util.List;
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
		return this.restaurantRepo.save(restaurant);
	}
	
	// find all restaurants at database
	public List<Restaurant> findAllRestaurant() {
		return (List<Restaurant>) this.restaurantRepo.findAll();
	}
	
	// find one restaurant
	public Restaurant findOneRestaurant(Long id) {
		return this.restaurantRepo.findById(id).orElse(null);
	}
}
