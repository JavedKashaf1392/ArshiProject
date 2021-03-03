package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.dao.CartItemDAO;
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

	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);
	
	 //deleteCartItem
	@RequestMapping(value = "/deleteCartItem/{cartitemid}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("cartitemid") int cartitemid, ModelAndView model) {
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
		model.setViewName("cart");
		return model;
	}


	// get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}
	
	 //add item into cart
	 //@RequestMapping(value = "/addToCartPageItem/{productid}",method = RequestMethod.GET,@PathVariable int productid,)
	@RequestMapping(value = "/addToCartPageItem")
	public ModelAndView addCartItems(ModelAndView model,
			@ModelAttribute("cartpage") CartPage cart, BindingResult resultcart,HttpServletRequest request, @RequestParam(value = "productid", required =   
					true)int productid,@ModelAttribute("Product") Product product) {

		System.out.println(productid);
		CartPage cartpage = this.getCartPage();
		CartItem cartitem = cartservice.getByCartPageAndProducts(productid, cartpage.getCartpageid());
		if (cartitem == null) {
			// add a new cartItem if a new product is getting added
			cartitem = new CartItem();
			product = productservice.getProduct(productid);
			
			// transfer the product details to cartLine

			cartitem.setCartpageid(cartpage.getCartpageid());
			cartitem.setProduct(product);
			cartitem.setAvailable(true);
			cartitem.setProductCount(1);
			cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setTotal(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setCartItemNo(cartitem.getCartItemNo() + 1);

			// insert a new cartLine
			cartservice.add(cartitem);
			model.addObject("message", env.getProperty("cart.addproduct"));
			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
			System.out.println("cartitem is added");
			// update the cart
			cartpage.setGrandTotal(cart.getGrandTotal() + cartitem.getTotal());
			cartpage.setCartitem(cartpage.getCartitem() + 1);
			cartservice.updateCartPage(cartpage);
			System.out.println("cartpage updated");
		} else {
			model.addObject("message", env.getProperty("Product Already Added Insid a Cart"));
			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		}
		
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
		String imageSection = "Header";
		List<Images> headerImages =menuservice.getImagesBySection(imageSection);
		model.addObject("headerImages", headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation", listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("VeggieFridge");
		return model;

	}

	 //listCartItem
	@RequestMapping(value = "/listCustomerCartItem")
	public ModelAndView listCustomerCartItem(ModelAndView model, @ModelAttribute CartPage cartpage,
			BindingResult result) {
		// List<CartItem> listcustomercartitem =
		// cartservice.list(this.getCartPage().getCartpageid());
		
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		Object headerImages = "Header";
		model.addObject("headerImages", headerImages);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		// model.setViewName("cartitemlist");
		model.setViewName("cart");
		return model;
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

	@RequestMapping("/increase/{cartitemid}")
	public ModelAndView udpateCartItem(@PathVariable int cartitemid, ModelAndView model) {
		CartItem cartitem = cartservice.get(cartitemid);
		double oldTotal = cartitem.getTotal();
		Product product = cartitem.getProduct();

		//update the cart line
		
		cartitem.setProductCount(cartitem.getProductCount() + 1);
		cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartitem.setTotal(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartservice.update(cartitem);

		//update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getTotal());
		cartservice.updateCartPage(cartpage);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("cart");
		return model;
	}

	@RequestMapping("/decrease/{cartitemid}")
	public ModelAndView decreaseCartItem(@PathVariable int cartitemid, ModelAndView model) {
		CartItem cartitem = cartservice.get(cartitemid);
		double oldTotal = cartitem.getTotal();
		Product product = cartitem.getProduct();

		/*
		 * // check if that much quantity is available or not if(product.getQuantity() <
		 * productCount) { model.addObject("message",
		 * env.getProperty("cart.addproduct")); return "result=unavailable"; }
		 */

		// update the cart line
		cartitem.setProductCount(cartitem.getProductCount() - 1);
		cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartitem.setTotal(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
		cartservice.update(cartitem);

		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal()  - cartitem.getTotal());
		cartservice.updateCartPage(cartpage);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("cart");
		return model;
	}
	
	     //add item into cart
	    @RequestMapping(value = "/addToCartPageItems")
		public String addCartItemss(ModelAndView model,
				@ModelAttribute("cartpage") CartPage cart, BindingResult resultcart,HttpServletRequest request, @RequestParam(value = "productid", required =   
						true)int productid,@ModelAttribute("Product") Product product) {

			System.out.println(productid);
			CartPage cartpage = this.getCartPage();
			CartItem cartitem = cartservice.getByCartPageAndProducts(productid, cartpage.getCartpageid());
			if (cartitem == null) {
				// add a new cartItem if a new product is getting added
				cartitem = new CartItem();
				product = productservice.getProduct(productid);
				
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
				model.addObject("message", env.getProperty("cart.addproduct"));
				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
				System.out.println("cartitem is added");
				// update the cart
				cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getBuyingPrice());
				cartpage.setCartitem(cartpage.getCartitem() + 1);
				cartservice.updateCartPage(cartpage);
				System.out.println("cartpage updated");
				
			} else {
				model.addObject("message", env.getProperty("Product Already Added Insid a Cart"));
				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
			}
			
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("listNavbarMenu",listNavbarMenu);
			List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
			List<Product> listProduct = productservice.getAllProducts();
			List<Customer> listCustomer = customerService.getAllCustomers();
			String imageSection = "Header";
			List<Images> headerImages =menuservice.getImagesBySection(imageSection);
			model.addObject("headerImages", headerImages);
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation", listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
			model.setViewName("VeggieFridge");
			return "redirect:/home";

		}


}
