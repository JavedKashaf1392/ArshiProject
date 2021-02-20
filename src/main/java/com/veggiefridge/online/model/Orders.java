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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name ="orders")
public class Orders{
	
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderid;

	@ManyToOne
	private Customer customer;
	
	@Column(name = "orderTotal")
	private double orderTotal;
     
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	@Column(name="orderDate")
	private Date orderDate;
	
	@Column(name="pickupStatus")
	private String pickupStatus;
	
	@Column(name="totalBillAmount")
	private double totalBillAmount;  

	public double getTotalBillAmount() {
		return totalBillAmount;
	}

	public void setTotalBillAmount(double totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}

	@Column(name="platformSource")
	private String platformSource="web";
	
	@Column(name="totalProductsCount")
	private int totalProductsCount;
	
	@Column(name="deliveredProductsCount")
	private int deliveredProductsCount;
	
	@Column(name="remainingProductsCount")
	private int remainingProductsCount;
	
	@Column(name="updatedDate")
	private Date updatedDate;

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
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

	@Override
	public String toString() {
		return "Orders [orderid=" + orderid + ", customer=" + customer + ", orderTotal=" + orderTotal + ", orderDate="
				+ orderDate + ", pickupStatus=" + pickupStatus + ", totalBillAmount=" + totalBillAmount
				+ ", platformSource=" + platformSource + ", totalProductsCount=" + totalProductsCount
				+ ", deliveredProductsCount=" + deliveredProductsCount + ", remainingProductsCount="
				+ remainingProductsCount + "]";
	}
	
}
