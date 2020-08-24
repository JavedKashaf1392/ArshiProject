package com.veggiefridge.online.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

    @Entity
    public class Cart{
    
    private static final long serialVersionUID = 1L;
    
    
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
    @Column(name = "grandtotal")
	private double grandTotal;
    
    @Column(name = "cart_lines")
	private int cartLines;
    
    @OneToOne
	private Customer customer;

    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
	

    
    
    	
    	
   
	
}
