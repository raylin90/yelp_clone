package com.spring.yelpclone.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.spring.yelpclone.models.LoginUser;
import com.spring.yelpclone.models.User;
import com.spring.yelpclone.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
    @GetMapping("/register")
    public String index(@ModelAttribute("newUser") User user, @ModelAttribute("newLogin") LoginUser loginser) {
        return "index.jsp";
    }
    
    @PostMapping("/register2")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session, @ModelAttribute("newLogin") LoginUser loginuser) {
    	// pass to validate more
        this.userService.register(newUser, result);
        if(result.hasErrors()) {
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session, @ModelAttribute("newLogin") LoginUser loginUser) {
    	// pass to validate more
    	User user = this.userService.login(newLogin, result);
        if(result.hasErrors()) {
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
    }
}