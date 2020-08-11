package com.veggiefridge.online.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	
	private static final Logger logger = Logger.getLogger(CustomerController.class);

	public CustomerController() {
		System.out.println("CustomerController()");
	}

	@Autowired
	private CustomerService customerService;

	
//	getAll Customer
	@RequestMapping(value = "/listCustomer")
	public ModelAndView listCustomer(ModelAndView model) throws IOException {
		List<Customer> listCustomer = customerService.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.setViewName("customerlist");
		return model;
	}
	
//	add customer
	@RequestMapping(value = "/newCustomer", method = RequestMethod.GET)
	public ModelAndView newCustomer(ModelAndView model) {
		Customer customer = new Customer();
		model.addObject("customer", customer);
		model.setViewName("customerform");
		return model;
	}
	
//	save and update customer
	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public String saveCustomer(@Valid @ModelAttribute("customer")Customer customer,BindingResult result,HttpSession session) {
		if (result.hasErrors()) {
			return "customerform";
			
		} else if (customer.getCustomerid() == 0) { // if customer id is 0 then creating the
			// customer other updating the customer 
			customerService.addCustomer(customer);
			session.setAttribute("customer", customer);
		} else {
			customerService.updateCustomer(customer);
		}
		return "redirect:/customer/listCustomer";
	}

	
//	edit customer
	 @RequestMapping(value = "/editCustomer", method = RequestMethod.GET) 
	    public ModelAndView editCustomer(HttpServletRequest request) { 
		   int customerid = Integer.parseInt(request.getParameter("customerid"));
		   Customer customer = customerService.getCustomer(customerid); 
		   ModelAndView model = new ModelAndView("customerform");
		   model.addObject("customer", customer);
		   return model;
		  }
	 
	 
	 //delete customer
	 @RequestMapping(value = "/deleteCustomer", method = RequestMethod.GET)
		public String deleteCustomer(@RequestParam("customerid") Integer customerId) {
		 customerService.deleteCustomer(customerId);
			return "redirect:/customer/listCustomer ";
		}
	 
		}
		
				

		  
		  
	  
	 
	 
	 

	
	
	
	
	

	