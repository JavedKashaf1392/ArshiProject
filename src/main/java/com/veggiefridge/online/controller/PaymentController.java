package com.veggiefridge.online.controller;

import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.paytm.pg.merchant.PaytmChecksum;
import com.veggiefridge.online.constants.PaytmConstants;
import com.veggiefridge.online.model.Customer;

@Controller
public class PaymentController {
	
	//@Autowired
	//private PaytmDetailPojo paytmDetailPojo;
	
	@Autowired
	private Environment env;
	
	@RequestMapping("/payment")
	public String home(@ModelAttribute("customer")Customer customer,BindingResult result) {
		//System.out.println(PaytmConstants.CHANNEL_ID);
		//System.out.println(PaytmConstants.INDUSTRY_TYPE_ID);
		//System.out.println(PaytmConstants.merchantId);
		//System.out.println(PaytmConstants.website);
		//System.out.println(PaytmConstants.paytmUrl);
		//System.out.println(PaytmConstants.merchantKey);
		//System.out.println("================================================");
		//System.out.println(PaytmConstants.details);
		return "pay";
	}
	
	    @RequestMapping(value ="/pgRedirect",method = RequestMethod.POST)
	    public ModelAndView getRedirect(@RequestParam(value  = "CUST_ID") String customerId,
	                                    @RequestParam(value = "TXN_AMOUNT") String transactionAmount,
	                                    @RequestParam(value = "ORDER_ID") String orderId) throws Exception {
		    
	    	System.out.println("........................................");
	    	System.out.println(customerId);
	    	System.out.println(transactionAmount);
	    	System.out.println(orderId);
	    	/* paytmDetailPojo.getPaytmUrl()*/
	        ModelAndView modelAndView = new ModelAndView("redirect:" +"https://securegw-stage.paytm.in/order/process");
	        TreeMap<String, String> parameters = new TreeMap<>();
	        System.out.println(parameters);
	        PaytmConstants.details.forEach((k, v) -> parameters.put(k, v));
	        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
	        parameters.put("EMAIL", env.getProperty("paytm.email"));
	        parameters.put("ORDER_ID", orderId);
	        System.out.println(orderId);
	        parameters.put("TXN_AMOUNT", transactionAmount);
	        parameters.put("CUST_ID", customerId);
	        String checkSum = getCheckSum(parameters);
	        parameters.put("CHECKSUMHASH", checkSum);
	        modelAndView.addAllObjects(parameters);
	        return modelAndView;
	    
	    }
	 
	 
	 @RequestMapping(value = "/pgresponse")
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


