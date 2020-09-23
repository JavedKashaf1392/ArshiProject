package com.veggiefridge.online.model;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name ="orderitemdetails")
public class OrderItemDetails{
	
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderItemDetailsId;

	@ManyToOne
	private Customer customer;
	
	@Column(name = "ordertotal")
	private double orderTotal;
	
//	@OneToMany(mappedBy="orderitemdetails", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	private List<OrderItem> orderItems = new ArrayList<>();
	
	@Column(name="orderdate")
	private Date orderDate;
	
	@Column(name="pickupStatus")
	private String pickupStatus;
	
	@Column(name="totalBillAmount")
	private int totalBillAmount;  

	@Column(name="platformSource")
	private String platformSource;
	
	@Column(name="totalProductsCount")
	private int totalProductsCount;
	
	@Column(name="deliveredProductsCount")
	private int deliveredProductsCount;
	
	@Column(name="remainingProductsCount")
	private int remainingProductsCount;

	public int getOrderItemDetailsId() {
		return orderItemDetailsId;
	}

	public void setOrderItemDetailsId(int orderItemDetailsId) {
		this.orderItemDetailsId = orderItemDetailsId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPickupStatus() {
		return pickupStatus;
	}

	public void setPickupStatus(String pickupStatus) {
		this.pickupStatus = pickupStatus;
	}

	public int getTotalBillAmount() {
		return totalBillAmount;
	}

	public void setTotalBillAmount(int totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}

	public String getPlatformSource() {
		return platformSource;
	}

	public void setPlatformSource(String platformSource) {
		this.platformSource = platformSource;
	}

	public int getTotalProductsCount() {
		return totalProductsCount;
	}

	public void setTotalProductsCount(int totalProductsCount) {
		this.totalProductsCount = totalProductsCount;
	}

	public int getDeliveredProductsCount() {
		return deliveredProductsCount;
	}

	public void setDeliveredProductsCount(int deliveredProductsCount) {
		this.deliveredProductsCount = deliveredProductsCount;
	}

	public int getRemainingProductsCount() {
		return remainingProductsCount;
	}

	public void setRemainingProductsCount(int remainingProductsCount) {
		this.remainingProductsCount = remainingProductsCount;
	}

	


	
}
