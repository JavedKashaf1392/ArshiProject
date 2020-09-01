package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.CartLine;
public interface ShoppingCartService {
	
	public List<CartLine> getCartLine();
	
	public String addCartLine(int productid);
		
}
