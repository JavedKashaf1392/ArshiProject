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
import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name ="cartitem")
public class CartItem{

	private static final long serialVersionUID = -3465813074586302847L;
    
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartitemid;

	@Column(name = "productcount")
	private int productCount;
	
	@Column(name = "total")
	private double total;
	
	@Column(name = "buyingprice")
	private double buyingPrice;
	
	@Column(name = "isavailable")
	private boolean available = true;
	
	@Column(name ="cartpageid")
	private int cartpageid;	
	
	@Column(name ="cartitemno")
	private int cartItemNo;
	
	@OneToOne
	private Product product;
	
	public int getCartItemNo() {
		return cartItemNo;
	}

	public void setCartItemNo(int cartItemNo) {
		this.cartItemNo = cartItemNo;
	}

	public int getCartpageid() {
		return cartpageid;
	}

	public void setCartpageid(int cartpageid) {
		this.cartpageid = cartpageid;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCartitemid() {
		return cartitemid;
	}

	public void setCartitemid(int cartitemid) {
		this.cartitemid = cartitemid;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getBuyingPrice() {
		return buyingPrice;
	}

	public void setBuyingPrice(double buyingPrice) {
		this.buyingPrice = buyingPrice;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}
}
