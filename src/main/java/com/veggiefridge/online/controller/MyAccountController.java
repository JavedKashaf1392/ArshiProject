package com.veggiefridge.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.MenuService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value = "/myaccount")
public class MyAccountController { 
	
	@Autowired
	private ProductService productservice;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private KioskLocationService kiosklocationservice;

	@Autowired
	private CartService cartservice;

	@Autowired
	private HttpSession session;

	@Autowired
	private Environment env;
	
	@Autowired
	private MenuService menuservice;
	


	// get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}
	
	
	     //edit customer
		@RequestMapping(value = "/editProfile",method = RequestMethod.GET)
		public ModelAndView editProfile(ModelAndView model, @Valid @ModelAttribute("customer") Customer customer,
				BindingResult result, HttpSession session) {
			System.out.println("editProfile");
			customer = customerService.getCustomer(this.getCartPage().getCustomer().getCustomerid());
			System.out.println("customer" + customer.toString());
			System.out.println("customName" + customer.getFirstName());
			model = new ModelAndView("myaccount");
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("listNavbarMenu",listNavbarMenu);
			model.addObject("customer", customer);
			return model;
		}

		 //save and update customer
		@RequestMapping(value = "/saveEditProfile", method = RequestMethod.POST)
		public ModelAndView saveEditCustomer(ModelAndView model, @Valid @ModelAttribute("customer") Customer customer,
				BindingResult result, HttpSession session) {
		    customerService.updateCustomer(customer);
		    model.addObject("message", env.getProperty("account.profileupupdated"));
		    String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("listNavbarMenu",listNavbarMenu);
			model.setViewName("myaccount");
			return model;
		}

		// changePassword
		@RequestMapping(value = "/editPassword/{email}")
		public String resetPassword(@PathVariable String email, Model model) {
			// check if the email id is valid and registered with us.
			Customer customer = new Customer();
			customer.setEmail(email);
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addAttribute("listNavbarMenu",listNavbarMenu);
			model.addAttribute("customer", customer);
			return "EditPassword";
		}

		//set New Password
		@RequestMapping(value = "/changeNewPassword", method = RequestMethod.POST)
		public String setNewPassword(@ModelAttribute("customer") Customer cust, ModelMap map, BindingResult resultcust,ModelAndView model) {
			Customer customer = customerService.getCustomerByEmail(this.getCartPage().getCustomer().getEmail());
			System.out.println("mailid" + customer.getEmail());
			if (customer != null) {
				// update password and Acct Status $ Displyay Successe Message
				/* customer.setPassword(cust.getNewPassword()); */
				String encodedPassword = EncryptPassword.sha256(cust.getNewPassword());
				customer.setPassword(encodedPassword);
				 String roles="ROLE_USER";
			     customer.setRole(roles);
				customerService.updateCustomer(customer);
				System.out.println("update customer successfully");
				String section = "Navbar";
				List<Menu> listNavbarMenu = menuservice.getMenu(section);
				model.addObject("listNavbarMenu",listNavbarMenu);
			}
			return "EditPassword";
		}
	
	
	

}
