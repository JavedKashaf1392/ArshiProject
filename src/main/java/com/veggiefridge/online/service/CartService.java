package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;

public interface CartService {
	
      public CartItem get(int cartitemid);	
		
	  public boolean add(CartItem cartitem);
        
	 // fetch the CartLine based on cartId and productId
      public CartItem getByCartPageAndProduct(int productid);
      
      public List<CartItem> getAllCartItem();
      
      public boolean remove(CartItem cartitem);
      
      // fetch the CartLine based on cartId and productId cartpageid
      public CartItem getByCartPageAndProducts(int productid,int cartpageid);
     			
      public boolean updateCartPage(CartPage cartpage);
      
      public List<CartItem> list(int cartpageid);
		
    
}
