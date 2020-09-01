package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.Cart;
import com.veggiefridge.online.model.CartLine;

public interface ShoopingcartDAO {
    	
    	public List<CartLine> list(int cartId);
    	
    	public CartLine get(int id);	
    	
    	public boolean add(CartLine cartLine);
    	
    	public boolean update(CartLine cartLine);
    	
    	public boolean remove(CartLine cartLine);
    	
    	boolean updateCart(Cart cart);
    	
    	public List<CartLine> listAvailable(int cartId);
    	
    	// fetch the CartLine based on cartId and productId
    	public CartLine getByCartAndProduct(int cartId, int productid);	
    	
    }
