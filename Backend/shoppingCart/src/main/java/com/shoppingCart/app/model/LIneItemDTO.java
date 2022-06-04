package com.shoppingCart.app.model;

import java.math.BigDecimal;

public class LIneItemDTO {

	private Long idlinesItem;
	private Long idcart;

	public Long getIdlinesItem() {
		return idlinesItem;
	}
	public void setIdlinesItem(Long idlinesItem) {
		this.idlinesItem = idlinesItem;
	}

	@Override
	public String toString() {
		return "LIneItemDTO [idlinesItem=" + idlinesItem + ", idcart=" + idcart 
				+ ", idproduct=" + idproduct + ", idorder=" + idorder + ", quantity=" + quantity + ", price=" + price
				+ "]";
	}
	public LIneItemDTO(Long idlinesItem, Long idcart, Long idproduct, Long idorder, Integer quantity,
			BigDecimal price) {
		super();
		this.idlinesItem = idlinesItem;
		this.idcart = idcart;
		this.idproduct = idproduct;
		this.idorder = idorder;
		this.quantity = quantity;
		this.price = price;
	}
	public LIneItemDTO() {
		// TODO Auto-generated constructor stub
	}
	public Long getIdcart() {
		return idcart;
	}
	public void setIdcart(Long idcart) {
		this.idcart = idcart;
	}
	public Long getIdproduct() {
		return idproduct;
	}
	public void setIdproduct(Long idproduct) {
		this.idproduct = idproduct;
	}
	public Long getIdorder() {
		return idorder;
	}
	public void setIdorder(Long idorder) {
		this.idorder = idorder;
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
	private Long idproduct;
	private Long idorder;
	private Integer quantity;
	private BigDecimal price;
}
