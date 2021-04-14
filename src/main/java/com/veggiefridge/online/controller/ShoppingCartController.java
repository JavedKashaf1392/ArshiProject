package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.dao.CartItemDAO;
import com.veggiefridge.online.dao.MenuDao;
import com.veggiefridge.online.dao.OrderDao;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.MenuService;
import com.veggiefridge.online.service.ProductService;


@Controller
@RequestMapping(value = "/cart")
public class ShoppingCartController {

	@Autowired
	private ProductService productservice;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private KioskLocationService kiosklocationservice;

	@Autowired
	private CartService cartservice;

	@Autowired
	private HttpSession session;

	@Autowired
	private Environment env;
	
	@Autowired
	private MenuService menuservice;
	
	@Autowired
	private MenuDao menudao;
	
	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);
	
	//get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}
	
	 //Add To Cart 
    @RequestMapping(value ="/addToCart", method = RequestMethod.POST)
    @ResponseBody
    public String addToCart(ModelAndView model,@RequestParam int productid) {
    	System.out.println("Product Id Is"+productid);
		CartPage cartpage = this.getCartPage();
		CartItem cartitem = cartservice.getByCartPageAndProducts(productid, cartpage.getCartpageid());
		if (cartitem == null) {
			// add a new cartItem if a new product is getting added
			cartitem = new CartItem();
		    Product	product = productservice.getProduct(productid);
			 //transfer the product details to cartLine
			cartitem.setCartpageid(cartpage.getCartpageid());
			cartitem.setProduct(product);
			//cartitem.setAvailable(true);
			cartitem.setProductCount(1);
			cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setTotal(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setCartItemNo(cartitem.getCartItemNo() + 1);
			// insert a new cartLine
			cartservice.add(cartitem);
			//model.addObject("message","Product Added Inside A cart");
			// update the cart
			cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getBuyingPrice());
			cartpage.setCartitem(cartpage.getCartitem() + 1);
			cartservice.updateCartPage(cartpage);
			
			
	    model.addObject("message",VFOnlineConstants.CART_PRODUCT_ADD);
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
		String imageSection = "Header";
		List<Images> headerImages =menuservice.getImagesBySection(imageSection);
		//model.addObject("message",VFOnlineConstants.CART_PRODUCT_ADD);
		model.addObject("headerImages", headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation", listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.addObject("blurimage",VFOnlineConstants.headeblurimage);
		model.addObject("classvalue", VFOnlineConstants.classvalue);
		model.addObject("animateimage",VFOnlineConstants.animateimage);
		cartpage = cartservice.getCartPage(cartpage.getCartpageid());
		System.out.println("Cart Value"+cartpage);
		model.addObject("cartpage",cartpage);
		System.out.println("cart"+cartpage.toString());
		}
		System.out.println("Product Added Into cart");
		return "Product Added";
        }
	

    @SuppressWarnings("unchecked")
	private int isExisting(int productid) {
		/* List<Items> cart = (List<Items>) session.getAttribute("cart"); */
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		for (int i = 0; i < listcustomercartitem.size(); i++)

			if (listcustomercartitem.get(i).getProduct().getProductid() == productid)
				return i;

		return -1;

	}

	 //listCartItem
	@RequestMapping(value = "/listCustomerCartItem")
	public ModelAndView listCustomerCartItem(ModelAndView model, @ModelAttribute CartPage cartpage,
			BindingResult result) {
		
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		Object headerImages = "Header";
		model.addObject("headerImages", headerImages);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		List<Menu> allMenu = menudao.getMenuAndSubMenu();
	  		System.out.println("===================================");
	  		for (Menu menu : allMenu) {
	  			System.out.println("menu"+menu);
			
		}
			model.addObject("menuLevel1", allMenu);
			model.setViewName("cart");
		// model.setViewName("cartitemlist");
		/* model.setViewName("cart"); */
		return model;
	}
	
	
	//delete CartItem 
	@RequestMapping(value = "/delCartItem", method = RequestMethod.DELETE)
	public @ResponseBody String deleteCartItem(@RequestParam int cartitemid,ModelAndView model) {
		CartItem cartitem = cartservice.get(cartitemid);
		// deduct the cart
		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() - cartitem.getTotal());
		cartpage.setCartitem(cartpage.getCartitem() - 1);
		cartservice.updateCartPage(cartpage);
		// remove the cartLine
		cartservice.remove(cartitem);
		model.addObject("message", env.getProperty("cart.removeproduct"));
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.addObject("blurimage",VFOnlineConstants.headeblurimage);
		model.addObject("classvalue", VFOnlineConstants.classvalue);
		model.addObject("animateimage",VFOnlineConstants.animateimage);
		cartpage = cartservice.getCartPage(cartpage.getCartpageid());
		//System.out.println(cartpage.toString());
		//List<CartPage> cart = Arrays.asList(cartpage);
		System.out.println("Product Deleted");
		return "Product Deleted"+cartpage;
	}
	
	
	 //increment quantity
	@RequestMapping(value="/incrementquantity",method = RequestMethod.POST)
	public String incrementquantity(@RequestParam int cartitemid,ModelAndView model) {
		CartItem cartitem = cartservice.get(cartitemid);
		
		double oldTotal = cartitem.getTotal();
		Product product = cartitem.getProduct();
		
		//update the cart line
		cartitem.setProductCount(cartitem.getProductCount() + 1);
		cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartitem.setTotal(cartitem.getBuyingPrice() * cartitem.getProductCount()+1);
		cartservice.update(cartitem);
		//update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal()- oldTotal + cartitem.getTotal());
		cartservice.updateCartPage(cartpage);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		System.out.println("Product Increment");
		return "cartitmem increment";
	}
	
	
	
	 //Decrement Quntity
	@RequestMapping(value ="/decrementQuantity",method = RequestMethod.POST)
	public ModelAndView decreaseCartItem(@RequestParam int cartitemid,ModelAndView model) {
		CartItem cartitem = cartservice.get(cartitemid);
		double oldTotal = cartitem.getTotal();
		Product product = cartitem.getProduct();

		// update the cart line
		cartitem.setProductCount(cartitem.getProductCount() - 1);
		cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartitem.setTotal(cartitem.getBuyingPrice()*cartitem.getProductCount() - 1);
		cartservice.update(cartitem);
		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() - oldTotal + cartitem.getTotal());
		cartservice.updateCartPage(cartpage);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		System.out.println("Product Decrement");
		return model;
	}
	    
	     //Validate cart
	    @RequestMapping(value = "/valiDateCartItem")
		public String valiDateCartItem(ModelAndView model,
				@ModelAttribute("cartpage") CartPage cartpage, BindingResult resultcart,HttpServletRequest request,@ModelAttribute("Product") Product product) {
	    	
	    	cartpage = this.getCartPage();
			List<CartItem> cartitems = cartservice.list(this.getCartPage().getCartpageid());
			double grandTotal = 0.0;
			int lineCount = 0;
			//boolean changed = false;
			product = null;
			for(CartItem cartitem :cartitems){					
				product = cartitem.getProduct();
				//changed = false;
				
				
				//check if the buying price of product has been changed
				if(cartitem.getBuyingPrice() != product.getPrice() - product.getDiscount() * product.getPrice() / 100) {
					
					//set the buying price to the new price
					cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
					
					//calculate and set the new total
					cartitem.setTotal(cartitem.getProductCount() * product.getPrice() - product.getDiscount() * product.getPrice() / 100);
					//changed = true;				
				}
				
				//changes has happened
				//if(changed) {				
					//update the cartitem
					cartservice.update(cartitem);
					
					// set the result as modified
					//return "cart";
				//}
				
				grandTotal += cartitem.getTotal();
				lineCount++;
			}
			
			/* cart.setCartLines(lineCount++); */
			cartpage.setCartitem(lineCount++);
			/* cart.setGrandTotal(grandTotal); */
			cartpage.setGrandTotal(grandTotal);
			cartservice.updateCartPage(cartpage);
			model.addObject("msg",VFOnlineConstants.CART_UPDATE);
			return "cart";
		
		}
	    
	    @RequestMapping(value = "/ajaxcart", method = RequestMethod.GET)
		public ModelAndView ajaxcart(ModelAndView model) {
			List<Product> listProduct = productservice.getAllProducts();
			model.addObject("listProduct", listProduct);
			model.setViewName("ajaxcart");
			return model;
	    }
  		
	    
	    
	    
	    @RequestMapping(value ="/newfooter")
	  		public String newfooter(ModelMap model) {
	  			return "newfooter";
	  		}
	  
	    
	        @RequestMapping(value ="/getServerTime")
	  		@ResponseBody
	  		public String getServerTime(ModelMap model) {
	  			Date d= new Date();
	  			System.out.println("API is Calling........" +d);
	  			return d.toString();
	  		}
	        
	         
	    	
	    	

}
	    

