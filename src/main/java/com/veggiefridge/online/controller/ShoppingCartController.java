package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.dao.CartItemDAO;
import com.veggiefridge.online.dao.OrderDao;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
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

	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ordernow/{productid}", method = RequestMethod.GET)
	public String ordernow(@PathVariable(value = "productid") int productid, ModelMap mm, HttpSession session) {

		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(this.productservice.getProduct(productid), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");

			// using method isExisting here
			int index = isExisting(productid, session);
			if (index == -1)
				cart.add(new Item(this.productservice.getProduct(productid), 1));
			else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}

			session.setAttribute("cart", cart);
		}

		return "cart"; // page name
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/delete/{productid}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "productid") int productid, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		int index = isExisting(productid, session);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "cart";
	}

	@SuppressWarnings("unchecked")
	private int isExisting(int productid, HttpSession session) {

		List<Item> cart = (List<Item>) session.getAttribute("cart");

		for (int i = 0; i < cart.size(); i++)

			if (cart.get(i).getProduct().getProductid() == productid)
				return i;

		return -1;
	}

	@RequestMapping(value = "/registerdhome", method = RequestMethod.GET)
	public ModelAndView registerdhome(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation", listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.setViewName("registerdhome");
		return model;
	}

	// checkout
	@RequestMapping(value = "/paymnet")
	public ModelAndView myOrder(ModelAndView model) {
		model.setViewName("checkout");
		return model;
	}

	// saveOrder
	@RequestMapping(value = "/saveOrder")
	public ModelAndView saveOrder(ModelAndView model) {
		model.setViewName("thanks");
		return model;
	}

	// saveOrder
	@RequestMapping(value = "/addToCart/{productid}")
	public String addToCart(@PathVariable int productid) {
		CartItem cartitem = cartservice.getByCartPageAndProduct(productid);
		if (cartitem == null) {
			// add a new cartItem if a new product is getting added
			cartitem = new CartItem();
			System.out.println("add a new cartItem if a new product is getting added");
			Product product = productservice.getProduct(productid);
			System.out.println("get Product");

			// transfer the product details to cartitem

			cartitem.setProduct(product);
			cartitem.setProductCount(1);
			cartitem.setBuyingPrice(product.getFinalPrice());
			cartitem.setTotal(product.getFinalPrice());
			// insert a new cartLine
			cartservice.add(cartitem);
			System.out.println("item is adding into cart");
		}
		return "redirect:/cart/registerdhome";

	}

	// listCartItem
	@RequestMapping(value = "/listCartItem")
	public ModelAndView listCartItem(ModelAndView model) {
		List<CartItem> listcartitem = cartservice.getAllCartItem();
		model.addObject("listcartitem", listcartitem);
		model.setViewName("cartitemlist");
		return model;
	}

	// deleteCartItem
	@RequestMapping(value = "/deleteCartItem/{cartitemid}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("cartitemid") int cartitemid) {
		CartItem cartitem = cartservice.get(cartitemid);

		// deduct the cart
		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() - cartitem.getTotal());
		cartpage.setCartitem(cartpage.getCartitem() - 1);
		cartservice.updateCartPage(cartpage);
		// remove the cartLine
		cartservice.remove(cartitem);
		return "redirect:/cart/listCustomerCartItem";
	}

	
	// deleteCartItem
	@RequestMapping(value = "/deleteCartItems/{cartitemid}", method = RequestMethod.GET)
	public String deleteProducts(@PathVariable("cartitemid") int cartitemid) {
		CartItem cartitem = cartservice.get(cartitemid);

		// deduct the cart
		// update the cart
		CartPage cartpage = this.getCartPage();
		cartpage.setGrandTotal(cartpage.getGrandTotal() - cartitem.getTotal());
		cartpage.setCartitem(cartpage.getCartitem() - 1);
		cartservice.updateCartPage(cartpage);
		// remove the cartLine
		cartservice.remove(cartitem);
		return "redirect:/cart/registerdhome";
	}

	// listCartItem
	@RequestMapping(value = "/listcart")
	public ModelAndView listCartItems(ModelAndView model) {
		List<CartItem> listcartitem = cartservice.getAllCartItem();
		model.addObject("listcartitem", listcartitem);
		model.setViewName("cartlist");
		return model;
	}

	// get cartPage
	private CartPage getCartPage() {
		return ((Customer) session.getAttribute("customer")).getCartpage();
	}

	// add cartitem
	@RequestMapping(value = "/addToCartPageItem/{productid}")
	public String addCartItems(@PathVariable int productid) {

		CartPage cartpage = this.getCartPage();
		CartItem cartitem = cartservice.getByCartPageAndProducts(productid, cartpage.getCartpageid());
		if (cartitem == null) {

			// add a new cartItem if a new product is getting added
			cartitem = new CartItem();
			Product product = productservice.getProduct(productid);
			// transfer the product details to cartLine
			cartitem.setCartpageid(cartpage.getCartpageid());
			cartitem.setProduct(product);
			cartitem.setProductCount(1);
			cartitem.setBuyingPrice(product.getFinalPrice());
			cartitem.setTotal(product.getFinalPrice());
			cartitem.setCartItemNo(cartitem.getCartItemNo() + 1);

			// insert a new cartLine
			cartservice.add(cartitem);
			System.out.println("cartitem is added");

			// update the cart
			cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getTotal());
			cartpage.setCartitem(cartpage.getCartitem() + 1);
			cartservice.updateCartPage(cartpage);
			System.out.println("cartpage updated");
		}
		return "redirect:/cart/registerdhome";

	}

	// listCartItem
	@RequestMapping(value = "/listCustomerCartItem")
	public ModelAndView listCustomerCartItem(ModelAndView model) {
		/*
		 * List<CartItem> listcustomercartitem =
		 * cartservice.list(this.getCartPage().getCartpageid());
		 * model.addObject("listcustomercartitem", listcustomercartitem);
		 */
		model.setViewName("cartitemlist");
		return model;
	}

	// joinmemebership
	@RequestMapping(value = "/joinmembership")
	public ModelAndView joinMembership(ModelAndView model) {
		model.setViewName("joinmemebership");
		return model;
	}

}
