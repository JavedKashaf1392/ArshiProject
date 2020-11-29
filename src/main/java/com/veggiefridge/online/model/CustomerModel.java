package com.veggiefridge.online.model;

import java.io.Serializable;

public class CustomerModel implements Serializable {
	
	private int id;
	
	private String firstName;
	
	private String email;
	
	private String role;
	
	private CartPage cartpage;

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
