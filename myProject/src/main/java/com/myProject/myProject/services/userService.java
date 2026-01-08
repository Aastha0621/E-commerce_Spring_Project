package com.myProject.myProject.services;

import com.myProject.myProject.models.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.myProject.myProject.dao.userDao;
import com.myProject.myProject.models.User;

@Service
public class userService {
	@Autowired
	private userDao userDao;
	
	public List<User> getUsers(){
		return this.userDao.getAllUser();
	}
	
	public User addUser(User user) {
		try {
			return this.userDao.saveUser(user);
		} catch (DataIntegrityViolationException e) {
			// handle unique constraint violation, e.g., by throwing a custom exception
			throw new RuntimeException("Add user error");
		}
	}
	
	public boolean checkUserExists(String username) {
		return this.userDao.userExists(username);
	}
	
	public boolean checkUserExistsByEmial(String email) {
		return this.userDao.userExistsByEmail(email);
	}

	
	public User getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }
	
	public User updateUser(User user) {
        return userDao.updateUser(user);   // we'll create this in DAO
    }
}
