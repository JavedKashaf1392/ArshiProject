package com.veggiefridge.online.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.paytm.pg.merchant.PaytmChecksum;
import com.veggiefridge.online.constants.PaytmConstants;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Payment;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.model.WalletPayment;
import com.veggiefridge.online.service.OrderService;
import com.veggiefridge.online.service.ProductService;
import com.veggiefridge.online.service.WalletService;

@Controller
@RequestMapping(value = "/wallet")

public class WalletController {

	@Autowired
	private Environment env;

	@Autowired
	private WalletService walletservice;

	@Autowired
	private HttpSession session;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderservice;

	// get Wallet
	private Wallet getWallet() {
		return ((CustomerModel) session.getAttribute("customerModel")).getWallet();

	}

	// get cartPage
	private CartPage getCartPage() {
		return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
	}

	 //myWallet
	@RequestMapping(value = "/myWallet/{customerid}", method = RequestMethod.GET)
	public ModelAndView listOrderItem(ModelAndView model, @Valid @ModelAttribute("wallet") Wallet wallet,
			BindingResult result, HttpSession session) {
		wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		System.out.println("wallet id" + wallet);
		System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
		model.addObject("wallet", wallet);
		String section = "Navbar";
		List<Menu> listMenu = productService.getMenuByNavbar(section);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
		List<WalletPayment> listwallettransaction=walletservice.listWalletPayment(this.getCartPage().getCustomer().getWallet().getWalletID());
		model.addObject("listwallettransaction", listwallettransaction);
		model.addObject("listprofileMenu", listprofileMenu);
		model.addObject("listMenu", listMenu);
		model.setViewName("wallet");
		return model;
	}

	// chooseanamount
	@RequestMapping(value = "/chooseanamount/{customerid}")
	public ModelAndView chooseAnAmount(ModelAndView model, @PathVariable(value = "customerid") int customerid,
			@ModelAttribute("Wallet") Wallet wallet) {
		wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		System.out.println("wallet id" + wallet);
		System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
		model.addObject("wallet", wallet);

		String section = "Navbar";
		List<Menu> listMenu = productService.getMenuByNavbar(section);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
		model.addObject("listprofileMenu", listprofileMenu);
		model.addObject("listMenu", listMenu);
		model.setViewName("wallet");
		model.setViewName("/chooseanamount");
		return model;
	}

