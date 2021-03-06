package com.example.demo.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.example.demo.model.ProductDetailInfo;

@Entity
@Table(name = "Products")
public class Products implements Serializable {

	private static final long serialVersionUID = -1000119078147252957L;

	private String code;
	private String name;
	private int price;
	private byte[] image;

	// For sort.
	private Date createDate;

	public Products() {
	}

	public Products(ProductDetailInfo productDetails) {
		this.code = productDetails.getCode();
		this.name = productDetails.getName();
		this.price = productDetails.getPrice();
		this.image = productDetails.getImage();
	}
	
	public Products(Products products){
		this.code = products.getCode();
		this.name = products.getName();
		this.price = products.getPrice();
		this.image = products.getImage();
	}
	
	@Id
	@Column(name = "Code", length = 20, nullable = false)
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "Name", length = 255, nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Price", nullable = false)
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Create_Date", nullable = false)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Lob
	@Column(name = "Image", length = Integer.MAX_VALUE, nullable = true)
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}
