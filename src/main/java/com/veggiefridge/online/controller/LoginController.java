package com.veggiefridge.online.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.service.CustomerService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	public LoginController() {
		System.out.println("LoginController.LoginController()");
	}
	
	@Autowired
	private CustomerService loginservice;
	
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
			model.setViewName("customerform");
			return model;
		}
	 
}
