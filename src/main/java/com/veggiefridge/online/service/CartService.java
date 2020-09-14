package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.CartItem;

public interface CartService {
	
      public CartItem get(int cartitemid);	
		
	  public boolean add(CartItem cartitem);
        
	 // fetch the CartLine based on cartId and productId
      public CartItem getByCartPageAndProduct(int productid);
      
      public List<CartItem> getAllCartItem();
      
      public boolean remove(CartItem cartitem);
      
				
    
}
