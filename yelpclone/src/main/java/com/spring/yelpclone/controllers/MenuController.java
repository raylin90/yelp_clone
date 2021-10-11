package com.spring.yelpclone.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.spring.yelpclone.services.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
}
