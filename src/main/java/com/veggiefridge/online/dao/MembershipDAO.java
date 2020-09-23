package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.MembershipWallet;

public interface MembershipDAO {
	
	public boolean add(MembershipWallet msw);
	
	public MembershipWallet getByCustomer(int customerid);
	
    public MembershipWallet get(int MembershipID);
    
    
    

}
