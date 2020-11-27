package com.veggiefridge.online.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Membership;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.MembershipService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value = "/member")
public class MembershipController {

	@Autowired
	private MembershipService Membershipservice;

	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private EncryptPassword enpwd;

	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);

	// saveMember
	@RequestMapping(value = "/addMember/{customerid}")
	public String addMember(@PathVariable int customerid) {
		Membership msw = Membershipservice.getByCustomer(customerid);
		if (msw == null) {
			double totalAmountBalance = 5000;
			// add a new Member if a new product is getting added
			msw = new Membership();
			System.out.println("add a new memeber if a new member is getting added");
			Customer customer = customerservice.getCustomer(customerid);
			System.out.println("get Member");
			// transfer the customer details to memebership
			msw.setCustomer(customer);
			msw.setJoiningDate(new Date());
			msw.setLastUpdateDate(new Date());
			msw.setTotalAmountBalance(totalAmountBalance);
			Membershipservice.add(msw);
			System.out.println("member is adding");
		}
		return "redirect:/home/wallet";
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
			model.setViewName("registerdhome");
		}
		return model; 
		
	}
}
