package com.veggiefridge.online.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="cartpage")
public class CartPage{
	  
      private static final long serialVersionUID = -3465813074586302847L;
     
      @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int cartpageid;
	  
      @Column(name = "grandtotal")
	  private double grandTotal;
	  
      @Column(name = "cartitem")
	  private int cartitem;
	  
      @OneToOne
	  private Customer customer;

	public int getCartpageid() {
		return cartpageid;
	}

	public void setCartpageid(int cartpageid) {
		this.cartpageid = cartpageid;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public int getCartitem() {
		return cartitem;
	}

	public void setCartitem(int cartitem) {
		this.cartitem = cartitem;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
      
      
}
