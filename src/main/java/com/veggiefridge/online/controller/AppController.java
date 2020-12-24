package com.veggiefridge.online.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;

@Controller
public class AppController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private HttpSession session;
	
	
	private static final Logger logger = LoggerFactory.logger(MembershipController.class);

	
	      //list Product
		@RequestMapping(value="/")
		public ModelAndView listProduct(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("customer") Customer customer, BindingResult  resultcustomer) throws IOException{
			List<Customer> listCustomer = customerservice.getAllCustomers();
			List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
			List<Product> listProduct = productService.getAllProducts();
			model.addObject("listkiosklocation",listkiosklocation);
			model.addObject("listProduct",listProduct);
			model.addObject("listCustomer ",listCustomer);
			model.setViewName("home");
			return model;
		    }
		
	
	@RequestMapping("/continueLocation")  
	public ModelAndView continueLoc(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	
	{ 
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.setViewName("guest");
		return model; 
	} 
	
	
	/*
	 * @RequestMapping(value = "/admin", method = RequestMethod.GET) public String
	 * adminPage(ModelMap model) { List<Product> listProduct =
	 * productService.getAllProducts(); model.addAttribute("listProduct",
	 * listProduct); model.addAttribute("user", getPrincipal()); return "adminpage";
	 * }
	 */

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		return "admin";
	}
	
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String dba(ModelMap model) {
		return "dba";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	   public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      if (auth != null){    
	         new SecurityContextLogoutHandler().logout(request, response, auth);
	      }
	      return "redirect:/login";
	   }

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	// get cartPage
	private CartPage getCartPage() {
		return ((Customer) session.getAttribute("customer")).getCartpage();
	}
	
	
	@RequestMapping(value="/defaultTarget")
	public ModelAndView defaultTarget(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	
	{ 
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		/* model.setViewName("registerdhome"); */
		model.setViewName("registerdhome");
		return model; 
	} 
	
		
	@RequestMapping("/regcontinueLocation")  
	public ModelAndView regcontinueLocation(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	{ 
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.setViewName("registerdhome");
		return model; 
	} 
	
	//currentorder
	@RequestMapping(value = "/signup")
	public ModelAndView signUp(ModelAndView model,@ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		model.addObject("listkiosklocation",listkiosklocation);
		model.setViewName("/signup");
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		
		if (error != null) {
			model.addObject("error","Invalid username and password!");
			getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("loginform");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}
	
	
    //addGuestCustomer
	//save and update customer
	@RequestMapping(value = "/addguestcustomer", method = RequestMethod.POST)
	public ModelAndView addGuestCustomer(ModelAndView model,@ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
			
		 if (customer.getCustomerid() == 0) { // if customer id is 0 then creating the
			 // customer other updating the customer 
			 String roles="ROLE_USER";
		     customer.setRole(roles);
		     //String securePassword = get_SHA_256_SecurePassword(passwordToHash, salt);
		     //customer.setPassword(securePassword);
		     // create a new cart
		    CartPage cartpage= new CartPage();
		    cartpage.setCustomer(customer);
		    customer.setCartpage(cartpage);
		    customer.setPassword(EncryptPassword.sha256(customer.getPassword())); 
			customerservice.addCustomer(customer);
			logger.info("customer add succesfully");
			List<Customer> listCustomer = customerservice.getAllCustomers();
			List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
			List<Product> listProduct = productService.getAllProducts();
			model.addObject("listkiosklocation",listkiosklocation);
		    model.addObject("listCustomer", listCustomer); 
			model.addObject("listProduct", listProduct);
			session.setAttribute("customer", customer);
			model.setViewName("loginform");
		}
		return model; 
		
	}
	
	 //myCart
	@RequestMapping(value = "/paymentoption")
	public ModelAndView myCart(ModelAndView model) {
		model.setViewName("payment");
		return model;
	}
	
	 //myCart
	@RequestMapping(value = "/payopt")
	public ModelAndView payopt(ModelAndView model) {
		model.setViewName("/payopt");
		return model;
	}
	
}

