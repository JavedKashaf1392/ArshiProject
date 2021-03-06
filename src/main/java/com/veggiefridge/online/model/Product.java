package com.veggiefridge.online.model;
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "product")
public class Product implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int productid;

	//@NotEmpty(message="Please Enter ProductName")
	@Column(name="productName")
	private String productName;
	
	//@NotNull(message="Please Enter Price")
	@Column(name="price")
	private double price;
	
	//@NotEmpty(message="Please Enter Quantity")
	@Column(name="quantity")
	private  int quantity;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	//@NotNull(message="Please Enter Discount")
	@Column(name="discount")
	private int discount;
	
	//@NotEmpty(message="Please Enter Avaibility")
	@Column(name="isAvailable")
	private String isAvailable;
	
	//@NotEmpty(message="Please Enter Category")
	@Column(name="category")
	private String category;
	
	//@NotEmpty(message="Please Enter Description")
	@Column(name="description")
	private String description;
	
	//@NotNull(message="Please Enter  FinalPrice")
	@Column(name="finalPrice")
	private double finalPrice;
	
	//@NotNull(message="Please Enter size")
	@Column(name="size")
	private int size;
	
	//@NotNull(message="Please Enter  tax")
	@Column(name="tax")
	private float tax;
	
	@Column(name="imageName")
	private String imageName;
	
		@Column(name="unit")
		private String unit;
	
	public String getUnit() {
			return unit;
		}

		public void setUnit(String unit) {
			this.unit = unit;
		}

	public double getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(double finalPrice) {
		this.finalPrice = finalPrice;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}


	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
}