package com.veggiefridge.online.constants;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = { "classpath:application.properties"})
public class PaytmConstants {
	
	public static String mid="MID";
	//@Value("${paytm.payment.mId}")
	public static String merchantId="dtHXBX68721093259122"; 
	
	public static String mKey="merchantKey";
	//@Value("${paytm.payment.merchantKey}")
	public static String merchantKey="i8kMBXhmzY_1@cGg";
	
	public static String cid="CHANNEL_ID";
	//@Value("${paytm.payment.channelId}")
	public static String CHANNEL_ID="WEB";
	
	public static String wsite="WEBSITE";
	//@Value("${paytm.payment.website}")
	public static String website="WEBSTAGING";
	
	public static String industryid="INDUSTRY_TYPE_ID";
	//@Value("${paytm.payment.industryTypeId}")
	public static String INDUSTRY_TYPE_ID="Retail";
	
	public static String purl="paytmUrl";
	//@Value("${paytm.payment.paytmUrl}")
	public static String paytmUrl="https://securegw-stage.paytm.in/order/process";
	
	public static String cback="CALLBACK_URL";
	public static String callbackUrl="http://localhost:8080/pgresponse";
	
	public static String callback="CALLBACK_URL";
	public static String callbackUrl2="http://localhost:8080/wallet/pgres";
	
	public static String callbackurl="CALLBACK_URL";
	public static String callbackUrl3="http://localhost:8080/order/pgResponse";
	
	public static String cburl="CALLBACK_URL";
	public static String callbackUrl4="http://localhost:8080/wallet/pgress";
	
	//@Value("#{${details}}")
	//public static HashMap<String, String> details= new HashMap<String, String>();
     
	//public static Map<String,String> details = Map.ofEntries(
		    //entry("k1", "v1"), entry("k2", "v2"));
	
	/*
	 * private static Map<String, String> details = new HashMap<String, String>();
	 * details.put("",""); put("", "thirty"); put("", "forty"); put("", "fifty");
	 * put("", "sixty"); put("", "seventy"); put("", "eighty"); put("", "ninety");
	 * 
	 * }
	 */
	
	public static final Map<String, String> details;
	static {
	    Map<String, String> map = new HashMap<String, String>();
	    map.put(mid,"dtHXBX68721093259122");
	    map.put(cid, "WEB");
	    map.put(industryid,"Retail");
	    map.put(wsite, "WEBSTAGING");
	    map.put(cback,"http:localhost:8080/vf-online/pgresponse");
	    // ...
	    details = Collections.unmodifiableMap(map);
	}
	
	public static final Map<String, String> detail;
	static {
	    Map<String, String> map = new HashMap<String, String>();
	    map.put(mid,"dtHXBX68721093259122");
	    map.put(cid, "WEB");
	    map.put(industryid,"Retail");
	    map.put(wsite, "WEBSTAGING");
	    map.put(callback,"http:localhost:8080/vf-online/wallet/pgres");
	    // ...
	    detail = Collections.unmodifiableMap(map);
	}
	
	public static final Map<String, String> orderdetails;
	static {
	    Map<String, String> map = new HashMap<String, String>();
	    map.put(mid,"dtHXBX68721093259122");
	    map.put(cid, "WEB");
	    map.put(industryid,"Retail");
	    map.put(wsite, "WEBSTAGING");
	    map.put(callbackurl,"http:localhost:8080/vf-online/order/pgResponse");
	    // ...
	    orderdetails = Collections.unmodifiableMap(map);
	}
	
	public static final Map<String, String> orderdetail;
	static {
	    Map<String, String> map = new HashMap<String, String>();
	    map.put(mid,"dtHXBX68721093259122");
	    map.put(cid, "WEB");
	    map.put(industryid,"Retail");
	    map.put(wsite, "WEBSTAGING");
	    map.put(cburl,"http://localhost:8080/wallet/pgress");
	    // ...
	    orderdetail = Collections.unmodifiableMap(map);
	}
	
}
