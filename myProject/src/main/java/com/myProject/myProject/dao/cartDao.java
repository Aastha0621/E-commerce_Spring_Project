package com.myProject.myProject.dao;

import com.myProject.myProject.models.Cart;
import com.myProject.myProject.models.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class cartDao {

    @PersistenceContext
    private EntityManager entityManager;

    public Cart getCartByUser(User user) {
        try {
            return entityManager.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class)
                    .setParameter("user", user)
                    .getSingleResult();
        } catch (Exception e) {
            // If cart doesn’t exist, create a new one
            Cart cart = new Cart();
            cart.setUser(user);
            entityManager.persist(cart);
            return cart;
        }
    }

    public Cart saveCart(Cart cart) {
        if (cart.getCartId() == 0) {
        	entityManager.persist(cart);
            return cart;
        } else {
            return entityManager.merge(cart);
        }
    }
}
