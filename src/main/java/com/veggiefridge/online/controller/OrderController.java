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
import javax.validation.Valid;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
import com.veggiefridge.online.model.WalletPayment;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.MenuService;
import com.veggiefridge.online.service.OrderService;
import com.veggiefridge.online.service.PaymentService;
import com.veggiefridge.online.service.ProductService;
import com.veggiefridge.online.service.QRCodeService;
import com.veggiefridge.online.service.WalletService;

@Controller
@RequestMapping(value = "/order")
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
	
	@Autowired
	private MenuService menuservice;
	

	//get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
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

		Payment payment = new Payment();
		payment.setCustomer(this.getCartPage().getCustomer());
		payment.setOrder(orders);
		payment.setOrderDate(orders.getOrderDate());
		payment.setPaymentStatus("pending");
		payment.setModeOfPayment("Pay At Kisok");
		payment.setTotalBillAmount(orders.getTotalBillAmount());
		paymentservice.savePayment(payment);
		model.setViewName("thanksfororder");
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
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
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("order", order);
		model.addObject("listorderitem", listorderitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("repeatOrder");
		return model;
	}

	 //pending Order item
	@RequestMapping(value = "/listOrderItems/{orderid}", method = RequestMethod.GET)
	public ModelAndView listOrderItems(ModelAndView model, @PathVariable(value = "orderid") int orderid) {
		Orders orders = orderservice.getOrder(orderid);
		List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
		System.out.println("listOrderItem by OrderId" + listorderitem);
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listorderitem", listorderitem);
		
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("orderinfo");
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
			cartitem.setProductCount(listorderitem.get(i).getProductQuantity());
			cartitem.setBuyingPrice(listorderitem.get(i).getProduct().getPrice()-listorderitem.get(i).getProduct().getDiscount()*listorderitem.get(i).getProduct().getPrice()/100);
			cartitem.setProduct(listorderitem.get(i).getProduct());
			cartitem.setTotal(listorderitem.get(i).getTotalAmount());
			cartservice.add(cartitem);
			System.out.println("cartitem is added");
			// update the cart
			cartpage.setGrandTotal(cartpage.getGrandTotal() + cartitem.getTotal());
			cartpage.setCartitem(cartpage.getCartitem() + 1);
			cartservice.updateCartPage(cartpage);
			model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
			model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
			System.out.println("cartpage updated");
		}
		return "redirect:/cart/listCustomerCartItem";
	}

	 //PickupAddress
	@RequestMapping(value = "/PickupAddress")
	public ModelAndView PickupAddress(ModelAndView model) {
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("pickupaddress");
		return model;
	}

	 //Edit profile
	@RequestMapping(value = "/editProfile")
	public ModelAndView editProfile(ModelAndView model) {
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("editprofile");
		return model;
	}

	 //myCart
	@RequestMapping(value = "/paymentMethod")
	public ModelAndView myCart(ModelAndView model) {
		List<CartItem> listcustomercartitem = cartservice.list(this.getCartPage().getCartpageid());
		model.addObject("listcustomercartitem", listcustomercartitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("PaymentMethod");
		return model;
	}

	//myCart
	@RequestMapping(value = "/confirmorder")
	public ModelAndView confirmOrder(ModelAndView model) {
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
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

		Payment payment = new Payment();
		payment.setCustomer(this.getCartPage().getCustomer());
		payment.setOrder(orders);
		payment.setOrderDate(orders.getOrderDate());
		payment.setPaymentStatus("pending");
		payment.setModeOfPayment("PayOnilne");
		payment.setPlatformSource("WEB");
		payment.setTotalBillAmount(orders.getTotalBillAmount());
		paymentservice.savePayment(payment);

		/* payment */
		/* paytmDetailPojo.getPaytmUrl() */
		ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
		TreeMap<String, String> parameters = new TreeMap<>();
		PaytmConstants.details.forEach((k, v) -> parameters.put(k, v));
		parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
		parameters.put("EMAIL", env.getProperty("paytm.email"));
		parameters.put("ORDER_ID", "4172");
		parameters.put("TXN_AMOUNT", "83");
		parameters.put("CUST_ID", "9316");
		parameters.put("INDUSTRY_TYPE_ID", "Retail");
		parameters.put("CHANNEL_ID", "WEB");
		System.out.println(parameters);
		String checkSum = getCheckSum(parameters);
		parameters.put("CHECKSUMHASH", checkSum);
		modelAndView.addAllObjects(parameters);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		return modelAndView;
	}

	// checkoutAndSaveOrder PayByWallet
	@RequestMapping(value = "/checkoutAndSaveOrderPayByWallet")
	public ModelAndView checkoutAndSaveOrderPayByWallet(ModelAndView model,
			@ModelAttribute("wallet") Wallet walletpayment, BindingResult resultorder) {
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

		Payment payment = new Payment();
		payment.setCustomer(this.getCartPage().getCustomer());
		payment.setOrder(orders);
		payment.setOrderDate(orders.getOrderDate());
		payment.setPaymentMethod("wallet");
		payment.setPaymentStatus("pending");
		payment.setModeOfPayment("Pay By Wallet");
		payment.setPlatformSource("WEB");
		payment.setTotalBillAmount(orders.getTotalBillAmount());
		paymentservice.savePayment(payment);

		// update Wallet
		Wallet wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		wallet.setTotalAmountBalance(walletpayment.getTotalAmountBalance() - orders.getTotalBillAmount());
		walletservice.updateWallet(wallet);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("thankyou");
		return model;
	}

	// checkoutAndSaveOrder PayOnline
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

		Payment payment = new Payment();
		payment.setCustomer(this.getCartPage().getCustomer());
		payment.setOrder(orders);
		payment.setOrderDate(orders.getOrderDate());
		payment.setPaymentMethod("UPI");
		payment.setPaymentStatus("pending");
		payment.setModeOfPayment("Pay By Wallet");
		payment.setPlatformSource("WEB");
		payment.setTotalBillAmount(orders.getTotalBillAmount());
		paymentservice.savePayment(payment);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("thankyou");
		return model;
	}

	private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
		return PaytmChecksum.verifySignature(parameters, PaytmConstants.merchantKey, paytmChecksum);
	}

	private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
		return PaytmChecksum.generateSignature(parameters, PaytmConstants.merchantKey);
	}

	@RequestMapping(value = "/showPendingOrder{customerid}", method = RequestMethod.GET)
	public String showPendingOrders(HttpServletRequest req, Model model) {
		List<Orders> pendingOrders = orderservice.getPendingOrders(this.getCartPage().getCustomer().getCustomerid());
		model.addAttribute("pendingOrders", pendingOrders);
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
		
		model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
		model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		return "pendingorder";
	}

	@RequestMapping(value = "/showDeliveredOrder{customerid}", method = RequestMethod.GET)
	public String showDeliveredOrder(HttpServletRequest req, Model model) {
		List<Orders> deliveredOrders = orderservice
				.getDeliveredOrders(this.getCartPage().getCustomer().getCustomerid());
		model.addAttribute("deliveredOrders", deliveredOrders);
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
		
		model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
		model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		return "myorder";
	}

	
	// delivered order item
	@RequestMapping(value = "/confirmcancelOrder", method = RequestMethod.GET)
	public ModelAndView confirmcancelOrder(ModelAndView model) {

		model.setViewName("cancel");
		return model;
	}

	@RequestMapping(value = "/showCancelOrder{customerid}", method = RequestMethod.GET)
	public String showCancelOrders(HttpServletRequest req, Model model) {
		List<Orders> CancelOrders = orderservice.getCancelledOrders(this.getCartPage().getCustomer().getCustomerid());
		model.addAttribute("CancelOrders", CancelOrders);
		return "cancelOrder";
	}

	 //Pending Orders
	@RequestMapping(value = "/showPendingOrders{customerid}", method = RequestMethod.GET)
	public String showPendingOrder(HttpServletRequest req, Model model, HttpServletRequest request) {
		List<Orders> pendingOrders = orderservice.getPendingOrders(this.getCartPage().getCustomer().getCustomerid());

		Map orderitems = new HashMap();
		for (Iterator it = pendingOrders.iterator(); it.hasNext();) {
			Orders orders = (Orders) it.next();

			List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
			orderitems.put(orders.getOrderid(), listorderitem);
		}
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
		/* model.addAttribute("pendingOrders", pendingOrders); */
		/* model.addAttribute("orderitems", orderitems); */
		model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
		model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		request.setAttribute("pendingOrders", pendingOrders);
		request.setAttribute("orderitems", orderitems);
		return "pendingorder";

	}

	// Delivered Orders
	@RequestMapping(value = "/showDeliveredOrders{customerid}", method = RequestMethod.GET)
	public String showDeliveredOrders(HttpServletRequest req, Model model, HttpServletRequest request) {
		List<Orders> deliveredOrders = orderservice
				.getDeliveredOrders(this.getCartPage().getCustomer().getCustomerid());
		Map orderitems = new HashMap();
		for (Iterator it = deliveredOrders.iterator(); it.hasNext();) {
			Orders orders = (Orders) it.next();
			List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
			orderitems.put(orders.getOrderid(), listorderitem);
		}
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
		/* model.addAttribute("pendingOrders", pendingOrders); */
		/* model.addAttribute("orderitems", orderitems); */
		request.setAttribute("deliveredOrders", deliveredOrders);
		request.setAttribute("orderitems", orderitems);
		model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
		model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		return "deliveredorder";

	}

	// CancelOrder
	@RequestMapping(value = "/showCancelOrders{customerid}", method = RequestMethod.GET)
	public String showCancelOrders(HttpServletRequest req, Model model, HttpServletRequest request) {
		List<Orders> ListCancelOrderByDate = orderservice.getCancelledOrders(this.getCartPage().getCustomer().getCustomerid());
		Map orderitems = new HashMap();
		for (Iterator it = ListCancelOrderByDate.iterator(); it.hasNext();) {
			Orders orders = (Orders) it.next();
			List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
			orderitems.put(orders.getOrderid(), listorderitem);
		}
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addAttribute("listNavbarMenu",listNavbarMenu);
		/* model.addAttribute("orderitems", orderitems); */
		request.setAttribute("ListCancelOrderByDate", ListCancelOrderByDate);
		request.setAttribute("orderitems", orderitems);
		model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
		model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		return "cancelorder";

	}

	// cancel Order
	@RequestMapping(value = "/cancelOrder/{orderid}", method = RequestMethod.GET)
	public ModelAndView cancelOrder(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		order = orderservice.getOrder(orderid);
		order.setPickupStatus("Cancelled");
		order.setUpdatedDate(new Date());
		orderservice.updateOrders(order);
		List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
		model.addObject("listorderitem", listorderitem);
		model.addObject("order", order);
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		
		model.addObject("message", env.getProperty("order.cancelorder"));
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("cancel");
		return model;
	}

	@RequestMapping(value = "/orderdetail/{orderid}")
	public ModelAndView orderdeatil(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		order = orderservice.getOrder(orderid);
		model.addObject("order", order);
		List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listorderitem", listorderitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("orderdetail");
		return model;
	}

	@RequestMapping(value = "/orderinfo/{orderid}")
	public ModelAndView orderInfo(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		order = orderservice.getOrder(orderid);
		model.addObject("order", order);
		List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listorderitem", listorderitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("orderinfo");
		return model;
	}

	@RequestMapping(value = "/ordercancedetail/{orderid}")
	public ModelAndView ordercancedetail(ModelAndView model, @PathVariable(value = "orderid") int orderid,
			@ModelAttribute("orders") Orders order, BindingResult resultorder) {
		order = orderservice.getOrder(orderid);
		model.addObject("order", order);
		List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("listorderitem", listorderitem);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("ordercancedetail");
		return model;
	}

	@RequestMapping(value = "/orderReview")
	public ModelAndView orderReview(ModelAndView model) {
		String section = "Navbar";
		List<Menu> listNavbarMenu = menuservice.getMenu(section);
		model.addObject("listNavbarMenu",listNavbarMenu);
		model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
		model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
		model.setViewName("orderreview");
		return model;
	}

	 //FetchCancelOrder By date
	@RequestMapping(value = "/showCancelOrdersByDate{customerid}", method = RequestMethod.POST)
	public String showCancelOrdersByDateByDate(HttpServletRequest req, Model model, HttpServletRequest request,
			@RequestParam(value = "fromDate") String strDate, @RequestParam(value = "toDate") String endDate,
			@ModelAttribute("orders") Orders orders) throws ParseException {

		try {
			System.out.println("Log 1");
			System.out.println("STR From Date" + strDate + "TO Date" + endDate);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date fromDate = sdf.parse(strDate);
			Date toDate = sdf.parse(endDate);
			System.out.println("From Date" + fromDate + "TO Date" + toDate);

			System.out.println("Log 2");
			List<Orders> ListCancelOrderByDate = orderservice
					.getCancelOrdersBetweenDates(this.getCartPage().getCustomer().getCustomerid(), fromDate, toDate);
			
			System.out.println("All data" + ListCancelOrderByDate.toString());

			Map orderitems = new HashMap();
			for (Iterator it = ListCancelOrderByDate.iterator(); it.hasNext();) {
				orders = (Orders) it.next();
				System.out.println(orders.toString());

				List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
				System.out.println(listorderitem.toString());

				orderitems.put(orders.getOrderid(), listorderitem);
				//request.setAttribute("ListCancelOrderByDate", ListCancelOrderByDate);
				//request.setAttribute("orderitems", orderitems);
				
				
				String section = "Navbar";
				List<Menu> listNavbarMenu = menuservice.getMenu(section);
				model.addAttribute("listNavbarMenu",listNavbarMenu);
				/* model.addAttribute("orderitems", orderitems); */
				request.setAttribute("ListCancelOrderByDate", ListCancelOrderByDate);
				request.setAttribute("orderitems", orderitems);
				model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
				model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
				/* return "cancelorder"; */

			}

		} catch (Exception e) {
			System.out.println("Date not passing ");
			e.printStackTrace();

		}
		return "cancelorder";

	}
	
	
	     //Show All Order By PickupStatus
		@RequestMapping(value = "/showAllOrderByPickupStatus{customerid}", method = RequestMethod.POST)
		public String showAllOrderByPickupStatus(HttpServletRequest req, Model model, HttpServletRequest request,
				@RequestParam("pickupStatus") String pickupStatus,
				@ModelAttribute("orders") Orders orders) throws ParseException {
			
			//String pickupStatus  = "";
			//String ps = req.getParameter("pickupStatus");

			//if (ps != null && !ps.equals("")) {
				//pickupStatus = ps;
				
				System.out.println("Log 1");
				System.out.println(" From PickupStatus" + pickupStatus);
				System.out.println("Log 2");
				
			
			    List<Orders> ListOrders = orderservice.getAllOrders(this.getCartPage().getCustomer().getCustomerid(), pickupStatus);
				System.out.println("All data" + ListOrders.toString());

				Map orderitems = new HashMap();
				for (Iterator it = ListOrders.iterator(); it.hasNext();) {
					orders = (Orders) it.next();
					System.out.println(orders.toString());

					List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
					System.out.println(listorderitem.toString());

					orderitems.put(orders.getOrderid(), listorderitem);
					request.setAttribute("ListOrders",ListOrders);
					request.setAttribute("orderitems", orderitems);
					//request.setAttribute("ListCancelOrderByDate", ListCancelOrderByDate);
					//request.setAttribute("orderitems", orderitems);
				}
				String section = "Navbar";
				List<Menu> listNavbarMenu = menuservice.getMenu(section);
				model.addAttribute("listNavbarMenu",listNavbarMenu);
					
					/* model.addAttribute("orderitems", orderitems); */
					request.setAttribute("ListOrders",ListOrders);
					request.setAttribute("orderitems", orderitems);
					model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
					model.addAttribute("orderheading", VFOnlineConstants.ORDER_HEADING);
					model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
					/* return "cancelorder"; */
				    return "orders";
		}
	
		
	     //Order Details
		@RequestMapping(value = "/orderdetails/{orderid}")
		public ModelAndView orderDetails(ModelAndView model, @PathVariable(value = "orderid") int orderid,
				@ModelAttribute("orders") Orders order, BindingResult resultorder) {
			order = orderservice.getOrder(orderid);
			model.addObject("order", order);
			List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
			String section = "Navbar";
			List<Menu> listNavbarMenu = menuservice.getMenu(section);
			model.addObject("listNavbarMenu",listNavbarMenu);
			
			model.addObject("listorderitem", listorderitem);
			model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
			model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
			model.addObject("OrderDetails", VFOnlineConstants.ORDERDETIAL_HEADING);
			model.setViewName("orderdetails");
			return model;
		}
		
		
		
		 //FetchCancelOrder By date
		@RequestMapping(value = "/showOrdersByDatePickupStatus{customerid}{pickupStatus}", method = RequestMethod.POST)
		public String showOrdersByDatePickupStatus(HttpServletRequest req, Model model, HttpServletRequest request,
				@RequestParam(value = "fromDate") String strDate, @RequestParam(value = "toDate") String endDate,
				@ModelAttribute("orders") Orders orders,@PathVariable String pickupStatus) throws ParseException {
           
			try {
				System.out.println("Log 1");
				System.out.println("STR From Date" + strDate + "TO Date" + endDate);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date fromDate = sdf.parse(strDate);
				Date toDate = sdf.parse(endDate);
				System.out.println("From Date" + fromDate + "TO Date" + toDate);
				System.out.println("Log 2");
				System.out.println("pickupStatus="+ pickupStatus);
				List<Orders> ListOrders = orderservice.getOrdersBetweenDatespickupStatus(this.getCartPage().getCustomer().getCustomerid(), pickupStatus, fromDate, toDate);
						
				System.out.println("All data" + ListOrders.toString());

				Map orderitems = new HashMap();
				for (Iterator it = ListOrders.iterator(); it.hasNext();) {
					orders = (Orders) it.next();
					System.out.println(orders.toString());

					List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
					System.out.println(listorderitem.toString());

					orderitems.put(orders.getOrderid(), listorderitem);
					request.setAttribute("ListOrders", ListOrders);
					request.setAttribute("orderitems", orderitems);
					String section = "Navbar";
					List<Menu> listNavbarMenu = menuservice.getMenu(section);
					model.addAttribute("listNavbarMenu",listNavbarMenu);
					
					/* model.addAttribute("orderitems", orderitems); */
					request.setAttribute("ListOrders",ListOrders);
					request.setAttribute("orderitems", orderitems);
					model.addAttribute("dateformatter", VFOnlineConstants.DateFormatter);
					model.addAttribute("repee_sign", VFOnlineConstants.RUPEE_SIGN);
					/* return "cancelorder"; */

				}

			} catch (Exception e) {
				System.out.println("Date not passing ");
				e.printStackTrace();

			}
			return "order";

		}
		
		
		         //Order Details
				@RequestMapping(value = "/thanksorderdetails/{orderid}")
				public ModelAndView thanksorderdetails(ModelAndView model, @PathVariable(value = "orderid") int orderid,
						@ModelAttribute("orders") Orders order, BindingResult resultorder) {
					order = orderservice.getOrder(orderid);
					model.addObject("order", order);
					List<OrderItem> listorderitem = orderservice.listOrderItem(order.getOrderid());
					String section = "Navbar";
					List<Menu> listNavbarMenu = menuservice.getMenu(section);
					model.addObject("listNavbarMenu",listNavbarMenu);
					model.addObject("listorderitem", listorderitem);
					model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
					model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
					model.addObject("OrderDetails", VFOnlineConstants.ORDERDETIAL_HEADING);
					model.setViewName("thanksfororder");
					return model;
				}
				
				
				 //PickupAddressPaymrntOption
		  		@RequestMapping(value = "/PickupAddressPaymentOption", method = RequestMethod.GET)
		  		public ModelAndView PickupAddressPaymrntOption(ModelAndView model, @Valid @ModelAttribute("customer") Customer customer,
						BindingResult result, HttpSession session) {
		  			System.out.println("editProfile");
					customer = customerService.getCustomer(this.getCartPage().getCustomer().getCustomerid());
					System.out.println("customer" + customer.toString());
					System.out.println("customName" + customer.getFirstName());
					model = new ModelAndView("PickupAddressPaymentOption");
					model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
					model.addObject("customer", customer);
					return model;
				}
		  		
		 		
		  		 //place Order
				@RequestMapping(value = "/placeOrder", method = RequestMethod.POST)
				public ModelAndView saveEditCustomer(ModelAndView model, @Valid @ModelAttribute("customer") Customer customer,
						BindingResult result, HttpSession session,HttpServletRequest request,@ModelAttribute("Wallet") Wallet wallet, BindingResult resultwallet) throws Exception {
					
					String paymentoption = request.getParameter("param");
					String roles="ROLE_USER";
				    customer.setRole(roles);
				    customerService.updateCustomer(customer);
				    System.out.println(paymentoption);
				    
				    //PayAtKiosk Paymnet Option
				    if (paymentoption.equalsIgnoreCase("payatkiosk")) {
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
							//orderitem.setProductbuyingprice(cartitem.get(i).getProduct().getPrice()-cartitem.get(i).getProduct().getDiscount()*cartitem.get(i).getProduct().getPrice()/100);
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
							cartpage.setGrandTotal(cartpage.getGrandTotal()-cartitem.get(i).getTotal());
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

						Payment payment = new Payment();
						payment.setCustomer(this.getCartPage().getCustomer());
						payment.setOrder(orders);
						payment.setOrderDate(orders.getOrderDate());
						payment.setPaymentStatus("pending");
						payment.setModeOfPayment("Pay At Kisok");
						payment.setTotalBillAmount(orders.getTotalBillAmount());
						paymentservice.savePayment(payment);
						orders = orderservice.getOrder(orders.getOrderid());
						model.addObject("orders", orders);
						List<OrderItem> listorderitem = orderservice.listOrderItem(orders.getOrderid());
						model.addObject("listorderitem", listorderitem);
				    }
				    
				    //PayOnline Payment Option
				    else if(paymentoption.equalsIgnoreCase("payonline")){
				    	
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

						Payment payment = new Payment();
						payment.setCustomer(this.getCartPage().getCustomer());
						payment.setOrder(orders);
						payment.setOrderDate(orders.getOrderDate());
						payment.setPaymentStatus("pending");
						payment.setModeOfPayment("PayOnilne");
						payment.setPlatformSource("WEB");
						payment.setTotalBillAmount(orders.getTotalBillAmount());
						paymentservice.savePayment(payment);

						/* payment */
						/* paytmDetailPojo.getPaytmUrl() */
						String orderid=Integer.toString(orders.getOrderid());  
						String customerid=Integer.toString(this.getCartPage().getCustomer().getCustomerid());  
						String totalBillAmount=Double.toString(orders.getTotalBillAmount());  
						
						ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
						TreeMap<String, String> parameters = new TreeMap<>();
						PaytmConstants.orderdetails.forEach((k, v) -> parameters.put(k, v));
						parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
						parameters.put("EMAIL", env.getProperty("paytm.email"));
						parameters.put("ORDER_ID", orderid);
						parameters.put("TXN_AMOUNT",totalBillAmount);
						parameters.put("CUST_ID",customerid);
						parameters.put("INDUSTRY_TYPE_ID", "Retail");
						parameters.put("CHANNEL_ID", "WEB");
						System.out.println(parameters);
						String checkSum = getCheckSum(parameters);
						parameters.put("CHECKSUMHASH", checkSum);
						modelAndView.addAllObjects(parameters);
						model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
						model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
						return modelAndView;
				    }
				    //UPI Payment Option
				    else if(paymentoption.equalsIgnoreCase("upi")){
				    	
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

						Payment payment = new Payment();
						payment.setCustomer(this.getCartPage().getCustomer());
						payment.setOrder(orders);
						payment.setOrderDate(orders.getOrderDate());
						payment.setPaymentStatus("pending");
						payment.setModeOfPayment("PayOnilne");
						payment.setPlatformSource("WEB");
						payment.setTotalBillAmount(orders.getTotalBillAmount());
						paymentservice.savePayment(payment);

						/* payment */
						/* paytmDetailPojo.getPaytmUrl() */
						String orderid=Integer.toString(orders.getOrderid());  
						String customerid=Integer.toString(this.getCartPage().getCustomer().getCustomerid());  
						String totalBillAmount=Double.toString(orders.getTotalBillAmount());  
						
						ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
						TreeMap<String, String> parameters = new TreeMap<>();
						PaytmConstants.orderdetails.forEach((k, v) -> parameters.put(k, v));
						parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
						parameters.put("EMAIL", env.getProperty("paytm.email"));
						parameters.put("ORDER_ID", orderid);
						parameters.put("TXN_AMOUNT",totalBillAmount);
						parameters.put("CUST_ID",customerid);
						parameters.put("INDUSTRY_TYPE_ID", "Retail");
						parameters.put("CHANNEL_ID", "WEB");
						System.out.println(parameters);
						String checkSum = getCheckSum(parameters);
						parameters.put("CHECKSUMHASH", checkSum);
						modelAndView.addAllObjects(parameters);
						model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
						model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
						return modelAndView;
				    }
				    else if(paymentoption.equalsIgnoreCase("wallet")){
				    	
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

						Payment payment = new Payment();
						payment.setCustomer(this.getCartPage().getCustomer());
						payment.setOrder(orders);
						payment.setOrderDate(orders.getOrderDate());
						payment.setPaymentStatus("pending");
						payment.setModeOfPayment("PayOnilne");
						payment.setPlatformSource("WEB");
						payment.setTotalBillAmount(orders.getTotalBillAmount());
						paymentservice.savePayment(payment);

						/* payment */
						/* paytmDetailPojo.getPaytmUrl() */
						String orderid=Integer.toString(orders.getOrderid());  
						String customerid=Integer.toString(this.getCartPage().getCustomer().getCustomerid());  
						String totalBillAmount=Double.toString(orders.getTotalBillAmount());

						ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
						TreeMap<String, String> parameters = new TreeMap<>();
						System.out.println(parameters);
						PaytmConstants.detail.forEach((k, v) -> parameters.put(k, v));
						parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
						parameters.put("EMAIL", env.getProperty("paytm.email"));
						parameters.put("TXN_AMOUNT",totalBillAmount);
						parameters.put("ORDER_ID",orderid);
						parameters.put("CUST_ID",customerid);
						parameters.put("INDUSTRY_TYPE_ID", "Retail");
						parameters.put("CHANNEL_ID", "WEB");
						String checkSum = getCheckSum(parameters);
						parameters.put("CHECKSUMHASH", checkSum);
						modelAndView.addAllObjects(parameters);
						
						wallet = walletservice.fetchWallet(orders.getCustomer().getCustomerid());
						if(wallet.getTotalAmountBalance()+ orders.getTotalBillAmount()<=5000) {
						WalletPayment walletpayment = new WalletPayment();
						walletpayment.setPaymentAmount(orders.getTotalBillAmount());
						walletpayment.setPaymentDate(new Date());
						walletpayment.setPaymentStatus("Credit");
						walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
						walletservice.addWalletPayment(walletpayment);
						wallet.setTotalAmountBalance(wallet.getTotalAmountBalance()-orders.getTotalBillAmount());
						model.addObject("dateformatter",VFOnlineConstants.DateFormatter);
						model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
						walletservice.updateWallet(wallet);
						return modelAndView;
					}
						else {
							model.addObject("message", env.getProperty("wallet.maxlimit"));
							String section = "Navbar";
							List<Menu> listNavbarMenu = menuservice.getMenu(section);
							model.addObject("listNavbarMenu",listNavbarMenu);
							wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
							System.out.println("wallet id" + wallet);
							System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
							model.addObject("wallet", wallet);
							model.addObject("dateformatter",VFOnlineConstants.DateFormatter);
							model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
							model.setViewName("PickupAddressPaymentOption");
							return model;
						}
						
						
						
				    }
				    else {
				    	
				    	System.out.println("wrong way");
				    }
				   
					
				    model.addObject("dateformatter", VFOnlineConstants.DateFormatter);
					model.addObject("repee_sign", VFOnlineConstants.RUPEE_SIGN);
					model.setViewName("thanksfororder");
					return model;
				}
		  		
				
				
                //Payment Gateway Response PayOnline Response Page
				@RequestMapping(value = "/pgResponse")
				public ModelAndView getResponseRedirect(HttpServletRequest request, ModelAndView model,@ModelAttribute("Wallet") Wallet wallet,
						BindingResult resultwallet) {

					Map<String, String[]> mapData = request.getParameterMap();
					TreeMap<String, String> parameters = new TreeMap<String, String>();
					mapData.forEach((key, val) -> parameters.put(key, val[0]));
					String paytmChecksum = "";
					if (mapData.containsKey("CHECKSUMHASH")) {
						paytmChecksum = mapData.get("CHECKSUMHASH")[0];
					}
					String result;

					boolean isValideChecksum = false;
					System.out.println("RESULT : " + parameters.toString());
					try {
						isValideChecksum = validateCheckSum(parameters, paytmChecksum);
						if (isValideChecksum && parameters.containsKey("RESPCODE")) {
							if (parameters.get("RESPCODE").equals("01")) {
								result = "Payment Successful";
							} else {
								result = "Payment Failed";
							}
						} else {
							result = "Checksum mismatched";
						}
					} catch (Exception e) {
						result = e.toString();
					}
					model.addObject("result", result);
					parameters.remove("CHECKSUMHASH");
					model.addObject("parameters", parameters);
					model.addObject("dateformatter",VFOnlineConstants.DateFormatter);
					model.addObject("repee_sign",VFOnlineConstants.RUPEE_SIGN);
					model.setViewName("thanksfororder");
					return model;
				}

				
					  
		  		
}
