package com.shoppingCart.app.dao;

import java.math.BigDecimal;

public class LineItemOrderDTO {

	private String productName;
	private Integer quantity;
	private BigDecimal price;
	@Override
	public String toString() {
		return "LineItemOrderDTO [productName=" + productName + ", quantity=" + quantity + ", price=" + price + "]";
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
}
