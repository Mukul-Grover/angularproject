package com.shoppingCart.app.service;

import java.util.List;

import com.shoppingCart.app.dao.LineItemOrderDTO;
import com.shoppingCart.app.model.Cart;
import com.shoppingCart.app.model.CartDTO;
import com.shoppingCart.app.model.LIneItemDTO;
import com.shoppingCart.app.model.Order;
import com.shoppingCart.app.model.OrderDTO;
public interface CartService {

	Long save(Cart cart);
	void add(Long idCart, Long idProduct, Integer quantity);
	Long ordered(Long idCart);
	CartDTO findbyCustomerId(Long idcustomer);
	List<OrderDTO> findbyCustomerIdforOrder(Long idcustomer);
	List<LineItemOrderDTO> findbyOrderIdLineItem(Long idorder);

}
