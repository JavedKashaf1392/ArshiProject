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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import org.hibernate.annotations.ManyToAny;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity                           
@Table(name ="customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int customerid;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="mobile")
	private long mobile;
	
	@Column(name="city")
	private String cities;
	
	@Column(name="location")
	private String location;
	
	@Column(name="email")
	private String email;

	@Column(name="password")
	private String password;
	
    @Transient	
    @Column(name="confirmPassword") 
    private String confirmPassword;
	 
	@Transient
	@Column(name="newPassword")
	private String newPassword;
	
	@Transient
	@Column(name="param")
	private String param;
	
	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	@Column(name="role")
	private String role;
	
	@OneToOne(mappedBy="customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "walletID")
	private Wallet wallet;
	
	

	public Wallet getWallet() {
		return wallet;
	}

	public void setWallet(Wallet wallet) {
		this.wallet = wallet;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	
	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@OneToOne(mappedBy="customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "cartpageid")
	private CartPage cartpage;
	
	
	

	public CartPage getCartpage() {
		return cartpage;
	}

	public void setCartpage(CartPage cartpage) {
		this.cartpage = cartpage;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public String getCities() {
		return cities;
	}

	public void setCities(String cities) {
		this.cities = cities;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", mobile=" + mobile + ", cities=" + cities + ", location=" + location + ", email=" + email
				+ ", password=" + password + ", confirmPassword=" + confirmPassword + ", newPassword=" + newPassword
				+ ", role=" + role + ", wallet=" + wallet + ", cartpage=" + cartpage + "]";
	}

	
	
}