	@RequestMapping(value = "/addMoneyInWallet/{customerid}", method = RequestMethod.POST)
	public ModelAndView getRedirect(@RequestParam(value = "TXN_AMOUNT") String transactionAmount, ModelAndView model,
			@PathVariable(value = "customerid") int customerid, @ModelAttribute("Wallet") Wallet wallet,
			BindingResult resultwallet) throws Exception {

		System.out.println("........................................");
		System.out.println(transactionAmount);
		/* paytmDetailPojo.getPaytmUrl() */
		Random random = new Random();
		String Orderid = random.toString();
		System.out.println(Orderid);
		String id = random.toString();
		System.out.println(customerid);
		ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
		TreeMap<String, String> parameters = new TreeMap<>();
		System.out.println(parameters);
		PaytmConstants.detail.forEach((k, v) -> parameters.put(k, v));
		parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
		parameters.put("EMAIL", env.getProperty("paytm.email"));
		parameters.put("TXN_AMOUNT", transactionAmount);
		parameters.put("ORDER_ID", Orderid);
		parameters.put("CUST_ID", id);
		parameters.put("INDUSTRY_TYPE_ID", "Retail");
		parameters.put("CHANNEL_ID", "WEB");
		String checkSum = getCheckSum(parameters);
		parameters.put("CHECKSUMHASH", checkSum);
		modelAndView.addAllObjects(parameters);
		//WalletPayment walletpayment = new WalletPayment();
		//double txnAmount = Double.parseDouble(transactionAmount);
		//walletpayment.setPaymentAmount(txnAmount);
		//walletpayment.setPaymentDate(new Date());
		//walletpayment.setPaymentStatus("Debit");
		//walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
		//walletservice.addWalletPayment(walletpayment);
		//wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		//wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + txnAmount);
		//walletservice.updateWallet(wallet);
		double txnAmount = Double.parseDouble(transactionAmount);
		wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		if(wallet.getTotalAmountBalance()+txnAmount<=5000) {
		WalletPayment walletpayment = new WalletPayment();
		walletpayment.setPaymentAmount(txnAmount);
		walletpayment.setPaymentDate(new Date());
		walletpayment.setPaymentStatus("Debit");
		walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
		walletservice.addWalletPayment(walletpayment);
		wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + txnAmount);
		walletservice.updateWallet(wallet);
		return modelAndView;
	}
		else {
			model.addObject("message", env.getProperty("wallet.maxlimit"));
			String section = "Navbar";
			List<Menu> listMenu = productService.getMenuByNavbar(section);
			String profilemenuSection = "Profile";
			List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
			model.addObject("listprofileMenu", listprofileMenu);
			model.addObject("listMenu", listMenu);
			wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
			System.out.println("wallet id" + wallet);
			System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
			model.addObject("wallet", wallet);
			model.setViewName("chooseanamount");
			return model;
		}
		
	}
	@RequestMapping(value = "/pgres")
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
		String section = "Navbar";
		List<Menu> listMenu = productService.getMenuByNavbar(section);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
		model.addObject("listprofileMenu", listprofileMenu);
		model.addObject("listMenu", listMenu);
		wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		System.out.println("wallet id" + wallet);
		System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
		model.addObject("wallet", wallet);
		List<WalletPayment> listwallettransaction=walletservice.listWalletPayment(this.getCartPage().getCustomer().getWallet().getWalletID());
		model.addObject("listwallettransaction", listwallettransaction);
		model.addObject("message", env.getProperty("wallet.walletupdated"));
		model.setViewName("wallet");
		return model;
	}

	private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
		return PaytmChecksum.verifySignature(parameters, PaytmConstants.merchantKey, paytmChecksum);
	}

	private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
		return PaytmChecksum.generateSignature(parameters, PaytmConstants.merchantKey);
	}

	// get All WalletPaymnet
	@RequestMapping(value = "/allWalletPaymnet")
	public ModelAndView allWalletPaymnet(ModelAndView model) {
		List<WalletPayment> listWalletPaymnet = walletservice.listWalletPayment();
		model.addObject("listWalletPaymnet", listWalletPaymnet);
		String section = "Navbar";
		List<Menu> listMenu = productService.getMenuByNavbar(section);
		String profilemenuSection = "Profile";
		List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
		model.addObject("listprofileMenu", listprofileMenu);
		model.addObject("listMenu", listMenu);
		model.setViewName("wallet");
		return model;
	}

	 //add Refund Money InWallet
	@RequestMapping(value = "/addRefundMoneyInWallet/{customerid}", method = RequestMethod.GET)
	public ModelAndView addRefundMoneyInWallet(ModelAndView model, @PathVariable(value = "customerid") int customerid,
			@ModelAttribute("Wallet") Wallet wallet, BindingResult resultwallet,
			BindingResult resultorder) throws Exception {
		System.out.println("........................................");
	
		/* paytmDetailPojo.getPaytmUrl() */
		Random random = new Random();
		String Orderid = random.toString();
		System.out.println(Orderid);
		String id = random.toString();
		System.out.println(customerid);
		ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
		TreeMap<String, String> parameters = new TreeMap<>();
		System.out.println(parameters);
		PaytmConstants.detail.forEach((k, v) -> parameters.put(k, v));
		parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
		parameters.put("EMAIL", env.getProperty("paytm.email"));
		parameters.put("TXN_AMOUNT","50");
		parameters.put("ORDER_ID", Orderid);
		parameters.put("CUST_ID", id);
		parameters.put("INDUSTRY_TYPE_ID", "Retail");
		parameters.put("CHANNEL_ID", "WEB");
		String checkSum = getCheckSum(parameters);
		parameters.put("CHECKSUMHASH", checkSum);
		modelAndView.addAllObjects(parameters);
		//WalletPayment walletpayment = new WalletPayment();
		//double txnAmount = Double.parseDouble(transactionAmount);
		//walletpayment.setPaymentAmount(txnAmount);
		//walletpayment.setPaymentDate(new Date());
		//walletpayment.setPaymentStatus("Debit");
		//walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
		//walletservice.addWalletPayment(walletpayment);
		//wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		//wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + txnAmount);
		//walletservice.updateWallet(wallet);
		double txnAmount = Double.parseDouble("50");
		wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		if(wallet.getTotalAmountBalance()+txnAmount<=5000) {
		WalletPayment walletpayment = new WalletPayment();
		walletpayment.setPaymentAmount(txnAmount);
		walletpayment.setPaymentDate(new Date());
		walletpayment.setPaymentStatus("Debit");
		walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
		walletservice.addWalletPayment(walletpayment);
		wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + txnAmount);
		walletservice.updateWallet(wallet);
		return modelAndView;
	}
		else {
			model.addObject("message", env.getProperty("wallet.maxlimit"));
			String section = "Navbar";
			List<Menu> listMenu = productService.getMenuByNavbar(section);
			String profilemenuSection = "Profile";
			List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
			model.addObject("listprofileMenu", listprofileMenu);
			model.addObject("listMenu", listMenu);
			wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
			System.out.println("wallet id" + wallet);
			System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
			model.addObject("wallet", wallet);
			model.setViewName("chooseanamount");
			return model;
		}
	}
		
	
		 //add Refnd Money InWallet
		@RequestMapping(value = "/addRefudMoneyInWallet/{orderid}", method = RequestMethod.GET)
		public ModelAndView addRefudMoneyInWallet(ModelAndView model, @PathVariable(value = "orderid") int orderid,
				@ModelAttribute("Wallet") Wallet wallet, BindingResult resultwallet,
				BindingResult resultorder,@ModelAttribute("orders") Orders order) throws Exception {
			System.out.println("........................................");
			order = orderservice.getOrder(orderid);
			model.addObject("order",order);
			/* paytmDetailPojo.getPaytmUrl() */
			Random random = new Random();
			String Orderid = random.toString();
			System.out.println(Orderid);
			String id = random.toString();
			double refundmoney = order.getTotalBillAmount();
			String txnAmount = Double.toString(refundmoney);
			ModelAndView modelAndView = new ModelAndView("redirect:" + "https://securegw-stage.paytm.in/order/process");
			TreeMap<String, String> parameters = new TreeMap<>();
			System.out.println(parameters);
			PaytmConstants.detail.forEach((k, v) -> parameters.put(k, v));
			parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
			parameters.put("EMAIL", env.getProperty("paytm.email"));
			parameters.put("TXN_AMOUNT",txnAmount);
			parameters.put("ORDER_ID", Orderid);
			parameters.put("CUST_ID", id);
			parameters.put("INDUSTRY_TYPE_ID", "Retail");
			parameters.put("CHANNEL_ID", "WEB");
			String checkSum = getCheckSum(parameters);
			parameters.put("CHECKSUMHASH", checkSum);
			modelAndView.addAllObjects(parameters);
			//WalletPayment walletpayment = new WalletPayment();
			//double txnAmount = Double.parseDouble(transactionAmount);
			//walletpayment.setPaymentAmount(txnAmount);
			//walletpayment.setPaymentDate(new Date());
			//walletpayment.setPaymentStatus("Debit");
			//walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
			//walletservice.addWalletPayment(walletpayment);
			//wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
			//wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + txnAmount);
			//walletservice.updateWallet(wallet);
			
			wallet = walletservice.fetchWallet(order.getCustomer().getCustomerid());
			if(wallet.getTotalAmountBalance()+ refundmoney<=5000) {
			WalletPayment walletpayment = new WalletPayment();
			walletpayment.setPaymentAmount(refundmoney);
			walletpayment.setPaymentDate(new Date());
			walletpayment.setPaymentStatus("Debit");
			walletpayment.setWallet(this.getCartPage().getCustomer().getWallet());
			walletservice.addWalletPayment(walletpayment);
			wallet.setTotalAmountBalance(wallet.getTotalAmountBalance() + refundmoney);
			walletservice.updateWallet(wallet);
			return modelAndView;
		}
			else {
				model.addObject("message", env.getProperty("wallet.maxlimit"));
				String section = "Navbar";
				List<Menu> listMenu = productService.getMenuByNavbar(section);
				String profilemenuSection = "Profile";
				List<Menu> listprofileMenu = productService.getMenuByNavbar(profilemenuSection);
				model.addObject("listprofileMenu", listprofileMenu);
				model.addObject("listMenu", listMenu);
				wallet = walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
				System.out.println("wallet id" + wallet);
				System.out.println("wallet totalAmountBalance" + wallet.getTotalAmountBalance());
				model.addObject("wallet", wallet);
				model.setViewName("chooseanamount");
				return model;
			}
			

}
}