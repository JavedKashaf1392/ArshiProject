package com.veggiefridge.online.controller;
import java.lang.reflect.Method;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.User;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.LoginService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	public LoginController() {
		System.out.println("LoginController.LoginController()");
	}
	
	@Autowired
	private CustomerService custservice;
	
	@Autowired
	private LoginService loginservice;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	
	 //view login
	 @RequestMapping(value = "/loginView", method = RequestMethod.GET)
	 public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	 ModelAndView mav = new ModelAndView("loginform");
	 return mav;
	  }
	 
	    // registered customer
		@RequestMapping(value = "/newCustomer", method = RequestMethod.GET)
		public ModelAndView newCustomer(ModelAndView model) {
			Customer customer = new Customer();
			model.addObject("customer", customer);
			model.setViewName("newregistration");
			return model;
		}
		//save and update customer
		@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
		public ModelAndView saveCustomer(@ModelAttribute("customer")Customer customer,BindingResult  resultcustomer,HttpSession session,ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {
			  if(customer.getCustomerid()==0) { // if customer id is 0 then creating the
				// customer other updating the customer 
				custservice.addCustomer(customer);
				session.setAttribute("customer", customer);
				List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
				List<Product> listProduct = productService.getAllProducts();
				List<Customer> listCustomer = custservice.getAllCustomers();
				model.addObject("listCustomer", listCustomer);
				model.addObject("listkiosklocation",listkiosklocation);
				model.addObject("listProduct", listProduct);
			} else {
				custservice.updateCustomer(customer);
			}
			model.setViewName("registerdhome");
			return model; 
		}
		
		 //forgot password
		 @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
		 public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("forgotPassword");
			 return mav;
			 }

       //generatelink
		 @RequestMapping(value = "/generateLink", method = RequestMethod.POST)
		 public ModelAndView generateLink(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("generateLink");
			 return mav;	 
		 }
          		
		 
		 //change password link
		 @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
		 public ModelAndView changePassword(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("changePassword");
			 return mav;	 
		 }
		 
		 //change password link
		 @RequestMapping(value = "/loginForm", method = RequestMethod.POST)
		 public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("loginform");
			 return mav;	 
		 }
          		
		
		    //login customer from database
		      @RequestMapping(value ="/doLogin", method = RequestMethod.POST)
			  public ModelAndView loginCustomer(ModelAndView model,@ModelAttribute("customer") Customer customer,BindingResult  resultcustomer,HttpSession session){
				
		    	if(customer.getEmail()!=null && customer.getPassword()!=null && session.getAttribute("customer")==null){
			    customer=custservice.loginCustomer(customer);
			    
			   	
			if(customer!=null){
		    session.setAttribute("customer", customer);
		    model.addObject("firstname", customer.getFirstName());
		    List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		    List<Product> listProduct = productService.getAllProducts();
		    List<Customer> listCustomer = custservice.getAllCustomers();
		    model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation",listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.setViewName("registerdhome");
			return model;
		    	}
				else {
					model.addObject("failed", "EmailId or Password is wrong!!");
					model.setViewName("home#");
					return model;
				}
		    	}
		    
				else {
					model.setViewName("registerdhome");
					return model;
				}
				}
		    
		  
		    //logout
			@RequestMapping(value = "/logout", method = RequestMethod.GET)
			public String logout(HttpSession session) {
				session.removeAttribute("customer");
				return "redirect:/home/viewhome";
			}

}



		
		
		
		
		
		

