package com.shoppingCart.app.dao;

import java.util.List;

import com.shoppingCart.app.model.Cart;
import com.shoppingCart.app.model.Customer;
import com.shoppingCart.app.model.LIneItemDTO;
import com.shoppingCart.app.model.LineItem;
import com.shoppingCart.app.model.Order;
import com.shoppingCart.app.model.OrderDTO;

public interface CartDao {

	Cart findBy(Long idCart);
	Long save(Cart cart);
	void update(Cart cart);
	Long saveLineItemList(Long id, LineItem lineItem);
	Cart findByCustomer(Long idCustomer);
	List<Order> findByCustomerforOrder(Long idcustomer);
    List<Object[]> findbyOrderIdLineItem(Long idorder);
	
}
