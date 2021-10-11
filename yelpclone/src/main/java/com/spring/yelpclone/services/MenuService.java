package com.spring.yelpclone.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.yelpclone.repositories.MenuRepository;

@Service
public class MenuService {
	
	@Autowired
	private MenuRepository menuRepo;
}
