package com.veggiefridge.online.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//@Entity
//@Table(name = "item")
public class Item {
	
	
    private static final long serialVersionUID = -3465813074586302847L;
	//@Id
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	//private int id;
	
	//@OneToOne
	private Product product;
	
	//@Column(name = "productcount")
	//private int productCount;
	
	//@Column(name = "Quantity")
	private int quantity;
	
	//@Column(name = "buyingprice")
	//private double buyingPrice;
	
	//@Column(name = "cart_id")
	//private int cartId;	
   
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	 public Item(Product product, int quantity) {
		  super();
		  this.product = product;
		  this.quantity = quantity;
		 }

		 public Item() {
		  super();
		 }

	
	
	
	
	
	
}
