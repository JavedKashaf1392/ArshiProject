package com.veggiefridge.online.controller;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.CartLine;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
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
    @RequestMapping(value = "/buy/{productid}", method = RequestMethod.GET)
	public String buy(@PathVariable("productid") int productid, HttpSession session,ModelAndView model,@ModelAttribute("item")Item item){
		Product product = new Product(); 
		if(session.getAttribute("cart") == null) {
	    List<Item> cart = new ArrayList<Item>();
	    cart.add(new Item(productservice.getProduct(productid), 1));
	    session.setAttribute("cart", cart);
		}else {
	    List<Item> cart = (List<Item>) session.getAttribute("cart");
	     //using method isExisting here
			   int index = isExisting(productid, session);
			   if (index == -1)
			   cart.add(new Item(this.productservice.getProduct(productid), 1));
			   else {
			    int quantity = cart.get(index).getQuantity() + 1;
			    cart.get(index).setQuantity(quantity);
			   }
			   session.setAttribute("cart", cart); 
			  }
  
        return "cart";  // page name
			 }

			 @SuppressWarnings("unchecked")
			 @RequestMapping(value = "/delete/{productid}", method = RequestMethod.GET)
			 public String delete(@PathVariable(value = "productid") int id, HttpSession session) {
			 List<Item> cart = (List<Item>) session.getAttribute("cart");
			 int index = isExisting(id, session);
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
				
	
	//show cart
    @RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(value ="result", required = false) String result,ModelAndView mv) {
    	mv.addObject("title", "Shopping Cart");
		
    	if(result!=null) {
			
			switch(result) {
				case "added":
					mv.addObject("message", "Product has been successfully added inside cart!");					
					break;
				case "unavailable":
					mv.addObject("message", "Product quantity is not available!");					
					break;
				case "updated":
					mv.addObject("message", "Cart has been updated successfully!");					
					break;
				case "modified":
					mv.addObject("message", "One or more items inside cart has been modified!");
					break;
				case "maximum":
					mv.addObject("message", "Maximum limit for the item has been reached!");
					break;
				case "deleted":
					mv.addObject("message", "CartLine has been successfully removed!");
					break;

			}
		}
		List<CartLine> cartlines = shoppingcartservice.getCartLine();
		mv.addObject("cartlines",cartlines);
		mv.setViewName("cartview");
		return mv;
	}
    
    
    //add product into cart
    @RequestMapping("/add/{productid}/product")
	public String addCartLine(@PathVariable int productid) {
		String response = shoppingcartservice.addCartLine(productid);
		return "redirect:/cart/show?"+response;
	}
    
	
				
				
				
				
}
