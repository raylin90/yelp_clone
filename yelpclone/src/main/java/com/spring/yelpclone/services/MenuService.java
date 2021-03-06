package com.spring.yelpclone.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.yelpclone.models.Menu;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.repositories.MenuRepository;

@Service
public class MenuService {
	
	@Autowired
	private MenuRepository menuRepo;
	
	// save menu to database with image
	public Menu saveMenu(Restaurant restaurant, String title, String description, String price, String url_image) {
		Menu newMenu = new Menu(title, description, price, url_image, restaurant);
		return this.menuRepo.save(newMenu);
	}
	
	// save menu to database without image
	public Menu saveMenu(Restaurant restaurant, String title, String description, String price) {
		Menu newMenu = new Menu(title, description, price, restaurant);
		return this.menuRepo.save(newMenu);
	}
	
	public Menu findMenuById(Long menuId) {
		return this.menuRepo.findById(menuId).orElse(null);
	}
	
	public Menu updateMenu(Restaurant oneRestaurant, String title, String description, String price, String url,
			Long menuId) {
		Menu m = this.menuRepo.findById(menuId).orElse(null);
		m.setTitle(title);
		m.setDescription(description);
		m.setPrice(price);
		m.setImage_url(url);
		m.setRestaurant(oneRestaurant);
		return this.menuRepo.save(m);
	}
	
	public Menu updateMenu(Restaurant oneRestaurant, String title, String description, String price, Long menuId) {
		Menu m = this.menuRepo.findById(menuId).orElse(null);
		m.setTitle(title);
		m.setDescription(description);
		m.setPrice(price);
		// get the url path from database so if user didn't upload pic_url, it will use the one at database instead of override it
		String url = m.getImage_url();
		m.setImage_url(url);
		m.setRestaurant(oneRestaurant);
		return this.menuRepo.save(m);
		
	}

	public void deleteMenuByid(Long menuId) {
		this.menuRepo.deleteById(menuId);;
	}

}
