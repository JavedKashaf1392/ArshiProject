package com.veggiefridge.online.controller;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;
import com.veggiefridge.online.model.QRCode;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.OrderService;
import com.veggiefridge.online.service.QRCodeService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	private static final Logger logger = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private OrderService orderservice; 
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private QRCodeService qrcodeservice;

	     
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
		List<CartItem> cartitem = cartservice.list(this.getCartPage().getCartpageid());
		
		OrderItemDetails orderItemdetails = new OrderItemDetails();
		orderItemdetails.setCustomer(this.getCartPage().getCustomer());
		orderItemdetails.setDeliveredProductsCount(0);
		orderItemdetails.setPickupStatus(VFOnlineConstants.PICKUP_STATUS); 
		System.out.println("pickup status"+VFOnlineConstants.PICKUP_STATUS);
		orderItemdetails.setOrderDate(new Date());
		orderservice.saveOrder(orderItemdetails); 
		System.out.println("Order added in order tabel");
		
		for(int i=0; i<cartitem.size(); i++) {
			OrderItem orderitem= new OrderItem();
			orderitem.setOrderItemDetailsId(orderItemdetails.getOrderItemDetailsId());
			orderitem.setProduct(cartitem.get(i).getProduct());
			orderitem.setProductQuantity(cartitem.get(i).getProductCount());
			orderitem.setSource("web");
			orderitem.setTotalAmount(cartitem.get(i).getTotal());
			orderservice.saveOrderItem(orderitem);
			System.out.println("List of cartitem added in orderitem table");	
		    
			System.out.println("cartpage updated");
		}
		
		for(int i=0;i<cartitem.size();i++) {
		CartItem cartitems=cartservice.get(cartitem.get(i).getCartitemid());
		cartservice.remove(cartitems);
		System.out.println("remove item from cart");
		
		CartPage cartpage = this.getCartPage();	
		cartpage.setGrandTotal(cartpage.getGrandTotal() - cartitem.get(i).getTotal());
		cartpage.setCartitem(cartpage.getCartitem() - 1);		
		cartservice.updateCartPage(cartpage);
		System.out.println("remove item from cart");
		}
         
		QRCode qrcode= new QRCode();
		qrcode.setCustomer(this.getCartPage().getCustomer());
        qrcode.setOrderitemdetails(orderItemdetails);
        qrcode.setValid(true);
        qrcodeservice.saveOrder(qrcode);
        System.out.println("order added into qrcode");
		
        model.setViewName("thanks");
		return model;
		}
		
		   //listOrders
		@RequestMapping(value ="/listOrders")
		public ModelAndView listOrders(ModelAndView model){
			List<OrderItemDetails> listorderitemdetails=orderservice.list(this.getCartPage().getCustomer().getCustomerid());
			model.setViewName("myorder");
			return model;
		}
		
		   //listOrderidOrde
		@RequestMapping(value ="/listOrderItem/{orderItemDetailsId}")
		public ModelAndView listOrderItem(ModelAndView model,@PathVariable("orderItemDetailsId") int orderItemDetailsId){
			OrderItemDetails orderItemDetails=orderservice.get(orderItemDetailsId);
			List<OrderItem> listorderitem=orderservice.listOrderItem(orderItemDetails.getOrderItemDetailsId());
			model.addObject("listorderitem", listorderitem);
			model.setViewName("orderlist");
			return model;
		    }
		
		
		
		  //get All Information
		@RequestMapping(value ="/allOrderItem")
		public ModelAndView allOrderItem(ModelAndView model){
			List<OrderItem> listAllOrderitem = orderservice.getAllOrderItem();
			model.addObject("listAllOrderitem", listAllOrderitem);
			model.setViewName("repeatOrder");
			return model;
		}
		
		         //repeat Order
		        @RequestMapping(value ="/repeatOrder")
				public String repeatOrder(ModelAndView model){
		        
		        List<OrderItem> listAllOrderitem = orderservice.getAllOrderItem();
		        CartPage cartpage=this.getCartPage(); 	
		        CartItem cartitem= cartservice.getCustomerCart(this.getCartPage().getCartpageid());
				/* CartItem cartitem= cartservice.getCustomerCart(cartpage.getCartpageid()); */
			    for(int i=0; i<listAllOrderitem.size(); i++){
			    cartitem=new CartItem();
			    cartitem.setCartpageid(this.getCartPage().getCartpageid());
			    cartitem.setProduct(listAllOrderitem.get(i).getProduct());
			    cartservice.add(cartitem);                                                
			    System.out.println("cartitem is added");                                  
			    // update the cart                                                        
			    cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getTotal());   
			    cartpage.setCartitem(cartpage.getCartitem() + 1);                         
			    cartservice.updateCartPage(cartpage);                                     
			    System.out.println("cartpage updated");                                   
			    }
			    
				return "redirect:/cart/listCustomerCartItem";
		        }
		        
		        
		         //listCartItem
				@RequestMapping(value ="/fetchallorderbystatus")
				public ModelAndView fetchAllOrderByStatus(ModelAndView model){
					
					List<OrderItemDetails> fetchallorderbystatus=orderservice.listOrderItemDetails();
					System.out.println("fetch All orderItemdetails");
					model.addObject("fetchallorderbystatus", fetchallorderbystatus);
					model.setViewName("CurrentOrder");
					return model;
				}
				
		
				
				 //listCartItem
				@RequestMapping(value ="/fetchdelorderbystatus")
				public ModelAndView fetchDelOrderByStatus(ModelAndView model){
					
					List<OrderItemDetails> fetchdelorderbystatus=orderservice.listdelOrderItemDetails();
					System.out.println("fetch All orderItemdetails");
					model.addObject("fetchdelorderbystatus",fetchdelorderbystatus);
					model.setViewName("myorder");
					return model;
				}
				
		
				
		
		
		
		
		
		
		
}
