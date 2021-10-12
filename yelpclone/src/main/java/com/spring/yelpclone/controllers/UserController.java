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
	
	// register route (view page)
    @GetMapping("/register")
    public String index(@ModelAttribute("newUser") User user) {
        return "user/register.jsp";
    }
    
    // post route to save on database
    @PostMapping("/signup")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
    		// pass for customized validation
        this.userService.register(newUser, result);
        if(result.hasErrors()) {
            return "user/register.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/";
    }
    
	// login route (view page)
    @GetMapping("/login")
    public String login(@ModelAttribute("newLogin") LoginUser newLogin) {
    		return "user/login.jsp";
    }
    
    // post route to login
    @PostMapping("/return/user")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
    	// pass to validate more
    	User user = this.userService.login(newLogin, result);
        if(result.hasErrors()) {
    			return "user/login.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/";
    }
    
    @GetMapping("/logout")
    public String signOut(HttpSession session) {
    		session.invalidate();
    		return "redirect:/";
    }
}
