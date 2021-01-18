package com.veggiefridge.online.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import javax.swing.ListCellRenderer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.CartItemDAO;
import com.veggiefridge.online.dao.ProductDAO;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Product;

@Service
@Transactional
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartItemDAO cartitemdao;

	@Autowired
	private HttpSession session;
	
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
		
    //get cartPage
	@Transactional
	private	CartPage getCartPage(){
			return ((Customer)session.getAttribute("customer")).getCartpage();
		}
	
	
	
     //getCartItem by cartpageid
	@Transactional
	public List<CartItem> getAllCartItems(){
		return cartitemdao.list(getCartPage().getCartpageid());
	}

	
	@Override
	public CartItem getByCartPageAndProducts(int productid, int cartpageid) {
		return cartitemdao.getByCartPageAndProduct(productid, cartpageid);
	}

	@Override
	public boolean updateCartPage(CartPage cartpage) {
		return cartitemdao.updateCartPage(cartpage);
	}

	@Override
	public List<CartItem> list(int cartpageid) {
		return  cartitemdao.list(cartpageid);
	}

	@Override
	public boolean deleteList(List<CartItem> cartitem) {
		
		return cartitemdao.deleteList(cartitem);
	}

	@Override
	public CartItem getCustomerCart(int cartpageid) {
		return cartitemdao.getCustomerCart(cartpageid);
	}

	@Override
	public boolean add(CartPage cartpage) {
		return cartitemdao.add(cartpage);
	}

	@Override
	public boolean update(CartItem cartitem) {
		return cartitemdao.update(cartitem);
	}

	@Override
	public String manageCartItem(int cartitemid, int productCount) {
		CartItem cartitem = cartitemdao.get(cartitemid)	;	
		double oldTotal = cartitem.getTotal();
		Product product = cartitem.getProduct();
		
		  //check if that much quantity is available or not
		if(product.getQuantity() < productCount) {
			return "result=unavailable";
		}	
		
		//update the cart line
		cartitem.setProductCount(productCount);
		cartitem.setBuyingPrice(product.getPrice());
		cartitem.setTotal(product.getPrice() * productCount);
		cartitemdao.update(cartitem);

		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() - oldTotal + cartitem.getTotal());
		cartitemdao.updateCartPage(cartpage);
		return "result=updated";
	}
	
	}
	

	
	
	
	
	    

