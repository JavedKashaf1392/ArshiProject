package com.veggiefridge.online.model;

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
	
	@Column(name="customerid")
	private int customerid;
	
	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	@Column(name="totalamountbalance")
	private int totalAmountBalance;

	public int getTotalAmountBalance() {
		return totalAmountBalance;
	}

	public void setTotalAmountBalance(int totalAmountBalance) {
		this.totalAmountBalance = totalAmountBalance;
	}

	public int getWalletID() {
		return walletID;
	}

	public void setWalletID(int walletID) {
		this.walletID = walletID;
	}

	
}
