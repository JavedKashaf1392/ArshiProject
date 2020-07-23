/*
 * package com.veggiefridge.online.model; import java.io.Serializable; import
 * java.util.Date;
 * 
 * import javax.persistence.Column; import javax.persistence.Entity; import
 * javax.persistence.FetchType; import javax.persistence.Id; import
 * javax.persistence.JoinColumn; import javax.persistence.ManyToOne; import
 * javax.persistence.Table; import javax.persistence.UniqueConstraint;
 * 
 * @Entity
 * 
 * @Table(name ="cart", // uniqueConstraints = { @UniqueConstraint(columnNames =
 * "Cart_Num") }) public class Cart implements Serializable {
 * 
 * private static final long serialVersionUID = -2576670215015463100L;
 * 
 * 
 * @Id
 * 
 * @Column(name = "ID", length = 50, nullable = false) private String id;
 * 
 * 
 * @Column(name = "Cart_Date", nullable = false) private Date cartDate;
 * 
 * @Column(name = "Cart_Num", nullable = false) private int cartNum;
 * 
 * 
 * @Column(name = "Amount", nullable = false) private double amount;
 * 
 * @Column(name = "quantity", nullable = false) private int quanity;
 * 
 * @Column(name = "price", nullable = false) private double price;
 * 
 * 
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "productid", nullable = false, // foreignKey
 * = @ForeignKey(name = "FK_Product") ) private Product product;
 * 
 * 
 * 
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "productid", nullable = false, // foreignKey
 * = @ForeignKey(name = "Cart_PROD_FK") ) private Customer customer;
 * 
 * 
 * 
 * public int getQuanity() { return quanity; }
 * 
 * public void setQuanity(int quanity) { this.quanity = quanity; }
 * 
 * public double getPrice() { return price; }
 * 
 * public void setPrice(double price) { this.price = price; }
 * 
 * public String getId() { return id; }
 * 
 * public void setId(String id) { this.id = id; }
 * 
 * public Date getCartDate() { return cartDate; }
 * 
 * public void setCartDate(Date cartDate) { this.cartDate = cartDate; } public
 * int getCartNum() { return cartNum; }
 * 
 * public void setCartNum(int cartNum) { this.cartNum = cartNum; }
 * 
 * public double getAmount() { return amount; } public void setAmount(double
 * amount) { this.amount = amount; } public Product getProduct() { return
 * product; }
 * 
 * public void setProduct(Product product) { this.product = product; }
 * 
 * public Customer getCustomer() { return customer; }
 * 
 * public void setCustomer(Customer customer) { this.customer = customer; }
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * }
 */