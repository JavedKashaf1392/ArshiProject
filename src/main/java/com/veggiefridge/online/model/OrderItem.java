
package com.veggiefridge.online.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="orderitem")
public class OrderItem {
	
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int  orderItemId;
	
	@OneToOne
	private Product product;
	
	@Column(name="orderid")
	private int orderid;
	
	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
  
	@Column(name = "productStatus")
	private String productstatus;
	
	public String getProductstatus() {
		return productstatus;
	}

	public void setProductstatus(String productstatus) {
		this.productstatus = productstatus;
	}

	@Column(name ="source")
	private String source="web";
	
	@Column (name = "totalAmount")
	private double totalAmount;
	
	@Column(name="productQuantity")
	private int productQuantity;

	public int getOrderItemId() {
		return orderItemId;
	}
	

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
}
