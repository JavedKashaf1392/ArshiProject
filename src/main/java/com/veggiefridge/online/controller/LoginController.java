package com.veggiefridge.online.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.LoginService;

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
		 
}
		
		
		
		
		
		

