package com.spring.yelpclone.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.spring.yelpclone.models.Menu;

@Repository
public interface MenuRepository extends CrudRepository<Menu, Long> {

}
