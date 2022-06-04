package com.shoppingCart.app.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingCart.app.model.Cart;
import com.shoppingCart.app.model.Customer;
import com.shoppingCart.app.model.LIneItemDTO;
import com.shoppingCart.app.model.LineItem;
import com.shoppingCart.app.model.Order;

@Repository
public class CartDaoImp implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Cart findBy(Long idCart) {
		String queryString = "FROM Cart WHERE idCart = :idCart";
		return (Cart) sessionFactory.getCurrentSession()
								.createQuery(queryString)
								.setParameter("idCart", idCart)
								.uniqueResult();
	}
	
	@Override
	public Cart findByCustomer(Long idCustomer) {
		String queryString = "SELECT c FROM Cart AS c WHERE idcustomer = :idcustomer";
		return (Cart) sessionFactory.getCurrentSession()
								.createQuery(queryString)
								.setParameter("idcustomer", idCustomer)
								.uniqueResult();
	}


	@Override
	public Long save(Cart cart) {
		return (Long) sessionFactory.getCurrentSession().save(cart);
	}

	@Override
	public void update(Cart cart) {
		sessionFactory.getCurrentSession().update(cart);
	}


	@Override
	public Long saveLineItemList(Long id,LineItem lineItem) {
		// TODO Auto-generated method stub
		lineItem.setCart(findBy(id));
		return (Long) sessionFactory.getCurrentSession().save(lineItem);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findByCustomerforOrder(Long idcustomer) {
		// TODO Auto-generated method stub
		String queryString = "SELECT o FROM Order AS o WHERE idcustomer = :idcustomer";
		return sessionFactory.getCurrentSession()
								.createQuery(queryString)
								.setParameter("idcustomer", idcustomer)
								.list();
	}

	@Override
	public List<Object[]> findbyOrderIdLineItem(Long idorder) {
		// TODO Auto-generated method stub
		String queryString = "SELECT l.product.description,l.quantity,l.price  FROM LineItem AS l WHERE idorder = :idorder";
		return sessionFactory.getCurrentSession()
				.createQuery(queryString)
				.setParameter("idorder", idorder)
				.list();
	}
}
