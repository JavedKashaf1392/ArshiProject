package com.veggiefridge.online.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customerqr")

public class QRCode implements Serializable {
	
	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;
	
	@Column(name = "customerid")
	private String customerid;
	
	@Column(name = "transactionid")
	private String transactionid;
	
	@Column(name = "date")
	private String date;
	
	@Column(name = "isValid")
	private String isValid;
	
	@Column(name = "qrcodestring")
	private String qrcodestring;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	public String getQrcodestring() {
		return qrcodestring;
	}

	public void setQrcodestring(String qrcodestring) {
		this.qrcodestring = qrcodestring;
	}

}
