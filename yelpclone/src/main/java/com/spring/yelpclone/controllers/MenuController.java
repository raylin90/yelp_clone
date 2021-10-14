package com.spring.yelpclone.controllers;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.spring.yelpclone.models.Menu;
import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.services.MenuService;
import com.spring.yelpclone.services.RestaurantService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private RestaurantService restaurantService;
	// to store the image that user upload
	private String uploaded_folder="src/main/webapp/images/";
	
	// page to view all menus for particular restaurant
	@GetMapping("/view/restaurant/{id}/menus")
	public String viewAllMenus(@PathVariable("id") Long id, Model model, HttpSession session ,Model model2) {
		// check if there's any user login, if yes, set the session, otherwise return null; ( we use it to display front-end button)
		Long loginUserId = (Long) session.getAttribute("user_id");
		Boolean isUserLogin = false;
		if(loginUserId != null) {
			isUserLogin = true;
		} else {
			isUserLogin = false;
		}
		model2.addAttribute("isUserLogin", isUserLogin);
		// System.out.println(isUserLogin);
		
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		return "menu/viewAll.jsp";
	}
	
	// create a menu for particular restaurant
	@GetMapping("/create/menu//restaurant/{id}")
	public String createMenu(@PathVariable("id") Long id, Model model) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		return "menu/create.jsp";
	}
	
	// save menu to particular restaurant
	@PostMapping("/save/menu/restaurant/{id}")
	public String saveMenu(@PathVariable("id") Long id, @RequestParam("title") String title, @RequestParam("description") String description, @RequestParam("price") String price, @RequestParam("image_url") MultipartFile file, RedirectAttributes redirectAttributes) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		// System.out.println(price);
		// check if input is number or not, if yes, process, if not, reject the request
		try {
			Double.parseDouble(price);
		} catch (NumberFormatException e) {
			redirectAttributes.addFlashAttribute("message", "please enter a valid number");
			return "redirect:/create/menu/restaurant/" + id;
		}
		// if user uploaded a file
		if(!file.isEmpty()) {
			try {
				// convert the file to byte code
				byte[] bytes = file.getBytes();
				// create a path where we want to store the image
				Path path = Paths.get(uploaded_folder + file.getOriginalFilename());
				// execute above two steps, by putting the byte code to path (save to folder)
				Files.write(path, bytes);
				// this is going to actually make a record in our DB about the location of the uploaded file
				String url = "/images/" + file.getOriginalFilename();
				// save the information into database
				this.menuService.saveMenu(oneRestaurant, title.toUpperCase(), description, price, url);
			} catch(IOException e) {
				// if running into error, print the error
				e.printStackTrace();
			}
			
		}
		// if user didn't upload a file
		if(file.isEmpty()) {
			String url = "/images/default.png";
			this.menuService.saveMenu(oneRestaurant, title.toUpperCase(), description, price, url);
		}
		
		return "redirect:/view/restaurant/" + id + "/menus";
	}
	
	@GetMapping("/view/restaurant/{id}/menus/{id2}")
	public String editMenu(@PathVariable("id") Long restId, @PathVariable("id2") Long menuId, Model model) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(restId);
		model.addAttribute("oneRestaurant", oneRestaurant);
		Menu menu = this.menuService.findMenuById(menuId);
		model.addAttribute("menu", menu);
		return "menu/edit.jsp";
	}
	
	@PostMapping("/update/restaurant/{id}/menus/{id2}")
	public String updateMenu(@PathVariable("id") Long restId, @PathVariable("id2") Long menuId, @RequestParam("title") String title, @RequestParam("description") String description, @RequestParam("price") String price, @RequestParam("image_url") MultipartFile file, RedirectAttributes redirectAttributes) {
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(restId);
		// check if input is number or not, if yes, process, if not, reject the request
		try {
			Double.parseDouble(price);
		} catch (NumberFormatException e) {
			redirectAttributes.addFlashAttribute("message", "please enter a valid number");
			return "redirect:/view/restaurant/" + restId+ "/menus/" + menuId;
		}
		// if user uploaded a file
		if(!file.isEmpty()) {
			System.out.println("not empty");
			try {
				// convert the file to byte code
				byte[] bytes = file.getBytes();
				// create a path where we want to store the image
				Path path = Paths.get(uploaded_folder + file.getOriginalFilename());
				// execute above two steps, by putting the byte code to path (save to folder)
				Files.write(path, bytes);
				// this is going to actually make a record in our DB about the location of the uploaded file
				String url = "/images/" + file.getOriginalFilename();
				// save the information into database
				this.menuService.saveMenu(oneRestaurant, title.toUpperCase(), description, price, url , menuId);
			} catch(IOException e) {
				// if running into error, print the error
				e.printStackTrace();
			}
			
		}
		// if user didn't upload a file
		if(file.isEmpty()) {
			System.out.println("empty");
			String url = "/images/default.png";
			this.menuService.saveMenu(oneRestaurant, title.toUpperCase(), description, price, url, menuId);
		}
		
		return "redirect:/view/restaurant/" + restId + "/menus";
	}
	
	@GetMapping("/delete/restaurant/{id}/menus/{id2}")
	public String deleteMenu(@PathVariable("id") Long restId, @PathVariable("id2") Long menuId) {
		this.menuService.deleteMenuByid(menuId);
		return "redirect:/view/restaurant/" + restId + "/menus";
	}
}