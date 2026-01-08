package com.myProject.myProject.services;

import com.myProject.myProject.dao.orderDao;
import com.myProject.myProject.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class orderService {

    @Autowired
    private orderDao orderDao;

    @Autowired
    private cartService cartService;

//    public Order placeOrder(User user) {
//        Cart cart = cartService.getCartByUser(user);
//
//        if (cart.getCartProducts().isEmpty()) {
//            return null; // nothing to order
//        }
//
//        Order order = new Order();
//        order.setUser(user);
//
//        double total = 0;
//
//        for (CartProduct cp : cart.getCartProducts()) {
//            OrderItem item = new OrderItem();
//            item.setOrder(order);
//            item.setProduct(cp.getProduct());
//            item.setQuantity(cp.getQuantity());
//            item.setPrice(cp.getProduct().getPrice());
//
//            total += cp.getProduct().getPrice() * cp.getQuantity();
//
//            order.getOrderItems().add(item);
//        }
//
//        order.setTotalAmount(total);
//        orderDao.save(order);
//
//        // clear the cart
//        cart.getCartProducts().clear();
//
//        return order;
//    }
}
