package com.veggiefridge.online.model;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.deser.std.DateDeserializers.DateDeserializer;

@Entity
@Table(name ="payment")
public class Payment implements Serializable {

	private static final long serialVersionUID = -3465813074486302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int paymentId;

	@OneToOne
	@JoinColumn(name="customerid")
	private Customer customer;
	
	@OneToOne
	@JoinColumn(name="orderId")
	private Orders orders;
	
	@Column(name="modeOfPayment")
	private String modeOfPayment;
	
	@Column(name="paymentMethod")
	private String paymentMethod;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm:ss")
	@Column(name="orderDate")
	private Date orderDate;
	
	@Column(name="totalBillAmount")
	private double totalBillAmount;  
	
	@Column(name="paymentStatus")
	private String paymentStatus;
	
	@Column(name="platformSource")
	private String platformSource;

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Orders getOrder() {
		return orders;
	}

	public void setOrder(Orders order) {
		this.orders = order;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalBillAmount() {
		return totalBillAmount;
	}

	public void setTotalBillAmount(double totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getPlatformSource() {
		return platformSource;
	}

	public void setPlatformSource(String platformSource) {
		this.platformSource = platformSource;
	}

}