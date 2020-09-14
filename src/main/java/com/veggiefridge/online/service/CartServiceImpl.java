package com.veggiefridge.online.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.CartItemDAO;
import com.veggiefridge.online.model.CartItem;

@Service
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartItemDAO cartitemdao;

	@Override
	@Transactional
	public CartItem get(int cartitemid) {
		return cartitemdao.get(cartitemid);
	}

	@Override
	@Transactional
	public boolean add(CartItem cartitem) {
		try {
			cartitemdao.add(cartitem);
			System.out.println("service add cartitem method is running");
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public CartItem getByCartPageAndProduct(int productid) {
			System.out.println("service getByCartPageAndProduct method is running");
			return cartitemdao.getByCartPageAndProduct(productid);
			
	}

	@Override
	@Transactional
	public List<CartItem> getAllCartItem() {
		return cartitemdao.getAllCartItem();
	}

	
	@Override
	public boolean remove(CartItem cartitem) {
		try {			
			cartitemdao.remove(cartitem);
			return true;
		}catch(Exception ex) {
			return false;
		}	

	}
}
	
	
	
	
	    

