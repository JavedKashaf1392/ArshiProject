package com.veggiefridge.online.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.veggiefridge.online.dao.CustomerDAO;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.service.CustomerService;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private CustomerDAO customerdao;
	
	@Autowired
	private HttpSession session;
	
	private Customer customer = null;
	private CustomerModel customerModel=null;
	
	@ModelAttribute("customerModel")
	public CustomerModel getCustomerModel() {		
		if(session.getAttribute("customerModel")==null) {
			// get the authentication object
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			
			if(!authentication.getPrincipal().equals("anonymousUser")){
				// get the user from the database
				customer = customerdao.getCustomerByEmail(authentication.getName());
				
				if(customer!=null) {
					// create a new model
					customerModel = new CustomerModel();
					// set the name and the id
					customerModel.setId(customer.getCustomerid());
					customerModel.setFirstName(customer.getFirstName());
					customerModel.setRole(customer.getRole());
					
					if(customer.getRole().equals("ROLE_USER")) {
						customerModel.setCartpage(customer.getCartpage());					
					}				
					session.setAttribute("customerModel", customerModel);
					return customerModel;
				}			
			}
		}
		
		return (CustomerModel)session.getAttribute("customerModel");		
	}
	
	
	

}
