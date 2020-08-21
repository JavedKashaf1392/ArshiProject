package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetails")
public class OrderDetails {
	
	private static final long serialVersionUID = -3465813074586302847L;
        
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	
	@Column(name = " orderDtlID", length = 50)
	private Long orderDtlID;
	    
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderId", nullable = false)
    private Order order;
	   
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PRODUCT_ID", nullable = false) 
    private Product product;
    
	@Column(name = "quanity")
    private int quanity;
    
	@Column(name = "price")
    private double price;
    
	@Column(name = "amount")
    private double amount;
	      
	    
	    
	    
	  
	
	
	
}
