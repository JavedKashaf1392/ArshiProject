package com.veggiefridge.online.controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;
import java.util.List;
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
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	public HomeController() {
		System.out.println("Home.Home()");
	}
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private CustomerService customerservice;
 
    //list Product
	@RequestMapping(value = "/viewhome")
	public ModelAndView listProduct(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation,@ModelAttribute("customer") Customer customer, BindingResult resultcustomer) throws IOException {
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation(); 
		List<Product> listProduct = productService.getAllProducts();
		model.addObject("listkiosklocation",listkiosklocation);
	    model.addObject("customer", new Customer()); 
		model.addObject("listProduct", listProduct);
		model.setViewName("home");
		return model;
	}
	
	
	@RequestMapping("/continueLocation")  
	public ModelAndView continueLocation(ModelAndView model,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) 
	
	{ 
		List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
		List<Product> listProduct = productService.getAllProducts();
		List<Customer> listCustomer = customerservice.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.addObject("listkiosklocation",listkiosklocation);
		model.addObject("listProduct", listProduct);
		model.setViewName("newlocationhome");
		return model; 
	} 
	
	
	// save location
    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public ModelAndView saveKiosk(ModelAndView model,@ModelAttribute("customer") Customer customer, BindingResult  resultcustomer,@ModelAttribute("kiosklocation") KioskLocation kiosklocation,BindingResult resultlocation) {

		  if (customer.getCustomerid() == 0) { // if kiosk id is 0 then creating the
			// kiosk other updating the kiosk
			customerservice.addCustomer(customer);
			System.out.println("addcustomer method is running");
			
		}
		  List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
			List<Product> listProduct = productService.getAllProducts();
			List<Customer> listCustomer = customerservice.getAllCustomers();
			model.addObject("listCustomer", listCustomer);
			model.addObject("listkiosklocation",listkiosklocation);
			model.addObject("listProduct", listProduct);
			model.setViewName("registerdhome");
			return model; 
		  //else {
			 // System.out.println("updateKiosk method is running");
			  //service.updateKiosk(kiosk);  
		//}
 	}        
	}	

