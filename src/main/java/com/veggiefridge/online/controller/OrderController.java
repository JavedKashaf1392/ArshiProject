package com.veggiefridge.online.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController{
	
	private static final Logger logger = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderService orderservice; 
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private HttpSession session;
	     
    //get cartPage
	private	CartPage getCartPage(){
			return ((Customer)session.getAttribute("customer")).getCartpage();
		}

	    //getAll Order
		@RequestMapping(value ="/listorder")
		public ModelAndView listOrder(ModelAndView model) throws IOException {
			List<OrderItemDetails> listorderitemdetails=orderservice.getAllOrderItemDetails();
			model.addObject("listorderitemdetails", listorderitemdetails);
			model.setViewName("myorder");
			return model;
		}
		
		
		//checkoutAndSaveOrder
		@RequestMapping(value ="/checkoutAndSaveOrder")
		public ModelAndView checkoutAndSaveOrder(ModelAndView model){
		List<CartItem> item = cartservice.list(this.getCartPage().getCartpageid());
		
		OrderItemDetails orderItemdetails = new OrderItemDetails();
		orderItemdetails.setCustomer(this.getCartPage().getCustomer());
		orderItemdetails.setDeliveredProductsCount(0);
		orderItemdetails.setPickupStatus("Pending");
		orderservice.saveOrder(orderItemdetails); 
		System.out.println("Order added in ortaer tabel");
		
		for(int i=0; i<item.size(); i++) {
			OrderItem orderitem= new OrderItem();
			orderitem.setOrderItemDetailsId(orderItemdetails.getOrderItemDetailsId());
			orderitem.setProduct(item.get(i).getProduct());
			orderitem.setProductQuantity(item.get(i).getProductCount());
			orderitem.setSource("web");
			orderitem.setTotalAmount(item.get(i).getTotal());
			orderservice.saveOrderItem(orderitem);
			System.out.println("data added in orderitem table");
		}
		model.setViewName("joinmemebership");
		return model;
		
		
		
		}
		
		
		
		
		
}
