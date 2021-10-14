package com.spring.yelpclone.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.spring.yelpclone.models.Review;

@Repository
public interface ReviewRepository extends CrudRepository<Review, Long> {

	List<Review> findByrestaurant_id(Long restaurantId);

}
