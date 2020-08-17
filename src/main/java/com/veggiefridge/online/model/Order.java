package com.veggiefridge.online.model;
import java.util.Date;

import javax.management.loading.PrivateClassLoader;
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
@Table(name ="order")
public class Order {
       
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "orderid", length = 50)
    private String orderId;
    
    @Column(name ="Order_Date", nullable = false)
	private Date orderDate;
    
    @Column(name = "Amount", nullable = false)
    private double totalAmount;
    
    private int customerid;
     
    public String getSource() {
		return Source;
	}

	public void setSource(String source) {
		Source = source;
	}

	private String Source= "WEB";
    
	public String getOrderid() {
		return orderId;
	}

	public void setOrderid(String orderid) {
		this.orderId = orderid;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public double getAmount() {
		return totalAmount;
	}

	public void setAmount(double amount) {
		this.totalAmount = amount;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
    
    
    

	
}
