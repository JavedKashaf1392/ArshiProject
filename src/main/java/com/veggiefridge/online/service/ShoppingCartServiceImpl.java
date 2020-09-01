package com.veggiefridge.online.service;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.veggiefridge.online.dao.ProductDAO;
import com.veggiefridge.online.dao.ShoopingcartDAO;
import com.veggiefridge.online.model.Cart;
import com.veggiefridge.online.model.CartLine;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Product;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	
	@Autowired
	private ProductDAO productDAO;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ShoopingcartDAO shoopingcartDAO;
	
	
	private Cart getCart(){
	return ((Customer)session.getAttribute("customer")).getCart();
	}
	
	@Override
	public List<CartLine> getCartLine(){
		return shoopingcartDAO.list(getCart().getId());
	}

	
	@Override
	public String addCartLine(int productid) {
	Cart cart = this.getCart();
	CartLine cartline = shoopingcartDAO.getByCartAndProduct(cart.getId(),productid);
	String response = null;
	if(cartline==null){
			// add a new cartLine if a new product is getting added
			cartline = new CartLine();
			Product product = productDAO.getProduct(productid);
			// transfer the product details to cartLine
			cartline.setCartId(cart.getId());
			cartline.setProduct(product);
			cartline.setProductCount(1);
			cartline.setBuyingPrice(product.getFinalPrice());
			cartline.setTotal(product.getFinalPrice());
			//insert a new cartLine
			shoopingcartDAO.add(cartline);
			
			            //update the cart
						cart.setGrandTotal(cart.getGrandTotal() + cartline.getTotal());
						cart.setCartLines(cart.getCartLines() + 1);
						shoopingcartDAO.updateCart(cart);
						response = "result=added";	
	}
	
		return response;
	}
	
}

	

	

