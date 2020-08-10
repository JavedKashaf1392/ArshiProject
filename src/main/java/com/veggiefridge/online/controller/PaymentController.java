package com.veggiefridge.online.controller;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.paytm.pg.merchant.CheckSumServiceHelper;
import com.veggiefridge.online.constants.PaytmConstants;

@Controller
@RequestMapping(value ="/payment")
public class PaymentController {

	@Autowired
	private Environment env;
	
	 @RequestMapping(value ="/pgredirect")
	    public ModelAndView getRedirect(@RequestParam("CUST_ID") String customerId,
	                                    @RequestParam("TXN_AMOUNT") String transactionAmount,
	                                    @RequestParam("ORDER_ID") String orderId,HttpServletRequest request) throws Exception{
		 
		   Enumeration<String> paramNames = request.getParameterNames();
		   Map<String, String[]> mapData = request.getParameterMap();
		   TreeMap<String,String> parameters = new TreeMap<String,String>();
		   String paytmChecksum =  "";
		   while(paramNames.hasMoreElements()) {
		   	String paramName = (String)paramNames.nextElement();
		   	parameters.put(paramName,mapData.get(paramName)[0]);	
		   }
 
		   //TreeMap<String,String> parameters = new TreeMap<String,String>();
		    com.paytm.pg.merchant.CheckSumServiceHelper checkSumServiceHelper = com.paytm.pg.merchant.CheckSumServiceHelper.getCheckSumServiceHelper();
	        ModelAndView modelAndView = new ModelAndView("redirect:" + PaytmConstants.PAYTM_URL);
	        parameters.put("MID",PaytmConstants.MID);
	        parameters.put("CHANNEL_ID",PaytmConstants.CHANNEL_ID);
	        parameters.put("INDUSTRY_TYPE_ID",PaytmConstants.INDUSTRY_TYPE_ID);
	        parameters.put("WEBSITE",PaytmConstants.WEBSITE);
	        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
	        parameters.put("EMAIL", env.getProperty("paytm.email"));
	        parameters.put("CALLBACK_URL",PaytmConstants.CALLBACK_URL);
	        parameters.put("ORDER_ID", orderId);
	        parameters.put("TXN_AMOUNT", transactionAmount);
	        parameters.put("CUST_ID", customerId);
	        String checkSum = getCheckSum(parameters);
	        parameters.put("CHECKSUMHASH", checkSum);
	        modelAndView.addAllObjects(parameters);
	        return modelAndView;
	    }

	 @RequestMapping(value ="/pgresponse")
	    public String getResponseRedirect(HttpServletRequest request, Model model) throws Exception {
	        Enumeration<String> paramNames = request.getParameterNames();
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

	
		private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
			return CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(PaytmConstants.MERCHANT_KEY, parameters);
		}
	  

	    private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
	        return CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,
	                parameters, paytmChecksum);
	    }
		
	   
	  
}
