package com.veggiefridge.online.model;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name ="membership")
public class Membership {
	
	private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int MembershipID;

	@OneToOne
	private Customer customer;
	
	@Column(name="joiningdate")
	private Date JoiningDate;
	
	@Column(name="lastupdatedate")
	private Date  LastUpdateDate;
	
	
	public int getMembershipID() {
		return MembershipID;
	}

	public void setMembershipID(int membershipID) {
		MembershipID = membershipID;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Date getJoiningDate() {
		return JoiningDate;
	}

	public void setJoiningDate(Date joiningDate) {
		JoiningDate = joiningDate;
	}

	public Date getLastUpdateDate() {
		return LastUpdateDate;
	}

	public void setLastUpdateDate(Date lastUpdateDate) {
		LastUpdateDate = lastUpdateDate;
	}

}
