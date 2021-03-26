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
			Membershipservice.add(msw);
			System.out.println("member is adding");
		}
		return "redirect:/home/wallet";
	}
	
	
}
