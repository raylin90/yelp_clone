package com.spring.yelpclone.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.spring.yelpclone.models.Restaurant;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, Long> {

	List<Restaurant> findByCategory(String type);

}
