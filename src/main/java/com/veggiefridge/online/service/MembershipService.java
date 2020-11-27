package com.veggiefridge.online.service;
import com.veggiefridge.online.model.Membership;

public interface MembershipService{
	
    public boolean add(Membership msw);
	
	public Membership getByCustomer(int customerid);
	
	public Membership get(int MembershipID);	

}
