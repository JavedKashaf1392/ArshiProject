package com.veggiefridge.online.model;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Orders")
public class Order implements Serializable {
       
   private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "orderid", length = 50)
    private Long orderId;
    
    @Column(name ="Order_Date", nullable = false)
	private Date orderDate;
    
    @Column(name ="Order_Status", nullable = false)
	private String orderStatus;
     
    @Column(name = "totalAmount", nullable = false)
    private double totalAmount;


	public Long getOrderId() {
		return orderId;
	}


	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}


	public Date getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
   	
}
