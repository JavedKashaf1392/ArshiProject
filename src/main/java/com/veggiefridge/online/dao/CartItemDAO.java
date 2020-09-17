package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Product;

public interface CartItemDAO {
	
	    public List<CartItem> list(int cartpageid);
		
	    public CartItem get(int cartitemid);	
		
	    public boolean add(CartItem cartitem);
		
	    public boolean update(CartItem cartitem);
		
		//fetch the CartLine based on cartId and productId
		public CartItem getByCartPageAndProduct(int productid);
		
		public List<CartItem> getAllCartItem();
		
		public boolean remove(CartItem cartitem);
		
		public List<CartItem> listAvailable(int cartpageid);
		
		
}
