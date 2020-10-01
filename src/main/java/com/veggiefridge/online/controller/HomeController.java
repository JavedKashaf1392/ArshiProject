package com.veggiefridge.online.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	public HomeController() {
		System.out.println("Home.Home()");
	}
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private CustomerService customerservice;
	

	@Autowired
	private CartService cartservice;
	
	@Autowired
	HttpSession session;
	
	

    //get cartPage
	private	CartPage getCartPage(){
			return ((Customer)session.getAttribute("customer")).getCartpage();
		}
	
   
	
	 //list Product
	@RequestMapping(value="/viewhome")
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
	public ModelAndView continueLocation(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	
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
	
	
	// save location
    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public ModelAndView saveKiosk(ModelAndView model,@ModelAttribute("customer") Customer customer, BindingResult  resultcustomer,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultkiosklocation) {

		  if (customer.getCustomerid() == 0) { // if kiosk id is 0 then creating the
			// kiosk other updating the kiosk
			customerservice.addCustomer(customer);
			System.out.println("addcustomer method is running");
			
		}
		  List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
			List<Product> listProduct = productService.getAllProducts();
			List<Customer> listCustomer = customerservice.getAllCustomers();
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation",listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.setViewName("registerdhome");
			return model; 
		  //else {
			 // System.out.println("updateKiosk method is running");
			  //service.updateKiosk(kiosk);  
		//}			
 	}
    
    
    

	@RequestMapping("/regcontinueLocation")  
	public ModelAndView regcontinueLocation(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	{ 
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.setViewName("registerdhome");
		return model; 
	} 
	    //Edit profile
		@RequestMapping(value = "/editProfile")
		public ModelAndView editProfile(ModelAndView model) {
			model.setViewName("editprofile");
			return model;
		}
	
	
		 //myCart
		@RequestMapping(value = "/myCart")
		public ModelAndView myCart(ModelAndView model) {
			model.setViewName("cart");
			return model;
		}
	
		
		 //myCart
		@RequestMapping(value = "/cart")
		public ModelAndView Cart(ModelAndView model) {
			model.setViewName("cart");
			return model;
		}
	
		
		
		 //myorder
		@RequestMapping(value = "/myorder")
		public ModelAndView myOrder(ModelAndView model) {
			model.setViewName("myorder");
			return model;
		}
		
		//myorder
				@RequestMapping(value = "/orderinfo")
				public ModelAndView orderInfo(ModelAndView model) {
					model.setViewName("orderinfo");
					return model;
				}
				
				//myorder
				@RequestMapping(value = "/repeatorder")
				public ModelAndView repeatOrder(ModelAndView model) {
					model.setViewName("repeatOrder");
					return model;
				}
				
				
				
				//wallet
				@RequestMapping(value ="/wallet")
				public ModelAndView wallet(ModelAndView model) {
					model.setViewName("wallet");
					return model;
				}
		
				

				//wallet
				@RequestMapping(value ="/footer")
				public ModelAndView footer(ModelAndView model) {
					model.setViewName("footer");
					return model;
				}
		
				
				//currentorder
				@RequestMapping(value = "/currentorder")
				public ModelAndView currentOrder(ModelAndView model) {
					model.setViewName("/CurrentOrder");
					return model;
				}
	

				//currentorder
				@RequestMapping(value = "/chooseanamount")
				public ModelAndView chooseAnAmount(ModelAndView model) {
					model.setViewName("/chooseanamount");
					return model;
				}
				
			
				//currentorder
				@RequestMapping(value = "/slider")
				public ModelAndView slider(ModelAndView model) {
					model.setViewName("/sliderjsp");
					return model;
				}
							
				//current order
				@RequestMapping(value = "/header")
				public ModelAndView header(ModelAndView model,@ModelAttribute("customer") Customer customer, BindingResult  resultcustomer,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultkiosklocation) {
					List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
					List<Product> listProduct = productService.getAllProducts();
					List<Customer> listCustomer = customerservice.getAllCustomers();
					model.addObject("listCustomer", listCustomer);
					model.addObject("listkiosklocation",listkiosklocation);
					model.addObject("listProduct", listProduct);
					return model;
				}
	
				

				//
				@RequestMapping(value = "/guestHeader")
				public ModelAndView guestHeader(ModelAndView model,@ModelAttribute("customer") Customer customer, BindingResult  resultcustomer,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultkiosklocation) {
					List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
					List<Product> listProduct = productService.getAllProducts();
					List<Customer> listCustomer = customerservice.getAllCustomers();
					model.addObject("listCustomer", listCustomer);
					model.addObject("listkiosklocation",listkiosklocation);
					model.addObject("listProduct", listProduct);
					model.setViewName("/guestheader");
					return model;
				}
	
				
				
				
				//home
				@RequestMapping(value = "/homepage")
				public ModelAndView homePage(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("customer") Customer customer, BindingResult resultcustomer){
					List<Customer> listCustomer = customerservice.getAllCustomers();
					List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
					List<Product> listProduct = productService.getAllProducts();
					model.addObject("listkiosklocation",listkiosklocation);
				    model.addObject("listCustomer", listCustomer); 
					model.addObject("listProduct", listProduct);
					model.setViewName("/cartview");
					return model;
				}
	
				
				
				//wallet
				@RequestMapping(value ="/loginform")
				public ModelAndView loginForm(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("customer") Customer customer, BindingResult resultcustomer) {
					List<Customer> listCustomer = customerservice.getAllCustomers();
					List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
					List<Product> listProduct = productService.getAllProducts();
					model.addObject("listkiosklocation",listkiosklocation);
				    model.addObject("listCustomer", listCustomer); 
					model.addObject("listProduct", listProduct);
					model.setViewName("loginform");
					return model;
				}
		
				
				//currentorder
				@RequestMapping(value = "/signup")
				public ModelAndView signUp(ModelAndView model) {
					model.setViewName("/signup");
					return model;
				}
				
				
			    //addGuestCustomer
				//save and update customer
				@RequestMapping(value = "/addguestcustomer", method = RequestMethod.POST)
				public ModelAndView addGuestCustomer(ModelAndView model,@ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
					
						
					 if (customer.getCustomerid() == 0) { // if customer id is 0 then creating the
						// customer other updating the customer 
						customerservice.addCustomer(customer);
						List<Customer> listCustomer = customerservice.getAllCustomers();
						List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
						List<Product> listProduct = productService.getAllProducts();
						model.addObject("listkiosklocation",listkiosklocation);
					    model.addObject("listCustomer", listCustomer); 
						model.addObject("listProduct", listProduct);
						session.setAttribute("customer", customer);
						model.setViewName("registerdhome");
					}
					return model; 
					
				}
				
				
				//currentorder
				@RequestMapping(value = "/up")
				public ModelAndView Up(ModelAndView model) {
					model.setViewName("/registerdhome");
					return model;
				}
				
				
}
				
				
				
	
		

