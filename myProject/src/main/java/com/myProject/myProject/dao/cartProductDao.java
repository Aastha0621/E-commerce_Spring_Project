package com.myProject.myProject.dao;

import com.myProject.myProject.models.CartProduct;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository
@Transactional
public class cartProductDao {

    @PersistenceContext
    private EntityManager entityManager;

 // Save or update
    public CartProduct save(CartProduct cp) {
        if (cp.getId() == 0) {
        	entityManager.persist(cp);
            return cp;
        } else {
            return entityManager.merge(cp);
        }
    }

 // Find by ID
    public CartProduct getById(int id) {
        return entityManager.find(CartProduct.class, id);
    }
    
 // Delete
    public void delete(CartProduct cartProduct) {
        entityManager.remove(entityManager.contains(cartProduct) ? cartProduct : entityManager.merge(cartProduct));
    }
}
