package com.example.demo.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.example.demo.entity.ProductDetails;
import com.example.demo.entity.Products;

public class ProductInfo {
	private String code;
	private String name;
	private int price;
	private int maxNumberProduct;
	
	private boolean newProduct = false;

	// Upload file.
	private CommonsMultipartFile fileData;

	public ProductInfo() {
	}

	public ProductInfo(Products product) {
		this.code = product.getCode();
		this.name = product.getName();
		this.price = product.getPrice();
	}
	
	public ProductInfo(ProductDetails product) {
		this.code = product.getProducts().getCode();
		this.name = product.getProducts().getName();
		this.price = product.getProducts().getPrice();
		this.maxNumberProduct = product.getQuantity();
	}

	public ProductInfo(ProductDetailInfo product) {
		this.code = product.getCode();
		this.name = product.getName();
		this.price = product.getPrice();
		this.maxNumberProduct = product.getQuantity();
	}
	
	// Không thay đổi Constructor này,
	// nó được sử dụng trong Hibernate query.
	public ProductInfo(String code, String name, int price) {
		this.code = code;
		this.name = name;
		this.price = price;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

	public boolean isNewProduct() {
		return newProduct;
	}

	public void setNewProduct(boolean newProduct) {
		this.newProduct = newProduct;
	}

	public int getMaxNumberProduct() {
		return maxNumberProduct;
	}

	public void setMaxNumberProduct(int maxNumberProduct) {
		this.maxNumberProduct = maxNumberProduct;
	}
}