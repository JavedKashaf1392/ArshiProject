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
@SessionAttributes("user")
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
		public String saveCustomer(@Valid @ModelAttribute("customer")Customer customer,BindingResult result) {
			if (result.hasErrors()) {
				return "newregistration";
				
			} else if (customer.getCustomerid() == 0) { // if customer id is 0 then creating the
				// customer other updating the customer 
			   custservice.addCustomer(customer);
			} else {
				custservice.updateCustomer(customer);
			}
			return "SuccessRegistration";
		}
	
		
		 //login Process
		 @RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
		  public ModelAndView loginProcess(HttpServletRequest request, HttpServletResponse response,
		  @ModelAttribute("User") User user) {
		    ModelAndView mav = null;
		    Customer customer = loginservice.validateCustomer(user);
		    if (null != customer) {
		    mav = new ModelAndView("welcome");
		    mav.addObject("firstname", customer.getFirstName());
		    } else {
		    mav = new ModelAndView("user");
		    mav.addObject("message", "EmailId or Password is wrong!!");
		     }
		    return mav;
		  }
 		
		 //forgot password
		 @RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
		 public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("forgotPassword");
			 return mav;
			 }

       // generatelink
		 @RequestMapping(value = "/generateLink", method = RequestMethod.POST)
		 public ModelAndView generateLink(HttpServletRequest request, HttpServletResponse response) {
			 ModelAndView mav = new ModelAndView("generateLink");
			 return mav;	 
		 }
          		 

		    //login
		    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
			public ModelAndView login(
				@RequestParam("email") String email,
				@RequestParam("password") String password,
				HttpSession session,
				ModelMap modelMap,ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation) {
		    	if(email.equalsIgnoreCase("aq@gmail.com") && password.equalsIgnoreCase("abc")) {
					session.setAttribute("email", email);
					List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
					List<Product> listProduct = productService.getAllProducts();
					List<Customer> listCustomer = custservice.getAllCustomers();
					model.addObject("listCustomer", listCustomer);
					model.addObject("listkiosklocation",listkiosklocation);
					model.addObject("listProduct", listProduct);
					model.setViewName("registerdhome");
					return model; 

				} else {
					model.addObject("error", "Invalid Account");
					model.setViewName("home");
					return model;
				}
			
		    }
		    
		    //logout
			@RequestMapping(value = "/logout", method = RequestMethod.GET)
			public String logout(HttpSession session) {
				session.removeAttribute("email");
				return "redirect:/home/viewhome";
			}

}



		
		
		
		
		
		

