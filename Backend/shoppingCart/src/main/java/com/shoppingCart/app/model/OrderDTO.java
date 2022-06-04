package com.shoppingCart.app.model;

import java.math.BigDecimal;
import java.util.Date;

public class OrderDTO {
	private Long idorder;
	@Override
	public String toString() {
		return "OrderDTO [idorder=" + idorder + ", ordered=" + ordered + ", status=" + status + ", total=" + total
				+ "]";
	}
	public Long getIdorder() {
		return idorder;
	}
	public void setIdorder(Long idorder) {
		this.idorder = idorder;
	}
	public Date getOrdered() {
		return ordered;
	}
	public OrderDTO(Long idorder, Date ordered, String status, BigDecimal total) {
		super();
		this.idorder = idorder;
		this.ordered = ordered;
		this.status = status;
		this.total = total;
	}
	public void setOrdered(Date ordered) {
		this.ordered = ordered;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
	}
	private Date ordered;
	private String status;
	private BigDecimal total;
}
