package com.spring.yelpclone.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.spring.yelpclone.models.Restaurant;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, Long> {

}
