package com.shoppingCart.app.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class CartDTO {
	private Long idCart;
	private Customer customer;
	private BigDecimal subtotal;
	private List<LIneItemDTO> linesItems;
	public Long getIdCart() {
		return idCart;
	}
	@Override
	public String toString() {
		return "CartDTO [idCart=" + idCart + ", customer=" + customer + ", subtotal=" + subtotal + ", linesItems="
				+ linesItems + "]";
	}
	public void setIdCart(Long idCart) {
		this.idCart = idCart;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public BigDecimal getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}
	public List<LIneItemDTO> getLinesItems() {
		return linesItems;
	}
	public void setLinesItems(List<LIneItemDTO> linesItems) {
		this.linesItems = linesItems;
	}
	
}
