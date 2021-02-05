package com.veggiefridge.online.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.service.ProductService;
import com.veggiefridge.online.service.WalletService;

@Controller
@RequestMapping(value ="/wallet")

public class WalletController {
	
	@Autowired
	private Environment env;
	
	
	@Autowired
	private WalletService walletservice;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ProductService productService;
	
	
	     // get cartPage
		private CartPage getCartPage() {
			return ((CustomerModel) session.getAttribute("customerModel")).getCartpage();
		}
	
	     //myWallet
		@RequestMapping(value = "/myWallet/{customerid}", method = RequestMethod.GET)
		public ModelAndView listOrderItem(ModelAndView model, @PathVariable(value ="customerid") int customerid) {
	        Wallet wallet= walletservice.fetchWallet(this.getCartPage().getCustomer().getCustomerid());
		    System.out.println("wallet id"+wallet);
			model.addObject("wallet", wallet);
			model.setViewName("wallet");
			return model;
		}
		
		//add Refund Money InWallet
		@RequestMapping(value = "/addRefundMoneyInWallet/{customerid}", method = RequestMethod.GET)
		public ModelAndView addRefundMoneyInWallet(ModelAndView model,@PathVariable(value = "customerid") int customerid,
		    @ModelAttribute("Wallet") Wallet wallet, BindingResult resultwallet, @ModelAttribute("order") Orders order,BindingResult resultorder) {
			System.out.println("order"+order.toString());
			 if (wallet.getWalletID() == 0) { // if employee id is 0 then creating the
				// employee other updating the employee
	         wallet=new Wallet();	
			wallet.setTotalAmountBalance(30);
			wallet.setCustomer(this.getCartPage().getCustomer());
			walletservice.addRefundMoney(wallet);
			} else {
				wallet.setTotalAmountBalance(30);
				walletservice.updateWallet(wallet);
			}
			model.setViewName("wallet");
			return model;
		}
		
	
	
	//currentorder
	@RequestMapping(value = "/chooseanamount")
	public ModelAndView chooseAnAmount(ModelAndView model) {
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
	
	@RequestMapping(value ="/pgRedirect",method = RequestMethod.POST)
    public ModelAndView getRedirect(
                                    @RequestParam(value = "TXN_AMOUNT") String transactionAmount
                                   ) throws Exception {
	    
    	System.out.println("........................................");
    	System.out.println(transactionAmount);
    	/* paytmDetailPojo.getPaytmUrl()*/
        ModelAndView modelAndView = new ModelAndView("redirect:" +"https://securegw-stage.paytm.in/order/process");
        TreeMap<String, String> parameters = new TreeMap<>();
        System.out.println(parameters);
        PaytmConstants.detail.forEach((k, v) -> parameters.put(k, v));
        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
        parameters.put("EMAIL", env.getProperty("paytm.email"));
        parameters.put("TXN_AMOUNT", transactionAmount);
        parameters.put("ORDER_ID", "5237");
        parameters.put("CUST_ID","9153");
        parameters.put("INDUSTRY_TYPE_ID","Retail");
        parameters.put("CHANNEL_ID", "WEB");
        String checkSum = getCheckSum(parameters);
        parameters.put("CHECKSUMHASH", checkSum);
        modelAndView.addAllObjects(parameters);
        return modelAndView;
    }
 
    @RequestMapping(value = "/pgres")
    public String getResponseRedirect(HttpServletRequest request, Model model) {

        Map<String, String[]> mapData = request.getParameterMap();
        TreeMap<String, String> parameters = new TreeMap<String, String>();
        mapData.forEach((key, val) -> parameters.put(key, val[0]));
        String paytmChecksum = "";
        if (mapData.containsKey("CHECKSUMHASH")) {
            paytmChecksum = mapData.get("CHECKSUMHASH")[0];
        }
        String result;

        boolean isValideChecksum = false;
        System.out.println("RESULT : "+parameters.toString());
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
        model.addAttribute("result",result);
        parameters.remove("CHECKSUMHASH");
        model.addAttribute("parameters",parameters);
        return "report";
    }

    private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
        return PaytmChecksum.verifySignature(parameters,
                PaytmConstants.merchantKey, paytmChecksum);
    }


private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
	return PaytmChecksum.generateSignature(parameters, PaytmConstants.merchantKey);
}


   


}
