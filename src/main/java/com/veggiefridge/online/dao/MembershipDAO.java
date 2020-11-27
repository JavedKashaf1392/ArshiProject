package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Membership;

public interface MembershipDAO {
	
	public boolean add(Membership msw);
	
	public Membership getByCustomer(int customerid);
	
    public Membership get(int MembershipID);
    
    
    

}
