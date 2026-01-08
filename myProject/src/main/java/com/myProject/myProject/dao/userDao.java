package com.myProject.myProject.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.sound.midi.Soundbank;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.myProject.myProject.models.User;


@Repository
public class userDao {
	@Autowired
    private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }
   @Transactional
    public List<User> getAllUser() {
	   Session session = sessionFactory.getCurrentSession();
       Query<User> query = session.createQuery("from User", User.class);  // Use entity name
       return query.getResultList();
    }
    
    @Transactional
	public User saveUser(User user) {
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode(user.getPassword());  // Hash the password
        user.setPassword(encodedPassword);
		this.sessionFactory.getCurrentSession().saveOrUpdate(user);
		System.out.println("User added with encrypted password:" + user.getId());
        return user;
	}

	@Transactional
	public boolean userExists(String username) {
		Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where username = :username", User.class);
        query.setParameter("username", username);
        return !query.getResultList().isEmpty();
	}
	
	@Transactional
	public boolean userExistsByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where email = :email", User.class);
        query.setParameter("email", email);
        return !query.getResultList().isEmpty();
	}
	
	@Transactional
	public User getUserByEmail(String email) {
		Session session = sessionFactory.getCurrentSession();
        Query<User> query = session.createQuery("from User where email = :email", User.class);
        query.setParameter("email", email);
	        
        try {
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    	}
	
	@Transactional
	public User updateUser(User user) {
	    Session session = sessionFactory.getCurrentSession();
	    session.update(user);   // Hibernate will update the existing row
	    return user;
	}
}