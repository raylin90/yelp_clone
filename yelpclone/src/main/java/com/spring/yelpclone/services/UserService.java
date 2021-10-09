package com.spring.yelpclone.services;

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.spring.yelpclone.models.LoginUser;
import com.spring.yelpclone.models.User;
import com.spring.yelpclone.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	// registration customized validation
	public User register(User newUser, BindingResult result) {
		// validate that the newUser object email does exist at database or not, if yes:
		if(this.userRepository.findByEmail(newUser.getEmail()).isPresent()) {
		    result.rejectValue("email", "Unique", "This email is already in use!");
		}
		// validate if the password and confirm password match or not, if not:
		if(!newUser.getPassword().equals(newUser.getPasswordConfirm())) {
		    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		// if result have any error after above customized validation:
		if(result.hasErrors()) {
		    return null;
		} else {
			// hash the password
		    String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		    // set password to hashed password
		    newUser.setPassword(hashed);
		    // save it
		    return this.userRepository.save(newUser);
		}
	}
	
	// login customized validation
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
		    return null;
		}
		// check if database has this email or not
		Optional<User> potentialUser = this.userRepository.findByEmail(newLogin.getEmail());
		// if database came back with no present, flash message
		if(!potentialUser.isPresent()) {
		    result.rejectValue("email", "Unique", "Invalid Login!");
		    return null;
		}
		// else, found, and get user object:
		User user = potentialUser.get();
		// get the password and hash it and see if match or not.
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
		    result.rejectValue("password", "Matches", "Invalid Login!");
		}
		if(result.hasErrors()) {
		    return null;
		} else {
		    return user;
		}
	}
}
