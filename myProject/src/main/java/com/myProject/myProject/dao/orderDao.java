package com.myProject.myProject.dao;

import com.myProject.myProject.models.Order;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class orderDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void saveOrder(Order order) {
        entityManager.persist(order);
    }

    public Order getOrderById(int id) {
        return entityManager.find(Order.class, id);
    }

    public List<Order> getOrdersByUser(int userId) {
        return entityManager.createQuery("FROM Order o WHERE o.user.id = :userId", Order.class)
                .setParameter("userId", userId)
                .getResultList();
    }
    
    public long countAllOrders() {
        return entityManager.createQuery("SELECT COUNT(o) FROM Order o", Long.class)
                .getSingleResult();
    }
    
}
