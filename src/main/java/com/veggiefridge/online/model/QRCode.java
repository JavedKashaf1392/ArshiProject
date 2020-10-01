package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

@Entity
@Table(name ="qrcode")
public class QRCode {
	
	private static final long serialVersionUID = -3465813074586302847L;
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int qrcodeid;
	
	@ManyToOne
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name = "membershipid")
	private MembershipWallet Membershipwallet;
	
	@OneToOne
    private Orders orders;
	
	@Column(name = "isvalid")
    private boolean isValid;
	
     @Column(name = "source")
    private String Source ="web";

	public int getQrcodeid() {
		return qrcodeid;
	}

	public void setQrcodeid(int qrcodeid) {
		this.qrcodeid = qrcodeid;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public MembershipWallet getMembershipwallet() {
		return Membershipwallet;
	}

	public void setMembershipwallet(MembershipWallet membershipwallet) {
		Membershipwallet = membershipwallet;
	}
     
	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public boolean isValid() {
		return isValid;
	}

	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}

	public String getSource() {
		return Source;
	}

	public void setSource(String source) {
		Source = source;
	}
     
}

	
	


