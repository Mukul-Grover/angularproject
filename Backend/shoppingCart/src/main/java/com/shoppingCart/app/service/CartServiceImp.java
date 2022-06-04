package com.shoppingCart.app.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.shoppingCart.app.dao.CartDao;
import com.shoppingCart.app.dao.LineItemOrderDTO;
import com.shoppingCart.app.dao.OrderDao;
import com.shoppingCart.app.dao.ProductDao;
import com.shoppingCart.app.model.Cart;
import com.shoppingCart.app.model.CartDTO;
import com.shoppingCart.app.model.LIneItemDTO;
import com.shoppingCart.app.model.LineItem;
import com.shoppingCart.app.model.Product;
import com.shoppingCart.app.util.OrderStatus;
import com.shoppingCart.app.model.Order;
import com.shoppingCart.app.model.Order.BuilderOrder;
import com.shoppingCart.app.model.OrderDTO;

@Service
@Transactional
public class CartServiceImp implements CartService {

	@Autowired
	CartDao cartDao;

	@Autowired
	ProductDao productDao;
	
	@Autowired
	OrderDao orderDao;

	@Override
	public Long save(Cart cart) {
		Cart cartdetails = cartDao.findByCustomer(cart.getCustomer().getIdcustomer());
		if(cartdetails!=null) {
		cartdetails.setSubtotal(cart.getSubtotal());
		Long id = cartDao.save(cartdetails);
		cart.getLinesItems().stream().forEach(x->cartDao.saveLineItemList(id,x));
		return id;
		}
		else {
		Long id= cartDao.save(cart);
		cart.getLinesItems().stream().forEach(x->cartDao.saveLineItemList(id,x));
		return id;
		}
	}

	@Override
	public void add(Long idCart, Long idProduct, Integer quantity) {
		Cart cart = cartDao.findBy(idCart);
		Product product = productDao.findBy(idProduct);
		cart.getLinesItems().add(new LineItem(cart, product, quantity, product.getPrice()));
		cartDao.update(cart);
	}

	@Override
	public Long ordered(Long idCart) {
		Cart cart = cartDao.findBy(idCart);
		Order order = new BuilderOrder()
				.setCustomer(cart.getCustomer())
				.setOrdered(new Date())
				.setStatus(OrderStatus.NEW.toString())
				.setTotal(cart.calculateTotal())
				.setLinesItems(cart.getLinesItems())
				.build();
		return orderDao.save(order);
	}

	@Override
	public CartDTO findbyCustomerId(Long idcustomer) {
		// TODO Auto-generated method stub
		Cart c= cartDao.findByCustomer(idcustomer);
		CartDTO ct = new CartDTO();
		ct.setCustomer(c.getCustomer());
		ct.setIdCart(c.getIdCart());
		List<LIneItemDTO> lt = new ArrayList<LIneItemDTO>();
		for(int i=0;i<c.getLinesItems().size();i++) {
			lt.add(new LIneItemDTO(c.getLinesItems().get(i).getIdlinesItem(),c.getIdCart(),c.getLinesItems().get(i).getProduct().getIdProduct(),
					c.getLinesItems().get(i).getOrder()!=null?c.getLinesItems().get(i).getOrder().getIdorder():null,
					c.getLinesItems().get(i).getQuantity(),c.getSubtotal()));
		}
		ct.setLinesItems(lt);
		ct.setSubtotal(ct.getSubtotal());
		return ct;
		
	}

	@Override
	public List<OrderDTO> findbyCustomerIdforOrder(Long idcustomer) {
		// TODO Auto-generated method stub
		
		List<Order> or= cartDao.findByCustomerforOrder(idcustomer);
		List<OrderDTO> ot = or.stream().map(o -> new OrderDTO(o.getIdorder(),o.getOrdered(),o.getStatus(),o.getTotal())).collect(Collectors.toList());
		return ot;

	}

	@Override
	public List<LineItemOrderDTO> findbyOrderIdLineItem(Long idorder) {
		// TODO Auto-generated method stub
		 List<Object[]> ls = cartDao.findbyOrderIdLineItem(idorder);
		 //return ls;
		 LineItemOrderDTO lt =null;
		 List<LineItemOrderDTO> ltr = new ArrayList<LineItemOrderDTO>();
		 for(int i=0;i<ls.size();i++) {
			 lt= new LineItemOrderDTO();
			 lt.setProductName(ls.get(i)[0].toString());
			 lt.setQuantity((Integer) ls.get(i)[1]);
			 lt.setPrice(getBigDecimal(ls.get(i)[2]));
			 ltr.add(lt);
		 }
		 return ltr;
		//return ls.stream().map(l -> new LIneItemDTO(l.getProductName(),l.getQuantity(),l.getPrice())).collect(Collectors.toList());
		
	}
	
	 public static BigDecimal getBigDecimal( Object value ) {
	        BigDecimal ret = null;
	        if( value != null ) {
	            if( value instanceof BigDecimal ) {
	                ret = (BigDecimal) value;
	            } else if( value instanceof String ) {
	                ret = new BigDecimal( (String) value );
	            } else if( value instanceof BigInteger ) {
	                ret = new BigDecimal( (BigInteger) value );
	            } else if( value instanceof Number ) {
	                ret = new BigDecimal( ((Number)value).doubleValue() );
	            } else {
	                throw new ClassCastException("Not possible to coerce ["+value+"] from class "+value.getClass()+" into a BigDecimal.");
	            }
	        }
	        return ret;
	    }

}
