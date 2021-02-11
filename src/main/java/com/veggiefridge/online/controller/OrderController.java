
package com.veggiefridge.online.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.paytm.pg.merchant.PaytmChecksum;
import com.veggiefridge.online.constants.PaytmConstants;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Payment;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.QrCode;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.OrderService;
import com.veggiefridge.online.service.PaymentService;
import com.veggiefridge.online.service.ProductService;
import com.veggiefridge.online.service.QRCodeService;
import com.veggiefridge.online.service.WalletService;

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
	
	@Autowired
	private PaymentService paymentservice;

	@Autowired
	private Environment env;
	
   @Autowired
	private WalletService walletservice;
   
   @Autowired
   private ProductService productservice;

	//get cartPage
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

	//checkoutAndSaveOrder PayAtKiosk
	@RequestMapping(value = "/checkoutAndSaveOrderPayATKiosk")
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
			cartpage.setGrandTotal(cartitem.get(i).getTotal());
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
		
		Payment payment=new Payment();
		payment.setCustomer(this.getCartPage().getCustomer());
		payment.setOrder(orders);
		payment.setOrderDate(orders.getOrderDate());
		payment.setPaymentStatus("pending");
		payment.setModeOfPayment("Pay At Kisok");
		payment.setTotalBillAmount(orders.getTotalBillAmount());
	    paymentservice.savePayment(payment);
		model.setViewName("thankyou");
		return model;
	}
	
	 //delivered order item
	@RequestMapping(value = "/listOrderItem/{orderid}", method = RequestMethod.GET)
	public ModelAndView listOrderItem(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		Orders orders = orderservice.getOrder(orderid);
		List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
		System.out.println("listOrderItem by OrderId" + listorderitem);
		order = new Orders();
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
		model.addObject("listMenu", listMenu);
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
		String section = "Navbar";
		List<Menu> listMenu = productservice.getMenuByNavbar(section);
		model.addObject("listMenu", listMenu);
		model.addObject("listorderitem", listorderitem);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
		model.addObject(listprofileMenu);
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
	public String repeatOrder(ModelAndView model,@PathVariable(value ="orderid") int orderid) {
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
			String profilemenuSection = "Profile";
			List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
			model.addObject(listprofileMenu);
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
		
	 //PickupAddress
	@RequestMapping(value ="/PickupAddress")
	public ModelAndView PickupAddress(ModelAndView model) {
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
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
		@RequestMapping(value = "/paymentMethod")
		public ModelAndView myCart(ModelAndView model) {
			List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
			model.addObject("listcustomercartitem", listcustomercartitem);
			model.setViewName("PaymentMethod");
			return model;
		}
		
		        //myCart
				@RequestMapping(value = "/confirmorder")
				public ModelAndView confirmOrder(ModelAndView model) {
					model.setViewName("thankyou");
					return model;
				}

				 //checkoutAndSaveOrder Pay Online
				@RequestMapping(value = "/checkoutAndSaveOrderPayOnline")
				public ModelAndView checkoutAndSaveOrderPayOnline(ModelAndView model) throws Exception {
				
					List<CartItem> cartitem = cartservice.list(this.getCartPage().getCartpageid());
					Orders orders = new Orders();
					orders.setCustomer(this.getCartPage().getCustomer());
					orders.setPickupStatus(VFOnlineConstants.PICKUP_STATUS);
					System.out.println("pickup status" + VFOnlineConstants.PICKUP_STATUS);
					orders.setOrderDate(new Date());
					orders.setTotalBillAmount(this.getCartPage().getGrandTotal());
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
					
					Payment payment=new Payment();
					payment.setCustomer(this.getCartPage().getCustomer());
					payment.setOrder(orders);
					payment.setOrderDate(orders.getOrderDate());
					payment.setPaymentStatus("pending");
					payment.setModeOfPayment("PayOnilne");
					payment.setPlatformSource("WEB");
					 payment.setTotalBillAmount(orders.getTotalBillAmount());
					 paymentservice.savePayment(payment);
					
					/* payment */
					/* paytmDetailPojo.getPaytmUrl()*/
			        ModelAndView modelAndView = new ModelAndView("redirect:" +"https://securegw-stage.paytm.in/order/process");
			        TreeMap<String, String> parameters = new TreeMap<>();
			        PaytmConstants.details.forEach((k, v) -> parameters.put(k, v));
			        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
			        parameters.put("EMAIL", env.getProperty("paytm.email"));
			        parameters.put("ORDER_ID","4172");
			        parameters.put("TXN_AMOUNT", "83");
			        parameters.put("CUST_ID", "9316");
			        parameters.put("INDUSTRY_TYPE_ID","Retail");
			        parameters.put("CHANNEL_ID", "WEB");
			        System.out.println(parameters);
			        String checkSum = getCheckSum(parameters);
			        parameters.put("CHECKSUMHASH", checkSum);
			        modelAndView.addAllObjects(parameters);
			        return modelAndView;
				}
				
	             //checkoutAndSaveOrder PayByWallet
				@RequestMapping(value = "/checkoutAndSaveOrderPayByWallet")
				public ModelAndView checkoutAndSaveOrderPayByWallet(ModelAndView model,@ModelAttribute("wallet") Wallet walletpayment, BindingResult resultorder) {
					List<CartItem> cartitem = cartservice.list(this.getCartPage().getCartpageid());
					Orders orders = new Orders();
					orders.setCustomer(this.getCartPage().getCustomer());
					orders.setPickupStatus(VFOnlineConstants.PICKUP_STATUS);
					System.out.println("pickup status" + VFOnlineConstants.PICKUP_STATUS);
					orders.setOrderDate(new Date());
					orders.setTotalBillAmount(this.getCartPage().getGrandTotal());
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
					
					Payment payment=new Payment();
					payment.setCustomer(this.getCartPage().getCustomer());
					payment.setOrder(orders);
					payment.setOrderDate(orders.getOrderDate());
					payment.setPaymentMethod("wallet");
					payment.setPaymentStatus("pending");
					payment.setModeOfPayment("Pay By Wallet");
					payment.setPlatformSource("WEB");
					payment.setTotalBillAmount(orders.getTotalBillAmount());
				    paymentservice.savePayment(payment);
					
					//update Wallet
			        Wallet wallet=walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
					wallet.setTotalAmountBalance(walletpayment.getTotalAmountBalance()-orders.getTotalBillAmount());
					walletservice.updateWallet(wallet);
					model.setViewName("thankyou");
					return model;
				}
				
				
				 //checkoutAndSaveOrder PayOnline
				@RequestMapping(value = "/checkoutAndSaveOrderUPI")
				public ModelAndView checkoutAndSaveOrderUPI(ModelAndView model) {
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
					
					Payment payment=new Payment();
					payment.setCustomer(this.getCartPage().getCustomer());
					payment.setOrder(orders);
					payment.setOrderDate(orders.getOrderDate());
					payment.setPaymentMethod("UPI");
					payment.setPaymentStatus("pending");
					payment.setModeOfPayment("Pay By Wallet");
					payment.setPlatformSource("WEB");
					payment.setTotalBillAmount(orders.getTotalBillAmount());
				    paymentservice.savePayment(payment);
					model.setViewName("thankyou");
					return model;
				}
			
			    private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
			        return PaytmChecksum.verifySignature(parameters,
			                PaytmConstants.merchantKey, paytmChecksum);
			    }


			private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
				return PaytmChecksum.generateSignature(parameters, PaytmConstants.merchantKey);
			}	
			
			
			@RequestMapping(value = "/showPendingOrder{customerid}", method = RequestMethod.GET)
			public String showPendingOrders(HttpServletRequest req, Model model) {
					List<Orders> pendingOrders = orderservice.getPendingOrders(this.getCartPage().getCustomer().getCustomerid());
					model.addAttribute("pendingOrders", pendingOrders);
					  String section = "Navbar"; List<Menu> listMenu =
					  productservice.getMenuByNavbar(section); model.addAttribute("listMenu",
					  listMenu);
					  String profilemenuSection = "Profile";
						List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
						model.addAttribute("listprofileMenu", listprofileMenu);
					 
					return "pendingorder";
				}
				
			@RequestMapping(value = "/showDeliveredOrder{customerid}", method = RequestMethod.GET)
			public String showDeliveredOrder(HttpServletRequest req, Model model) {
					List<Orders> deliveredOrders = orderservice.getDeliveredOrders(this.getCartPage().getCustomer().getCustomerid());
					model.addAttribute("deliveredOrders",deliveredOrders);
					String section = "Navbar";
					List<Menu> listMenu = productservice.getMenuByNavbar(section);
					model.addAttribute("listMenu", listMenu);
					String profilemenuSection = "Profile";
					List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
					model.addAttribute("listprofileMenu", listprofileMenu);
					return "myorder";
				}
			
			
				/*
				 * //repeat Order
				 * 
				 * @RequestMapping(value = "/canOrder{orderid}", method = RequestMethod.GET)
				 * public String canlOrder(ModelAndView model,@PathVariable(value ="orderid")
				 * int orderid) { System.out.println("Get Order Id"+orderid); return
				 * "redirect:/order/showPendingOrders{customerid}"; }
				 */
			 //delivered order item
			@RequestMapping(value = "/confirmcancelOrder", method = RequestMethod.GET)
			public ModelAndView confirmcancelOrder(ModelAndView model) {
				
				model.setViewName("cancel");
				return model;
			}
		
			@RequestMapping(value = "/showCancelOrder{customerid}", method = RequestMethod.GET)
			public String showCancelOrders(HttpServletRequest req, Model model) {
					List<Orders> CancelOrders = orderservice.getCancelledOrders(this.getCartPage().getCustomer().getCustomerid());
					model.addAttribute("CancelOrders",CancelOrders);
					return "cancelOrder";
				}
			
		
			//Pending Orders
			@RequestMapping(value = "/showPendingOrders{customerid}", method = RequestMethod.GET)
			public String showPendingOrder(HttpServletRequest req, Model model,HttpServletRequest request) {
					List<Orders> pendingOrders = orderservice.getPendingOrders(this.getCartPage().getCustomer().getCustomerid());
					Map orderitems = new HashMap();
					for(Iterator it = pendingOrders.iterator(); it.hasNext(); ){
						Orders orders = (Orders)it.next();
						List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
						orderitems.put(orders.getOrderid(), listorderitem);
						}
					  String section = "Navbar"; List<Menu> listMenu =
					  productservice.getMenuByNavbar(section); model.addAttribute("listMenu",
					  listMenu);
					  String profilemenuSection = "Profile";
						List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
						/* model.addAttribute("pendingOrders", pendingOrders); */
						model.addAttribute("listprofileMenu", listprofileMenu);
						/* model.addAttribute("orderitems", orderitems); */
						request.setAttribute("pendingOrders", pendingOrders);
						request.setAttribute("orderitems", orderitems);
						return "pendingorder";
					   
				}
			
			
            //Delivered Orders
			@RequestMapping(value = "/showDeliveredOrders{customerid}", method = RequestMethod.GET)
			public String showDeliveredOrders(HttpServletRequest req, Model model,HttpServletRequest request) {
				List<Orders> deliveredOrders = orderservice.getDeliveredOrders(this.getCartPage().getCustomer().getCustomerid());
					Map orderitems = new HashMap();
					for(Iterator it = deliveredOrders.iterator(); it.hasNext();){
						Orders orders = (Orders)it.next();
						List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
						orderitems.put(orders.getOrderid(), listorderitem);
						}
					  String section = "Navbar"; List<Menu> listMenu =
					  productservice.getMenuByNavbar(section); model.addAttribute("listMenu",
					  listMenu);
					  String profilemenuSection = "Profile";
						List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
						/* model.addAttribute("pendingOrders", pendingOrders); */
						model.addAttribute("listprofileMenu", listprofileMenu);
						/* model.addAttribute("orderitems", orderitems); */
						request.setAttribute("deliveredOrders",deliveredOrders);
						request.setAttribute("orderitems", orderitems);
						return "deliveredorder";
					   
				}
			
			
			 //CancelOrder
			@RequestMapping(value = "/showCancelOrders{customerid}", method = RequestMethod.GET)
			public String showCancelOrders(HttpServletRequest req, Model model,HttpServletRequest request) {
				List<Orders> CancelOrders = orderservice.getCancelledOrders(this.getCartPage().getCustomer().getCustomerid());
					Map orderitems = new HashMap();
					for(Iterator it = CancelOrders.iterator(); it.hasNext();){
						Orders orders = (Orders)it.next();
						List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
						orderitems.put(orders.getOrderid(), listorderitem);
						}
					  String section = "Navbar"; List<Menu> listMenu =
					  productservice.getMenuByNavbar(section); model.addAttribute("listMenu",
					  listMenu);
					  String profilemenuSection = "Profile";
						List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
						/* model.addAttribute("pendingOrders", pendingOrders); */
						model.addAttribute("listprofileMenu", listprofileMenu);
						/* model.addAttribute("orderitems", orderitems); */
						request.setAttribute("CancelOrders",CancelOrders);
						request.setAttribute("orderitems", orderitems);
						return "cancelorder";
					   
				}
		
			 //Pending Orders
			@RequestMapping(value = "/showDeliveredOrdersByDate{customerid}", method = RequestMethod.GET)
			public String showDeliveredOrdersByDateByDate(HttpServletRequest req, Model model,HttpServletRequest request,@RequestParam(value = "fromDate")@DateTimeFormat(pattern="MM/dd/yyyy") Date strDate,@RequestParam(value = "fromDate")@DateTimeFormat(pattern="MM/dd/yyyy") Date endDate) throws ParseException {
				
				
				System.out.println( "From Date" + strDate + "TO Date" + endDate);
				List<Orders> deliveredOrders = orderservice.getOrdersBetweenDates(this.getCartPage().getCustomer().getCustomerid(), strDate,endDate);
					Map orderitems = new HashMap();
					for(Iterator it = deliveredOrders.iterator(); it.hasNext(); ){
						Orders orders = (Orders)it.next();
						List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
						orderitems.put(orders.getOrderid(), listorderitem);
						}
					  String section = "Navbar"; List<Menu> listMenu =
					  productservice.getMenuByNavbar(section); model.addAttribute("listMenu",
					  listMenu);
					  String profilemenuSection = "Profile";
						List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
						/* model.addAttribute("pendingOrders", pendingOrders); */
						model.addAttribute("listprofileMenu", listprofileMenu);
						/* model.addAttribute("orderitems", orderitems); */
						request.setAttribute("deliveredOrders", deliveredOrders);
						request.setAttribute("orderitems", orderitems);
						return "deliveredorder";
				}
			
			
			 //cancel Order
			@RequestMapping(value = "/cancelOrder/{orderid}", method = RequestMethod.GET)
			public ModelAndView cancelOrder(ModelAndView model,@PathVariable(value = "orderid") int orderid,
					@ModelAttribute("orders") Orders order, BindingResult resultorder) {
				order = orderservice.getOrder(orderid);
				order.setPickupStatus("Cancelled");
				order.setUpdatedDate(new Date());
				orderservice.updateOrders(order);
				List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
				model.addObject("listorderitem",listorderitem);
				model.addObject("order",order);
				 String section = "Navbar"; List<Menu> listMenu =
						  productservice.getMenuByNavbar(section); model.addObject("listMenu",
						  listMenu);
						  String profilemenuSection = "Profile";
							List<Menu> listprofileMenu = productservice.getMenuByNavbar(profilemenuSection);
							/* model.addAttribute("pendingOrders", pendingOrders); */
							model.addObject("listprofileMenu", listprofileMenu);
							model.addObject("message", env.getProperty("order.cancelorder"));			
				model.setViewName("cancel");
				return model;
			}
			
			
			
			
          
}
                 