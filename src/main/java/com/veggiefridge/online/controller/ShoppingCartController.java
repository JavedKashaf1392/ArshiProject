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
	

	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);

	@RequestMapping(value = "/registerdhome", method = RequestMethod.GET)
	public ModelAndView registerdhome(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
		String imageSection = "Header";
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
		List<Images> headerImages = productservice.getImagesBySection(imageSection);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
	     model.addObject("listprofileMenu",listprofileMenu);
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
	    model.addObject("listMenu",listMenu);
	    model.addObject("headerImages",headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		/* model.setViewName("registerdhome"); */
		model.setViewName("VeggieFridge");
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

	 //saveOrder
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

	//listCartItem
	@RequestMapping(value = "/listCartItem")
	public ModelAndView listCartItem(ModelAndView model) {
		List<CartItem> listcartitem = cartservice.getAllCartItem();
		model.addObject("listcartitem", listcartitem);
		model.setViewName("cartitemlist");
		return model;
	}

	 //deleteCartItem
	@RequestMapping(value = "/deleteCartItem/{cartitemid}", method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable("cartitemid") int cartitemid,ModelAndView model) {
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
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
	     model.addObject("listprofileMenu",listprofileMenu);
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
	    model.addObject("listMenu",listMenu);
	    model.addObject("listcustomercartitem", listcustomercartitem);
	    model.setViewName("cart");
		return model;
	}

	 //deleteCartItem
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
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}

	 //add cartitem
	@RequestMapping(value = "/addToCartPageItem/{productid}")
	public ModelAndView addCartItems(ModelAndView model,@PathVariable int productid, @ModelAttribute("cartpage") CartPage cart,
			BindingResult resultcart) {
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
	     model.addObject("listprofileMenu",listprofileMenu);
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
	    model.addObject("listMenu",listMenu);
	    List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
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
			cartitem.setBuyingPrice(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setTotal(product.getPrice() - product.getDiscount() * product.getPrice() / 100);
			cartitem.setCartItemNo(cartitem.getCartItemNo() + 1);

			// insert a new cartLine
			cartservice.add(cartitem);
			model.addObject("message", env.getProperty("cart.addproduct"));		
			System.out.println("cartitem is added");
			// update the cart
			cartpage.setGrandTotal(cart.getGrandTotal() + cartitem.getBuyingPrice());
			cartpage.setCartitem(cartpage.getCartitem() + 1);
			cartservice.updateCartPage(cartpage);
			System.out.println("cartpage updated");
			String imageSection="Header";
			List<Images> headerImages = productservice.getImagesBySection(imageSection);
		    model.addObject("headerImages",headerImages);
			List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation",listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.addObject("listcustomercartitem", listcustomercartitem);
			model.setViewName("VeggieFridge");
		}
		/* return "redirect:/cart/listCustomerCartItem"; */
		return model;

	}

	 //listCartItem
	@RequestMapping(value = "/listCustomerCartItem")
	public ModelAndView listCustomerCartItem(ModelAndView model, @ModelAttribute CartPage cartpage,
			BindingResult result) {
		// List<CartItem> listcustomercartitem =
		// cartservice.list(this.getCartPage().getCartpageid());
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
	     model.addObject("listprofileMenu",listprofileMenu);
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
	    model.addObject("listMenu",listMenu);
	    Object headerImages="Header";
		model.addObject("headerImages",headerImages);
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		// model.setViewName("cartitemlist");
		model.setViewName("cart");
		return model;
	}

	@RequestMapping("/changeLocation")
	public ModelAndView continueLoc(ModelAndView model, @ModelAttribute("kiosklocation") KioskLocation kiosklocation,
			BindingResult resultlocation)

	{
		String imageSection = "Header";
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productservice.getAllProducts();
		List<Customer> listCustomer = customerService.getAllCustomers();
		List<Images> headerImages = productservice.getImagesBySection(imageSection);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
	     model.addObject("listprofileMenu",listprofileMenu);
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
	    model.addObject("listMenu",listMenu);
	    model.addObject("headerImages",headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		/* model.setViewName("registerdhome"); */
		model.setViewName("VeggieFridge");
		return model;
	}

	// edit customer
	@RequestMapping(value = "/editProfile{customerid}", method = RequestMethod.GET)
	public ModelAndView editProfile() {
		System.out.println("editProfile");
		Customer customer = customerService.getCustomer(this.getCartPage().getCustomer().getCustomerid());
		System.out.println("customer" + customer.toString());
		System.out.println("customName" + customer.getFirstName());
		ModelAndView model = new ModelAndView("editprofile");
		model.addObject("customer", customer);
		return model;
	}

	//save and update customer
	@RequestMapping(value = "/saveEditProfile", method = RequestMethod.POST)
	public ModelAndView saveEditCustomer(ModelAndView model, @Valid @ModelAttribute("customer") Customer customer,
			BindingResult result, HttpSession session) {
		customerService.updateCustomer(customer);
		model.setViewName("");
		return model;
	}

	//changePassword
	@RequestMapping(value = "/editPassword/{email}")
	public String resetPassword(@PathVariable String email, Model model) {
		// check if the email id is valid and registered with us.
        Customer customer = new Customer(); 
		customer.setEmail(email);
		model.addAttribute("customer", customer);
		return "EditPassword";
	}
     
	 //mapping set New Password
	@RequestMapping(value = "/changeNewPassword", method = RequestMethod.POST)
	public String setNewPassword(@ModelAttribute("customer") Customer cust, ModelMap map, BindingResult resultcust) {
	Customer customer = customerService.getCustomerByEmail(this.getCartPage().getCustomer().getEmail());
	System.out.println("mailid"+customer.getEmail());
	if (customer!=null){
			// update password and Acct Status $ Displyay Successe Message
			/* customer.setPassword(cust.getNewPassword()); */
		    String encodedPassword = EncryptPassword.sha256(cust.getNewPassword());
			customer.setPassword(encodedPassword);
			customerService.updateCustomer(customer);
			System.out.println("update customer successfully");
		}
	return "redirect:/home/loginform";
	}

}
