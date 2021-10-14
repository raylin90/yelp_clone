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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.yelpclone.models.Restaurant;
import com.spring.yelpclone.models.Review;
import com.spring.yelpclone.services.RestaurantService;
import com.spring.yelpclone.services.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	private String uploaded_folder="src/main/webapp/images/";
	
	// view review page
	@GetMapping("/create/review/restaurant/{id}")
	public String createReview(@PathVariable("id") Long id,  HttpSession session, Model model, @ModelAttribute("review") Review review, RedirectAttributes redirectAttribute) {
		
		// check if there's any user login, if yes, set the session, otherwise return null; ( we use it to display front-end button)
		Long loginUserId = (Long) session.getAttribute("user_id");
		Boolean isUserLogin = false;
		if(loginUserId != null) {
			isUserLogin = true;
		} else {
			isUserLogin = false;
			redirectAttribute.addFlashAttribute("message", "Please login before posting a review");
			return "redirect:/login";
		}
		// System.out.println(isUserLogin);
		// System.out.println(loginUserId);
		model.addAttribute("isUserLogin", isUserLogin);
		
		Restaurant oneRestaurant = this.restaurantService.findOneRestaurant(id);
		model.addAttribute("oneRestaurant", oneRestaurant);
		
		return "review/create.jsp";
	}
	
	//save review
	@PostMapping("/save/review/restaurant/{id}")
	public String saveReview(@PathVariable("id") Long id, @RequestParam(value="rating", required=false) String rating, @RequestParam("comment") String comment, @RequestParam("pic_url") MultipartFile file, RedirectAttributes redirectAttributes, HttpSession session) {

//		 System.out.println(rating);
		// System.out.println(comment);
		// System.out.println(file);
		// validation
		if(comment.isEmpty() || rating == null) {
			redirectAttributes.addFlashAttribute("message", "rating and comment are required");
			return "redirect:/create/review/restaurant/" + id;
		}
		
		
		Long loginUserId = (Long) session.getAttribute("user_id");
		Long restaurantId = id;
		
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
				this.reviewService.saveReview(loginUserId, restaurantId, rating, comment, url);
			} catch(IOException e) {
				// if running into error, print the error
				e.printStackTrace();
			}
			
		}
		// if user didn't upload a file
		if(file.isEmpty()) {
			this.reviewService.saveReview(loginUserId, restaurantId, rating, comment);
		}
		return "redirect:/view/restaurant/" + id;
	}

}
