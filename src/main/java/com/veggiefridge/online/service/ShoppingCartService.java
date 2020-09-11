package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.TempOrderDetails;
public interface ShoppingCartService {
	  		
   
    public void addTempOrderDetails(TempOrderDetails tod);
	
	public TempOrderDetails getTempOrderDetails(int todid);
	
	public List<TempOrderDetails> getTempOrderDetails();
	
	public TempOrderDetails getByProduct(int productid); 
}
