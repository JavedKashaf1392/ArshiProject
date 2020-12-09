package com.veggiefridge.online.model;

import java.io.Serializable;

import javax.persistence.Column;

public class CustomerModel implements Serializable {
	
	private int id;
	
	private String firstName;
	
	private String email;
	
	private String role;
	
	private CartPage cartpage;
	
	private String cities;
	
	
	private String lastName;
	
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	private long mobile;
	
	public String getCities() {
		return cities;
	}

	public void setCities(String cities) {
		this.cities = cities;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	private String location;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public CartPage getCartpage() {
		return cartpage;
	}

	public void setCartpage(CartPage cartpage) {
		this.cartpage = cartpage;
	}

}
