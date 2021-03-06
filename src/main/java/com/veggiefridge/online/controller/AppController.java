package com.veggiefridge.online.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.dao.MenuDao;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.SubMenu;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.MenuService;
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
	
	@Autowired
	private MenuService menuservice;
	
	@Autowired
	private MenuDao menudao;
	
	
	private static final Logger logger = LoggerFactory.logger(MembershipController.class);

	
	 //permitAll acsess url
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView permitAll(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model,@ModelAttribute("menu") Menu menu) {
		String imageSection = "Header";
		List<Images> headerImages = menuservice.getImagesBySection(imageSection);
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("headerImages", headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation", listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
		model.addObject("blurimage",VFOnlineConstants.headeblurimage);
		model.addObject("classvalue", VFOnlineConstants.classvalue);
		model.addObject("animateimage",VFOnlineConstants.animateimage);
		model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
		/* model.setViewName("registerdhome"); */
		  String section2= "Profile";	
	  		List<Menu> allMenu = menuservice.getmenuandsubMenu(section2);
	  		System.out.println("===================================");
	  		for (Menu menu2 : allMenu) {
	  	    System.out.println("menu"+menu2);
		     }
		model.addObject("menuLevel1", allMenu);
		/* model.setViewName("VeggieFridge"); */
		model.setViewName("home");
		return model;
	}
			 
		 //Sign in
	    @RequestMapping(value = "/login", method = RequestMethod.GET)
		public ModelAndView login(@RequestParam(value = "error", required = false) String error,
				@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

			ModelAndView model = new ModelAndView();
			
			if (error != null) {
				model.addObject("error","Invalid username and password!");
				getErrorMessage(request,"SPRING_SECURITY_LAST_EXCEPTION");
				
			}

			if (logout != null) {
				model.addObject("msg",VFOnlineConstants.LOGOUT);
			}
			model.addObject("error_msg", VFOnlineConstants.WRONG_EMAIL_PASSWORD);
			model.setViewName("loginform");

			return model;
		}
	    
	    //Sign up
		@RequestMapping(value = "/signup")
		public ModelAndView signUp(ModelAndView model,@ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
			List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
			model.addObject("listkiosklocation",listkiosklocation);
			model.setViewName("/registered");
			return model;
		}
	    
		//Log Out
		@RequestMapping(value="/logout", method = RequestMethod.GET)
		   public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		      if (auth != null){    
		         new SecurityContextLogoutHandler().logout(request, response, auth);
		      }
		      return "veggiefridge";
		   }

		//Acess Denied
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
	public ModelAndView defaultTarget(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("menu")Menu menu,Model model2) 
	
	{ 
		String imageSection = "Header";
		List<Images> headerImages = menuservice.getImagesBySection(imageSection);
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
	    model.addObject("listNavbarMenu",listNavbarMenu);
	    model.addObject("headerImages",headerImages);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
		model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
		model.addObject("blurimage",VFOnlineConstants.headeblurimage);
		model.addObject("classvalue", VFOnlineConstants.classvalue);
		model.addObject("animateimage",VFOnlineConstants.animateimage);
		/* model.setViewName("registerdhome"); */
	    
		//Profile Menu
		    String section2= "Profile";	
	  		List<Menu> allMenu = menuservice.getmenuandsubMenu(section2);
	  		System.out.println("===================================");
	  		for (Menu menu2 : allMenu) {
	  	    System.out.println("menu"+menu2);
		     }
		model.addObject("menuLevel1", allMenu);
		model.setViewName("home");
		return model;
		}
		
	

	//customize the error message
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
	@RequestMapping(value = "/newcustomer", method = RequestMethod.POST)
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
		    Wallet wallet= new Wallet();
		    wallet.setCustomer(customer);
		    customer.setWallet(wallet);
		    customer.setPassword(EncryptPassword.sha256(customer.getPassword())); 
			customerservice.addCustomer(customer);
			logger.info("customer add succesfully");
			List<Customer> listCustomer = customerservice.getAllCustomers();
			List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
			List<Product> listProduct = productService.getAllProducts();
			model.addObject("listkiosklocation",listkiosklocation);
		    model.addObject("listCustomer", listCustomer); 
			model.addObject("listProduct", listProduct);
			model.addObject("blurimage",VFOnlineConstants.headeblurimage);
			model.addObject("classvalue", VFOnlineConstants.classvalue);
			model.addObject("animateimage",VFOnlineConstants.animateimage);
			model.addObject("msg","Customer Registered Successfully");
			session.setAttribute("customer", customer);
			model.setViewName("loginform");
		}
		return model; 
		
	}
	
	
     //Serach Products By catogary
    @RequestMapping(value = "/ProductsByCatogary")
    public ModelAndView ProductByFruits(HttpServletRequest request, HttpServletResponse response,
				@ModelAttribute("Product") Product product, ModelAndView model) {
     	
    String imageSection = "Header";
    String category = request.getParameter("param");
     	System.out.println("Catogary"+ category);
			List<Product> listProduct= productService.GetAllProductByCatogary(category);
			System.out.println("All data" + listProduct.toString());
			List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
			/* List<Product> listProduct = productService.getAllProducts(); */
			List<Customer> listCustomer = customerservice.getAllCustomers();
			List<Images> headerImages = menuservice.getImagesBySection(imageSection);
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("category",category);
			model.addObject("listNavbarMenu",listNavbarMenu);
			model.addObject("headerImages", headerImages);
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation", listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
			model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
			if (category.equalsIgnoreCase("Leafy Vegetables")) {
			model.addObject("title","Leafy Vegetables");
			}
			else if(category.equalsIgnoreCase("Fruit Vegetables")) {
				model.addObject("title","Fruit Vegetables");
			}
			else if(category.equalsIgnoreCase("Milk")) {
				model.addObject("title","Milk");
			}
			/* model.setViewName("registerdhome"); */ 
			/* model.setViewName("VeggieFridge"); */
			model.setViewName("home");
			return model;
		}
            
   	        //PickupAddressPaymrntOption
  	  		@RequestMapping(value = "/thankForOrder", method = RequestMethod.GET)
  	  		public String thankForOrder(ModelMap model) {
  	  			return "thanksfororder";
  	  		}
  	    
    
  	  	     //PickupAddressPaymrntOption
  	  		@RequestMapping(value = "/demo", method = RequestMethod.GET)
  	  		public String demo(Model model) {
  	  		List<Menu> allMenu = menudao.getMenuAndSubMenu();
  	  		System.out.println("===================================");
  	  		for (Menu menu : allMenu) {
  	  			System.out.println("menu"+menu);
				
			}
  			model.addAttribute("menuLevel1", allMenu);
  	  			return "menu";
  	  		}
  
  	  		 //PickupAddressPaymrntOption
  	  		@RequestMapping(value = "/promenu", method = RequestMethod.GET)
  	  		public String promenu(Model model) {
  	  		List<Menu> allMenu = menudao.getMenuAndSubMenu();
  	  		System.out.println("===================================");
  	  		for (Menu menu : allMenu) {
  	  			System.out.println("menu"+menu);
				
			}
  			model.addAttribute("menuLevel1", allMenu);
  	  			return "header";
  	  		}
  
  	  	 //PickupAddressPaymrntOption
  	    @RequestMapping(value ="/profilemenu", method = RequestMethod.GET)
  	  	public String profilemenu(Model model,ModelAndView mode1 ) {
  	  	String section= "Profile";	
  	  	List<Menu> allMenu = menuservice.getmenuandsubMenu(section);
  	    String section2 = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section2);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
  	  		System.out.println("===================================");
  	  		for (Menu menu : allMenu) {
  	  			System.out.println("menu"+menu);
				
			}
  	  	    model.addAttribute("listNavbarMenu",listNavbarMenu);
  			model.addAttribute("menuLevel1", allMenu);
  	  			return "newhead";
  	  		}
  
  	  	  //addGuestCustomer
  	  	 //save and update customer
  	  	@RequestMapping(value = "/addguestcustomers", method = RequestMethod.POST)
  	  	public ModelAndView addGuestCustomers(ModelAndView model,@ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
  	  			
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
  	  		    Wallet wallet= new Wallet();
  	  		    wallet.setCustomer(customer);
  	  		    customer.setWallet(wallet);
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
  	  	
  	  	
  	     //registeredhome
  		@RequestMapping(value = "/registeredhome", method = RequestMethod.GET)
  		public String registeredhome(ModelMap model) {
			 return "registeredhome"; 
  			
  		}
  		
  		 //registered
  		@RequestMapping(value = "/registered", method = RequestMethod.GET)
  		public String registered(ModelMap model) {
			 return "registered"; 
  			
  		}
  		
  		

  		@RequestMapping(value = "/VFAbout", method = RequestMethod.GET)
		public ModelAndView VFAbout(HttpServletRequest request, HttpServletResponse response,
				@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
			String imageSection = "Header";
			List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
			List<Product> listProduct = productService.getAllProducts();
			List<Customer> listCustomer = customerservice.getAllCustomers();
			List<Images> headerImages = menuservice.getImagesBySection(imageSection);
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("listNavbarMenu", listNavbarMenu);
			model.addObject("headerImages", headerImages);
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation", listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
			model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
			model.addObject("blurimage",VFOnlineConstants.headeblurimage);
			model.addObject("classvalue", VFOnlineConstants.classvalue);
			model.addObject("animateimage",VFOnlineConstants.animateimage);
			/* model.setViewName("registerdhome"); */ 
			 model.setViewName("VFAbout");
			return model;
		}
	    
	  		
	  		
	  		@RequestMapping(value="/shopNow")
	  		public ModelAndView shopNow(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("menu")Menu menu,Model model2) 
	  		
	  		{ 
	  			String imageSection = "Header";
	  			List<Images> headerImages = menuservice.getImagesBySection(imageSection);
	  			List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
	  			List<Product> listProduct = productService.getAllProducts();
	  			List<Customer> listCustomer = customerservice.getAllCustomers();
	  			String section = "Navbar";
	  			List<Menu> listNavbarMenu = menuservice.getMenu(section);
	  		    model.addObject("listNavbarMenu",listNavbarMenu);
	  		    model.addObject("headerImages",headerImages);
	  			model.addObject("listCustomer", listCustomer);
	  			model.addObject("listkiosklocation",listkiosklocation);
	  			model.addObject("listProduct", listProduct);
	  			model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
	  			model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
	  			/* model.setViewName("registerdhome"); */
	  		    
	  			//Profile Menu
	  			    String section2= "Profile";	
	  		  		List<Menu> allMenu = menuservice.getmenuandsubMenu(section2);
	  		  		System.out.println("===================================");
	  		  		for (Menu menu2 : allMenu) {
	  		  	    System.out.println("menu"+menu2);
	  			     }
	  			model.addObject("menuLevel1", allMenu);
	  			model.setViewName("home");
	  			return model;
	  			}
	  			
	  		
	  		
	  		
	  	     //Home Menu Url
			@RequestMapping(value = "/returnToHome", method = RequestMethod.GET)
			public ModelAndView returnToHome(HttpServletRequest request, HttpServletResponse response,
					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
				String imageSection = "Header";
				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
				List<Product> listProduct = productService.getAllProducts();
				List<Customer> listCustomer = customerservice.getAllCustomers();
				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
				String section = "Navbar";
				List<Menu> listNavbarMenu = menuservice.getMenu(section);
				model.addObject("listNavbarMenu", listNavbarMenu);
				model.addObject("headerImages", headerImages);
				model.addObject("listCustomer", listCustomer);
				model.addObject("listkiosklocation", listkiosklocation);
				model.addObject("listProduct", listProduct);
				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
				model.addObject("classvalue", VFOnlineConstants.classvalue);
				model.addObject("animateimage",VFOnlineConstants.animateimage);
				model.addObject("message",VFOnlineConstants.CART_PRODUCT_ADD);
				/* model.setViewName("registerdhome"); */ 
				 model.setViewName("home");
				return model;
			}
			
		
  	  	   
  	  		@RequestMapping(value = "/header", method = RequestMethod.GET)
  	  		public String head(ModelMap model) {
  	  			return "header";
  	  		}
  	  		
  	  		
  	  	    
  	  		@RequestMapping(value = "/checkmail", method = RequestMethod.GET)
  	  		public String checkMail(ModelMap model) {
  	  			return "checkMail";
  	  		}
  	  	    
  	  	     
  	  		@RequestMapping(value = "/changepassword", method = RequestMethod.GET)
  	  		public String changepasswordl(ModelMap model) {
  	  			return "changePassword";
  	  		}
  	   	
  		@RequestMapping(value = "/cartnew", method = RequestMethod.GET)
  		public String cartnew(ModelMap model) {
  			return "cartnew";
  		}
  		
  		
  	        //Home Menu Url
  			@RequestMapping(value = "/VeggieFridge", method = RequestMethod.GET)
  			public ModelAndView VeggieFridge(HttpServletRequest request, HttpServletResponse response,
  					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
  				String imageSection = "Header";
  				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
  				List<Product> listProduct = productService.getAllProducts();
  				List<Customer> listCustomer = customerservice.getAllCustomers();
  				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
  				String section = "Navbar";
  				List<Menu> listNavbarMenu = menuservice.getMenu(section);
  				model.addObject("listNavbarMenu", listNavbarMenu);
  				model.addObject("headerImages", headerImages);
  				model.addObject("listCustomer", listCustomer);
  				model.addObject("listkiosklocation", listkiosklocation);
  				model.addObject("listProduct", listProduct);
  				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
  				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
  				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
  				model.addObject("classvalue", VFOnlineConstants.classvalue);
  				model.addObject("animateimage",VFOnlineConstants.animateimage);
  				/* model.setViewName("registerdhome"); */ 
  				 model.setViewName("VeggieFridge");
  				return model;
  			}
  			
  			
  		     //Home Menu Url
  			@RequestMapping(value = "/home", method = RequestMethod.GET)
  			public ModelAndView registerdhome(HttpServletRequest request, HttpServletResponse response,
  					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
  				String imageSection = "Header";
  				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
  				List<Product> listProduct = productService.getAllProducts();
  				List<Customer> listCustomer = customerservice.getAllCustomers();
  				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
  				String section = "Navbar";
  				List<Menu> listNavbarMenu = menuservice.getMenu(section);
  				model.addObject("listNavbarMenu", listNavbarMenu);
  				model.addObject("headerImages", headerImages);
  				model.addObject("listCustomer", listCustomer);
  				model.addObject("listkiosklocation", listkiosklocation);
  				model.addObject("listProduct", listProduct);
  				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
  				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
  				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
  				model.addObject("classvalue", VFOnlineConstants.classvalue);
  				model.addObject("animateimage",VFOnlineConstants.animateimage);
  				model.addObject("title","Home");
  				/* model.setViewName("registerdhome"); */ 
  				 model.setViewName("home");
  				return model;
  			}
  			
  			
  		    
  			@RequestMapping(value = "/manageLocation", method = RequestMethod.GET)
  			public ModelAndView manageLocation(HttpServletRequest request, HttpServletResponse response,
  					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
  				String imageSection = "Header";
  				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
  				List<Product> listProduct = productService.getAllProducts();
  				List<Customer> listCustomer = customerservice.getAllCustomers();
  				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
  				String section = "Navbar";
  				List<Menu> listNavbarMenu = menuservice.getMenu(section);
  				model.addObject("listNavbarMenu", listNavbarMenu);
  				model.addObject("headerImages", headerImages);
  				model.addObject("listCustomer", listCustomer);
  				model.addObject("listkiosklocation", listkiosklocation);
  				model.addObject("listProduct", listProduct);
  				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
  				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
  				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
  				model.addObject("classvalue", VFOnlineConstants.classvalue);
  				model.addObject("animateimage",VFOnlineConstants.animateimage);
  				model.addObject("title","Manage Location");
  				/* model.setViewName("registerdhome"); */ 
  				 model.setViewName("home");
  				return model;
  			}
  			
  			
  			
  			@RequestMapping(value = "/manageProduct", method = RequestMethod.GET)
  			public ModelAndView manageProduct(HttpServletRequest request, HttpServletResponse response,
  					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
  				String imageSection = "Header";
  				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
  				List<Product> listProduct = productService.getAllProducts();
  				List<Customer> listCustomer = customerservice.getAllCustomers();
  				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
  				String section = "Navbar";
  				List<Menu> listNavbarMenu = menuservice.getMenu(section);
  				model.addObject("listNavbarMenu", listNavbarMenu);
  				model.addObject("headerImages", headerImages);
  				model.addObject("listCustomer", listCustomer);
  				model.addObject("listkiosklocation", listkiosklocation);
  				model.addObject("listProduct", listProduct);
  				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
  				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
  				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
  				model.addObject("classvalue", VFOnlineConstants.classvalue);
  				model.addObject("animateimage",VFOnlineConstants.animateimage);
  				model.addObject("title","Manage Product");
  				/* model.setViewName("registerdhome"); */ 
  				 model.setViewName("home");
  				return model;
  			}
  			
  			
  			@RequestMapping(value = "/manageKiosk", method = RequestMethod.GET)
  			public ModelAndView manageKiosk(HttpServletRequest request, HttpServletResponse response,
  					@ModelAttribute("kiosklocation") KioskLocation kiosklocation, ModelAndView model) {
  				String imageSection = "Header";
  				List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
  				List<Product> listProduct = productService.getAllProducts();
  				List<Customer> listCustomer = customerservice.getAllCustomers();
  				List<Images> headerImages = menuservice.getImagesBySection(imageSection);
  				String section = "Navbar";
  				List<Menu> listNavbarMenu = menuservice.getMenu(section);
  				model.addObject("listNavbarMenu", listNavbarMenu);
  				model.addObject("headerImages", headerImages);
  				model.addObject("listCustomer", listCustomer);
  				model.addObject("listkiosklocation", listkiosklocation);
  				model.addObject("listProduct", listProduct);
  				model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
  				model.addObject("orderdetails", VFOnlineConstants.ORDERDETIAL_HEADING);
  				model.addObject("blurimage",VFOnlineConstants.headeblurimage);
  				model.addObject("classvalue", VFOnlineConstants.classvalue);
  				model.addObject("animateimage",VFOnlineConstants.animateimage);
  				model.addObject("title","Manage Kiosk");
  				/* model.setViewName("registerdhome"); */ 
  				 model.setViewName("home");
  				return model;
  			}
  			
  			@RequestMapping(value = "/discount", method = RequestMethod.GET)
  	  		public ModelAndView discount(ModelAndView model) {
  				model.addObject("title","Discount");
  				model.setViewName("discount");
   				return model;
  	  		}
  	  		
  			
  			@RequestMapping(value = "/blog", method = RequestMethod.GET)
  	  		public ModelAndView blog(ModelAndView model) {
  				model.addObject("title","Blog");
  				model.setViewName("blog");
   				return model;
  	  		}
  	  		
  			
  			@RequestMapping(value = "/contactus", method = RequestMethod.GET)
  	  		public ModelAndView contactus(ModelAndView model) {
  				model.addObject("title","Contact Us");
  				model.setViewName("contactus");
   				return model;
  	  		}
  		
  	  		
  	    
  	  		
  	  		@RequestMapping(value ="/getServerTime")
  	  		@ResponseBody
  	  		public String getServerTime(ModelMap model) {
  	  			Date d= new Date();
  	  			System.out.println("API is Calling........" +d);
  	  			return d.toString();
  	  		}
 		 
}

