package com.veggiefridge.online.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "qrCodes")

public class QrCode implements Serializable {
	
	private static final long serialVersionUID = -3465813074586302847L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int qrCodeId;
	
	
	@Column(name = "customerid")
	private int customerid;
	
	@Column(name = "orderId")
	private int orderId;

	@Column(name = "membershipId")
	private int membershipId;

	@Column(name = "isValid")
	private String isValid;

	@Column(name = "date")
	private Date date;

	@Column(name = "type")
	private String type;

	@Column(name = "source")
	private String source;

	
	public int getQrCodeId() {
		return qrCodeId;
	}

	public void setQrCodeId(int qrCodeId) {
		this.qrCodeId = qrCodeId;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(int membershipId) {
		this.membershipId = membershipId;
	}

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(java.util.Date date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

}