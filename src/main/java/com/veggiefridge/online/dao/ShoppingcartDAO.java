package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.TempOrderDetails;

public interface ShoppingcartDAO {

	public void addTempOrderDetails(TempOrderDetails tod);
	
	public TempOrderDetails getTempOrderDetails(int todid);
	
	public List<TempOrderDetails> getTempOrderDetails();
	
	public TempOrderDetails getByProduct(int productid); 
	

}
