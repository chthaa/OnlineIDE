package com.defult.se;

//class only holds data | POJO (Plain old java Java Object
public class Application {
	private int id = -1;
	private String name = "";
	private double price;
	
	//Default constructor, does not use any arguments
	public Application() {
		super();
	}

	//does not use ID
	public Application(String name, double price) {
		super();
		this.name = name;
		this.price = price;
	}
	
	//uses ID
	public Application(int id, String name, double price) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
