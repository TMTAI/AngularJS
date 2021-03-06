package com.example.demo.model;

import com.example.demo.entity.OrderDetails;

public class OrderDetailInfo {
	private String id;

	private String productCode;
	private String productName;

	private int quanity;
	private double price;
	private double amount;

	public OrderDetailInfo() {

	}

	// Using for Hibernate Query.
	// Sử dụng cho Hibernate Query.
	public OrderDetailInfo(String id, String productCode, //
			String productName, int quanity, double price, double amount) {
		this.id = id;
		this.productCode = productCode;
		this.productName = productName;
		this.quanity = quanity;
		this.price = price;
		this.amount = amount;
	}

	public OrderDetailInfo(OrderDetails orderDetail){
		this.id = orderDetail.getId();
		this.productCode = orderDetail.getProduct().getCode();
		this.productName = orderDetail.getProduct().getName();
		this.quanity = orderDetail.getQuanity();
		this.price = orderDetail.getPrice();
		this.amount = orderDetail.getAmount();
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
}