package com.veggiefridge.online.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int customerid;

//	@NotEmpty(message="Please Enter ProductName")
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
//	@NotNull(message="Please Enter ProductPrice")
	@Column(name="mobile")
	private long mobile;
	
//	@NotEmpty(message="Please Enter Quantity")
	@Column(name="city")
	private String city;
	
//	@NotNull(message="Please Enter Discount")
	@Column(name="kioskLocation")
	private String kioskLocation;
	
//	@NotEmpty(message="Please Enter Avaibility")
	@Column(name="email")
	private String email;
	
//	@NotEmpty(message="Please Enter Category")
	@Column(name="password")
	private String password;
	
//	@NotEmpty(message="Please Enter Description")
	@Column(name="confirmPassword")
	private String confirmPassword;

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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getKioskLocation() {
		return kioskLocation;
	}

	public void setKioskLocation(String kioskLocation) {
		this.kioskLocation = kioskLocation;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	

}