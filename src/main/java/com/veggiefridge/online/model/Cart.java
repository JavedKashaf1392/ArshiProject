package com.veggiefridge.online.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="cart")
public class Cart implements Serializable {

    private static final long serialVersionUID = -3465813074586302847L;
     
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
    
	@Column(name = "grandtotal") 
	private double grandTotal;
	 
	@Column(name = "cartlines") 
	private int cartLines;
	 
	@OneToOne
    private Customer customer;

	public int getId() {
		return id;
	}
    
	public void setId(int cartId) {
		this.id =id;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public int getCartLines() {
		return cartLines;
	}

	public void setCartLines(int cartLines) {
		this.cartLines = cartLines;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "cart [id=" + id + ", grandTotal=" + grandTotal + ", cartLines=" + cartLines + ", customer=" + customer
				+ "]";
	}
}
