package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.constants.PaytmConstants;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.QrCode;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.OrderService;
import com.veggiefridge.online.service.QRCodeService;

@Controller
@RequestMapping(value ="/order")
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

	// get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}

	//getAll Order
	@RequestMapping(value = "/listdeliveredorder")
	public ModelAndView listOrder(ModelAndView model) throws IOException {
		List<Orders> listdeliveredorders = orderservice.listdeliveredOrders();
		model.addObject("listdeliveredorders", listdeliveredorders);
		model.setViewName("myorder");
		return model;
	}

	 //checkoutAndSaveOrder
	@RequestMapping(value = "/checkoutAndSaveOrder")
	public ModelAndView checkoutAndSaveOrder(ModelAndView model) {
		List<CartItem> cartitem = cartservice.list(this.getCartPage().getCartpageid());

		Orders orders = new Orders();
		orders.setCustomer(this.getCartPage().getCustomer());
		orders.setPickupStatus(VFOnlineConstants.PICKUP_STATUS);
		System.out.println("pickup status" + VFOnlineConstants.PICKUP_STATUS);
		orders.setOrderDate(new Date());
		orderservice.saveOrder(orders);
		System.out.println("Order added in order tabel");

		for (int i = 0; i < cartitem.size(); i++) {
			OrderItem orderitem = new OrderItem();
			orderitem.setOrderid(orders.getOrderid());
			orderitem.setProduct(cartitem.get(i).getProduct());
			orderitem.setProductQuantity(cartitem.get(i).getProductCount());
			orderitem.setSource("web");
			orderitem.setTotalAmount(cartitem.get(i).getTotal());
			orderservice.saveOrderItem(orderitem);
			System.out.println("List of cartitem added in orderitem table");

			System.out.println("cartpage updated");
		}

		for (int i = 0; i < cartitem.size(); i++) {
			CartItem cartitems = cartservice.get(cartitem.get(i).getCartitemid());
			cartservice.remove(cartitems);
			System.out.println("remove item from cart");
			CartPage cartpage = this.getCartPage();
			cartpage.setGrandTotal(cartpage.getGrandTotal() - cartitem.get(i).getTotal());
			cartpage.setCartitem(cartpage.getCartitem() - 1);
			cartservice.updateCartPage(cartpage);
			System.out.println("remove item from cart");
		}
		QrCode qrcode = new QrCode();
		qrcode.setCustomerid(this.getCartPage().getCustomer().getCustomerid());
		qrcode.setDate(new Date());
		qrcode.setIsValid(VFOnlineConstants.qrCodeIsValid);
		qrcode.setMembershipId(0);
		qrcode.setOrderId(orders.getOrderid());
		qrcode.setSource("WEB");
		qrcode.setType(VFOnlineConstants.PICKUP_STATUS);
		qrcodeservice.saveOrder(qrcode);
		System.out.println("QR Code Generated For Order");
		model.setViewName("pickupaddress");
		return model;
	}

	// delivered order item
	@RequestMapping(value = "/listOrderItem/{orderid}", method = RequestMethod.GET)
	public ModelAndView listOrderItem(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		Orders orders = orderservice.getOrder(orderid);
		List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
		System.out.println("listOrderItem by OrderId" + listorderitem);
		order = new Orders();
		model.addObject("order", order);
		model.addObject("listorderitem", listorderitem);
		model.setViewName("repeatOrder");
		return model;
	}
    
	// pending Order item
	@RequestMapping(value = "/listOrderItems/{orderid}", method = RequestMethod.GET)
	public ModelAndView listOrderItems(ModelAndView model, @PathVariable(value = "orderid") int orderid) {
		Orders orders = orderservice.getOrder(orderid);
		List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
		System.out.println("listOrderItem by OrderId" + listorderitem);
		model.addObject("listorderitem", listorderitem);
		model.setViewName("orderinfo");
		return model;
	}

	// get All Information
	@RequestMapping(value = "/allOrderItem")
	public ModelAndView allOrderItem(ModelAndView model) {
		List<OrderItem> listAllOrderitem = orderservice.getAllOrderItem();
		model.addObject("listAllOrderitem", listAllOrderitem);
		model.setViewName("repeatOrder");
		return model;
	}

	 //repeat Order
	@RequestMapping(value = "/repeatOrder{orderid}", method = RequestMethod.GET)
	public String repeatOrder(ModelAndView model, @PathVariable(value = "orderid") int orderid) {
		Orders orders = orderservice.getOrder(orderid);
		List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
		CartPage cartpage = this.getCartPage();
		CartItem cartitem = cartservice.getCustomerCart(this.getCartPage().getCartpageid());
		/* CartItem cartitem= cartservice.getCustomerCart(cartpage.getCartpageid()); */
		for (int i = 0; i < listorderitem.size(); i++) {
			cartitem = new CartItem();
			cartitem.setCartpageid(this.getCartPage().getCartpageid());
			cartitem.setProduct(listorderitem.get(i).getProduct());
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

	// listCartItem
	@RequestMapping(value = "/pendingorders")
	public ModelAndView fetchAllPendingOrders(ModelAndView model) {
		List<Orders> fetchallpendingorders = orderservice.listpendingOrders();
		System.out.println("fetch AllPending orderItemdetails");
		model.addObject("fetchallpendingorders", fetchallpendingorders);
		model.setViewName("CurrentOrder");
		return model;
	}

	//listCartItem
	@RequestMapping(value = "/deliveredorder")
	public ModelAndView fetchDelOrderByStatus(ModelAndView model) {

		List<Orders> fetchalldeliveredorders = orderservice.listdeliveredOrders();
		System.out.println("fetch All orderItemdetails");
		model.addObject("fetchalldeliveredorders", fetchalldeliveredorders);
		model.setViewName("myorder");
		return model;
	}
	
	@RequestMapping(value = "/showPickupStatus", method = RequestMethod.GET)
	public String getAllStatus(HttpServletRequest req, Model model) {
		String pickupStatus = "";
		String picstatus = req.getParameter("pickupStatus");
		if (picstatus != null && !picstatus.equals("")) {
			pickupStatus = picstatus;
			List<Orders> picsts = orderservice.getOrdersByStatus(pickupStatus, this.getCartPage().getCustomer().getCustomerid());
			model.addAttribute("picsts", picsts);
			return "CurrentOrder";
		}
		return "CurrentOrder";

	}
	
	
	//PickupAddress
	@RequestMapping(value ="/PickupAddress")
	public ModelAndView PickupAddress(ModelAndView model) {
		model.setViewName("pickupaddress");
		return model;
	}
	
	 //Edit profile
	@RequestMapping(value = "/editProfile")
	public ModelAndView editProfile(ModelAndView model) {
		model.setViewName("editprofile");
		return model;
	}
	
	    //myCart
		@RequestMapping(value = "/paymentoption")
		public ModelAndView myCart(ModelAndView model) {
			model.setViewName("payment");
			return model;
		}


	
	
	
}
