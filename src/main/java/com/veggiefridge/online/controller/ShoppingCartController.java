package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.TempOrderDetails;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;
import com.veggiefridge.online.service.ShoppingCartService;

@Controller
@RequestMapping(value="/cart")
public class ShoppingCartController {
   
	@Autowired
	private ProductService productservice;
	
	@Autowired
	private CustomerService customerService;
		
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private ShoppingCartService shoppingcartservice;
	
	
	
	 @SuppressWarnings("unchecked")
	 @RequestMapping(value ="/ordernow/{productid}", method = RequestMethod.GET)
	 public String ordernow(@PathVariable(value = "productid") int productid, ModelMap mm, HttpSession session) {

	   if (session.getAttribute("cart") == null) {
	   List<Item> cart = new ArrayList<Item>();
	   cart.add(new Item(this.productservice.getProduct(productid), 1));
	   session.setAttribute("cart", cart);
	  } 
	   else {
	   List<Item> cart = (List<Item>) session.getAttribute("cart");

	   // using method isExisting here
	   int index = isExisting(productid, session);
	   if (index == -1)
	    cart.add(new Item(this.productservice.getProduct(productid), 1));
	   else {
	    int quantity = cart.get(index).getQuantity() + 1;
	    cart.get(index).setQuantity(quantity);
	   }

	   session.setAttribute("cart", cart);
	  }

	  return "cart"; // page name
	 }

	 
	 @SuppressWarnings("unchecked")
	 @RequestMapping(value ="/delete/{productid}", method = RequestMethod.GET)
	 public String delete(@PathVariable(value ="productid") int productid, HttpSession session) {
	  List<Item> cart = (List<Item>) session.getAttribute("cart");
	  int index = isExisting(productid, session);
	  cart.remove(index);
	  session.setAttribute("cart", cart);
	  return "cart";
	 }

	 
	 @SuppressWarnings("unchecked")
	 private int isExisting(int productid, HttpSession session) {

	  List<Item> cart = (List<Item>) session.getAttribute("cart");

	  for (int i = 0; i < cart.size(); i++)

	   if (cart.get(i).getProduct().getProductid() == productid)
	    return i;

	  return -1;
	 }
	 
	

			 @RequestMapping(value = "/registerdhome", method = RequestMethod.GET)
				public ModelAndView registerdhome(HttpServletRequest request, HttpServletResponse response,
						  @ModelAttribute("kiosklocation") KioskLocation kiosklocation,ModelAndView model) {
				 List<KioskLocation> listkiosklocation =kiosklocationservice.getAllLocation();
					List<Product> listProduct = productservice.getAllProducts();
					List<Customer> listCustomer = customerService.getAllCustomers();
					model.addObject("listCustomer", listCustomer);
					model.addObject("listkiosklocation",listkiosklocation);
					model.addObject("listProduct", listProduct);
					model.setViewName("registerdhome");
					return model; 
				}
			 
			   //checkout 
				@RequestMapping(value ="/paymnet")
				public ModelAndView myOrder(ModelAndView model) {
					model.setViewName("checkout");
					return model;
				}
				 
				//saveOrder
				@RequestMapping(value = "/saveOrder")
				public ModelAndView saveOrder(ModelAndView model) {
					model.setViewName("thanks");
					return model;
				}
				
				
				@RequestMapping(value="/add/{productid}",method = RequestMethod.GET)
				public String addCartLine(@PathVariable(value ="productid")int productid){
				TempOrderDetails tod= shoppingcartservice.getByProduct(productid);
				if(tod==null) {
				// add a new cartLine if a new product is getting added	
				tod= new TempOrderDetails();
				Product product= productservice.getProduct(productid);
				// transfer the product details to TempOrderDetails 
				tod.setProductName(product.getProductName());
				tod.setSize(product.getSize());
				tod.setFinalPrice(product.getFinalPrice());
				tod.setCategory(product.getCategory());
				tod.setDescription(product.getDescription());
				tod.setQuantity(product.getQuantity());
				//insert a new TempOrderDetails
				shoppingcartservice.addTempOrderDetails(tod);
				}
				return "redirect:/cart/TempOrderDetails";
				
				}	
				
				
}
