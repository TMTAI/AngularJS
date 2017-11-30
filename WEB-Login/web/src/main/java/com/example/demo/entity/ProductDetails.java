package com.example.demo.entity;
// Generated Nov 30, 2017 9:34:43 AM by Hibernate Tools 5.2.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * ProductDetails generated by hbm2java
 */
@Entity
@Table(name = "product_details", catalog = "stock")
public class ProductDetails implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Products products;
	private int quantity;
	private byte[] imageViewBefore;
	private byte[] imageViewCenter;
	private byte[] imageViewAfter;
	private byte[] imageFunction;
	private String cpuTechnology;
	private String cpuType;
	private String cpuSpeed;
	private String cpuSpeedMax;
	private String cpuBusSpeed;
	private String ram;
	private String ramType;
	private String ramBusSpeed;
	private String ramMax;
	private String hardDrive;
	private String screenSize;
	private String resolution;
	private String screenTechnology;
	private String screenTouch;
	private String cardDesign;
	private String cardGraphics;
	private String audioTechnology;
	private String connector;
	private String wirelessConnectivity;
	private String memoryCardReader;
	private String opticalDrive;
	private String webcam;
	private String keyboadLight;
	private String ortherFunction;
	private String operatingSystem;
	private String pin;
	private String size;
	private String weight;
	private String meterial;
	private String trademark;
	private String describeOne;
	private String describeTwo;
	private String describeThree;
	
	public ProductDetails() {
	}

	public ProductDetails(Products products, int quantity, String cpuTechnology, String cpuType, String cpuSpeed,
			String cpuSpeedMax, String cpuBusSpeed, String ram, String ramType, String ramBusSpeed, String ramMax,
			String hardDrive, String screenSize, String resolution, String screenTechnology, String screenTouch,
			String cardDesign, String cardGraphics, String audioTechnology, String connector,
			String wirelessConnectivity, String memoryCardReader, String opticalDrive, String webcam,
			String keyboadLight, String ortherFunction, String operatingSystem, String pin, String size, String weight,
			String meterial, String trademark, String describeOne, String describeTwo, String describeThree) {
		this.products = products;
		this.quantity = quantity;
		this.cpuTechnology = cpuTechnology;
		this.cpuType = cpuType;
		this.cpuSpeed = cpuSpeed;
		this.cpuSpeedMax = cpuSpeedMax;
		this.cpuBusSpeed = cpuBusSpeed;
		this.ram = ram;
		this.ramType = ramType;
		this.ramBusSpeed = ramBusSpeed;
		this.ramMax = ramMax;
		this.hardDrive = hardDrive;
		this.screenSize = screenSize;
		this.resolution = resolution;
		this.screenTechnology = screenTechnology;
		this.screenTouch = screenTouch;
		this.cardDesign = cardDesign;
		this.cardGraphics = cardGraphics;
		this.audioTechnology = audioTechnology;
		this.connector = connector;
		this.wirelessConnectivity = wirelessConnectivity;
		this.memoryCardReader = memoryCardReader;
		this.opticalDrive = opticalDrive;
		this.webcam = webcam;
		this.keyboadLight = keyboadLight;
		this.ortherFunction = ortherFunction;
		this.operatingSystem = operatingSystem;
		this.pin = pin;
		this.size = size;
		this.weight = weight;
		this.meterial = meterial;
		this.trademark = trademark;
		this.describeOne = describeOne;
		this.describeTwo = describeTwo;
		this.describeThree = describeThree;
	}

	public ProductDetails(Products products, int quantity, byte[] imageViewBefore, byte[] imageViewCenter,
			byte[] imageViewAfter, byte[] imageFunction, String cpuTechnology, String cpuType, String cpuSpeed,
			String cpuSpeedMax, String cpuBusSpeed, String ram, String ramType, String ramBusSpeed, String ramMax,
			String hardDrive, String screenSize, String resolution, String screenTechnology, String screenTouch,
			String cardDesign, String cardGraphics, String audioTechnology, String connector,
			String wirelessConnectivity, String memoryCardReader, String opticalDrive, String webcam,
			String keyboadLight, String ortherFunction, String operatingSystem, String pin, String size, String weight,
			String meterial, String trademark, String describeOne, String describeTwo, String describeThree) {
		this.products = products;
		this.quantity = quantity;
		this.imageViewBefore = imageViewBefore;
		this.imageViewCenter = imageViewCenter;
		this.imageViewAfter = imageViewAfter;
		this.imageFunction = imageFunction;
		this.cpuTechnology = cpuTechnology;
		this.cpuType = cpuType;
		this.cpuSpeed = cpuSpeed;
		this.cpuSpeedMax = cpuSpeedMax;
		this.cpuBusSpeed = cpuBusSpeed;
		this.ram = ram;
		this.ramType = ramType;
		this.ramBusSpeed = ramBusSpeed;
		this.ramMax = ramMax;
		this.hardDrive = hardDrive;
		this.screenSize = screenSize;
		this.resolution = resolution;
		this.screenTechnology = screenTechnology;
		this.screenTouch = screenTouch;
		this.cardDesign = cardDesign;
		this.cardGraphics = cardGraphics;
		this.audioTechnology = audioTechnology;
		this.connector = connector;
		this.wirelessConnectivity = wirelessConnectivity;
		this.memoryCardReader = memoryCardReader;
		this.opticalDrive = opticalDrive;
		this.webcam = webcam;
		this.keyboadLight = keyboadLight;
		this.ortherFunction = ortherFunction;
		this.operatingSystem = operatingSystem;
		this.pin = pin;
		this.size = size;
		this.weight = weight;
		this.meterial = meterial;
		this.trademark = trademark;
		this.describeOne = describeOne;
		this.describeTwo = describeTwo;
		this.describeThree = describeThree;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false, foreignKey = @ForeignKey(name = "PROD_DETAIL_PROD_FK"))
	public Products getProducts() {
		return this.products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "image_view_before")
	public byte[] getImageViewBefore() {
		return this.imageViewBefore;
	}

	public void setImageViewBefore(byte[] imageViewBefore) {
		this.imageViewBefore = imageViewBefore;
	}

	@Column(name = "image_view_center")
	public byte[] getImageViewCenter() {
		return this.imageViewCenter;
	}

	public void setImageViewCenter(byte[] imageViewCenter) {
		this.imageViewCenter = imageViewCenter;
	}

	@Column(name = "image_view_after")
	public byte[] getImageViewAfter() {
		return this.imageViewAfter;
	}

	public void setImageViewAfter(byte[] imageViewAfter) {
		this.imageViewAfter = imageViewAfter;
	}

	@Column(name = "image_function")
	public byte[] getImageFunction() {
		return this.imageFunction;
	}

	public void setImageFunction(byte[] imageFunction) {
		this.imageFunction = imageFunction;
	}

	@Column(name = "cpu_technology", nullable = false)
	public String getCpuTechnology() {
		return this.cpuTechnology;
	}

	public void setCpuTechnology(String cpuTechnology) {
		this.cpuTechnology = cpuTechnology;
	}

	@Column(name = "cpu_type", nullable = false)
	public String getCpuType() {
		return this.cpuType;
	}

	public void setCpuType(String cpuType) {
		this.cpuType = cpuType;
	}

	@Column(name = "cpu_speed", nullable = false)
	public String getCpuSpeed() {
		return this.cpuSpeed;
	}

	public void setCpuSpeed(String cpuSpeed) {
		this.cpuSpeed = cpuSpeed;
	}

	@Column(name = "cpu_speed_max", nullable = false)
	public String getCpuSpeedMax() {
		return this.cpuSpeedMax;
	}

	public void setCpuSpeedMax(String cpuSpeedMax) {
		this.cpuSpeedMax = cpuSpeedMax;
	}

	@Column(name = "cpu_bus_speed", nullable = false)
	public String getCpuBusSpeed() {
		return this.cpuBusSpeed;
	}

	public void setCpuBusSpeed(String cpuBusSpeed) {
		this.cpuBusSpeed = cpuBusSpeed;
	}

	@Column(name = "ram", nullable = false)
	public String getRam() {
		return this.ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	@Column(name = "ram_type", nullable = false)
	public String getRamType() {
		return this.ramType;
	}

	public void setRamType(String ramType) {
		this.ramType = ramType;
	}

	@Column(name = "ram_bus_speed", nullable = false)
	public String getRamBusSpeed() {
		return this.ramBusSpeed;
	}

	public void setRamBusSpeed(String ramBusSpeed) {
		this.ramBusSpeed = ramBusSpeed;
	}

	@Column(name = "ram_max", nullable = false)
	public String getRamMax() {
		return this.ramMax;
	}

	public void setRamMax(String ramMax) {
		this.ramMax = ramMax;
	}

	@Column(name = "hard_drive", nullable = false)
	public String getHardDrive() {
		return this.hardDrive;
	}

	public void setHardDrive(String hardDrive) {
		this.hardDrive = hardDrive;
	}

	@Column(name = "screen_size", nullable = false)
	public String getScreenSize() {
		return this.screenSize;
	}

	public void setScreenSize(String screenSize) {
		this.screenSize = screenSize;
	}

	@Column(name = "resolution", nullable = false)
	public String getResolution() {
		return this.resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	@Column(name = "screen_technology", nullable = false)
	public String getScreenTechnology() {
		return this.screenTechnology;
	}

	public void setScreenTechnology(String screenTechnology) {
		this.screenTechnology = screenTechnology;
	}

	@Column(name = "screen_touch", nullable = false)
	public String getScreenTouch() {
		return this.screenTouch;
	}

	public void setScreenTouch(String screenTouch) {
		this.screenTouch = screenTouch;
	}

	@Column(name = "card_design", nullable = false)
	public String getCardDesign() {
		return this.cardDesign;
	}

	public void setCardDesign(String cardDesign) {
		this.cardDesign = cardDesign;
	}

	@Column(name = "card_graphics", nullable = false)
	public String getCardGraphics() {
		return this.cardGraphics;
	}

	public void setCardGraphics(String cardGraphics) {
		this.cardGraphics = cardGraphics;
	}

	@Column(name = "audio_technology", nullable = false)
	public String getAudioTechnology() {
		return this.audioTechnology;
	}

	public void setAudioTechnology(String audioTechnology) {
		this.audioTechnology = audioTechnology;
	}

	@Column(name = "connector", nullable = false)
	public String getConnector() {
		return this.connector;
	}

	public void setConnector(String connector) {
		this.connector = connector;
	}

	@Column(name = "wireless_connectivity", nullable = false)
	public String getWirelessConnectivity() {
		return this.wirelessConnectivity;
	}

	public void setWirelessConnectivity(String wirelessConnectivity) {
		this.wirelessConnectivity = wirelessConnectivity;
	}

	@Column(name = "memory_card_reader", nullable = false)
	public String getMemoryCardReader() {
		return this.memoryCardReader;
	}

	public void setMemoryCardReader(String memoryCardReader) {
		this.memoryCardReader = memoryCardReader;
	}

	@Column(name = "optical_drive", nullable = false)
	public String getOpticalDrive() {
		return this.opticalDrive;
	}

	public void setOpticalDrive(String opticalDrive) {
		this.opticalDrive = opticalDrive;
	}

	@Column(name = "webcam", nullable = false)
	public String getWebcam() {
		return this.webcam;
	}

	public void setWebcam(String webcam) {
		this.webcam = webcam;
	}

	@Column(name = "keyboad_light", nullable = false)
	public String getKeyboadLight() {
		return this.keyboadLight;
	}

	public void setKeyboadLight(String keyboadLight) {
		this.keyboadLight = keyboadLight;
	}

	@Column(name = "orther_function", nullable = false)
	public String getOrtherFunction() {
		return this.ortherFunction;
	}

	public void setOrtherFunction(String ortherFunction) {
		this.ortherFunction = ortherFunction;
	}

	@Column(name = "operating_system", nullable = false)
	public String getOperatingSystem() {
		return this.operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	@Column(name = "pin", nullable = false)
	public String getPin() {
		return this.pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	@Column(name = "size", nullable = false)
	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Column(name = "weight", nullable = false)
	public String getWeight() {
		return this.weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	@Column(name = "meterial", nullable = false)
	public String getMeterial() {
		return this.meterial;
	}

	public void setMeterial(String meterial) {
		this.meterial = meterial;
	}

	@Column(name = "trademark", nullable = false)
	public String getTrademark() {
		return this.trademark;
	}

	public void setTrademark(String trademark) {
		this.trademark = trademark;
	}

	@Column(name = "describe_one", nullable = false)
	public String getDescribeOne() {
		return describeOne;
	}

	public void setDescribeOne(String describeOne) {
		this.describeOne = describeOne;
	}

	@Column(name = "describe_two", nullable = false)
	public String getDescribeTwo() {
		return describeTwo;
	}

	public void setDescribeTwo(String describeTwo) {
		this.describeTwo = describeTwo;
	}

	@Column(name = "describe_three", nullable = false)
	public String getDescribeThree() {
		return describeThree;
	}

	public void setDescribeThree(String describeThree) {
		this.describeThree = describeThree;
	}
}