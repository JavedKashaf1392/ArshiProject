package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetails")
public class OrderDetails {
	
	private static final long serialVersionUID = -3465813074586302847L;
        
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID", length = 50)
	private String orderDtlID;
	    
	    //private Order order;
	    
	    //private Product product;
	    
	  
	
	
	
}
