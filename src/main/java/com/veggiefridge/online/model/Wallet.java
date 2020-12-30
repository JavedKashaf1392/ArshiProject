package com.veggiefridge.online.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="wallet")
public class Wallet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int walletID;
	
	@OneToOne
	private Customer customer;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Column(name="totalamountbalance")
	private double totalAmountBalance;
	
	@Column(name="joiningDate")
	private Date joiningDate;
	
	@Column(name="lastUpdateDate")
	private Date lastUpdateDate;

	public double getTotalAmountBalance() {
		return totalAmountBalance;
	}

	public void setTotalAmountBalance(double totalAmountBalance) {
		this.totalAmountBalance = totalAmountBalance;
	}

	public int getWalletID() {
		return walletID;
	}

	public void setWalletID(int walletID) {
		this.walletID = walletID;
	}
	
}
