package com.veggiefridge.online.service;
import com.veggiefridge.online.model.MembershipWallet;

public interface MembershipWalletService{
	
    public boolean add(MembershipWallet msw);
	
	public MembershipWallet getByCustomer(int customerid);
	
	public MembershipWallet get(int MembershipID);	

}
