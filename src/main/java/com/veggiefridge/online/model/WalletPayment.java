package com.veggiefridge.online.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name ="walletpayment")
public class WalletPayment {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int walletPaymentId;
	
	@Column(name="paymentDate")
	private Date paymentDate;
	
	@Column(name="transactionMode")
	private String transactionMode; // Credit / Debit

	@Column(name="remainingWalletAmount")
	private double remainingWalletAmount;
	
	@Column(name="paymentMode") // UPI/ Card / Banking / Paytm Gatway
	private String paymentMode;
	
	@Column(name="paymentAmount")
	private double paymentAmount;
	
	@Column(name="paymentStatus") // Pending / Paid
	private String paymentStatus;

	@Column(name="paymentStatusBody") // Payment Gateway response Body
	private String paymentStatusBody;
	
	@Column(name="source")
	private String source;

	public int getWalletPaymentId() {
		return walletPaymentId;
	}

	public void setWalletPaymentId(int walletPaymentId) {
		this.walletPaymentId = walletPaymentId;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getTransactionMode() {
		return transactionMode;
	}

	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}

	public double getRemainingWalletAmount() {
		return remainingWalletAmount;
	}

	public void setRemainingWalletAmount(double remainingWalletAmount) {
		this.remainingWalletAmount = remainingWalletAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public double getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getPaymentStatusBody() {
		return paymentStatusBody;
	}

	public void setPaymentStatusBody(String paymentStatusBody) {
		this.paymentStatusBody = paymentStatusBody;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
}