package com.veggiefridge.online.controller;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.MembershipWallet;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.MembershipWalletService;

@Controller
@RequestMapping(value="/member")
public class MembershipController{
	
	@Autowired
	private MembershipWalletService membershipwalletservice;
	
	@Autowired
	private CustomerService customerservice;
	
	private static final Logger logger = LoggerFactory.logger(ShoppingCartController.class);

	 //saveMember
	@RequestMapping(value ="/addMember/{customerid}")
	public String addMember(@PathVariable int customerid) {
    MembershipWallet msw= membershipwalletservice.getByCustomer(customerid);
    if(msw==null){
	double totalAmountBalance=5000;	
    // add a new Member if a new product is getting added
    msw=new MembershipWallet();
	System.out.println("add a new memeber if a new member is getting added");
	Customer customer = customerservice.getCustomer(customerid);
	System.out.println("get Member");
	// transfer the customer details to memebership
	msw.setCustomer(customer);
	msw.setJoiningDate(new Date());
	msw.setLastUpdateDate(new Date());
	msw.setTotalAmountBalance(totalAmountBalance);
	membershipwalletservice.add(msw);
	System.out.println("member is adding");
	}
	return "redirect:/home/wallet";
	}	
}
