package com.veggiefridge.online.model;
import java.util.ArrayList;
import java.util.List;


public class CartInfo {
	
    private Long orderNum;

	private Customer customer;

	private final List<Item> cartItem = new ArrayList<Item>();

	public List<Item> getCartItem(){
		return cartItem;
	}

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
}
