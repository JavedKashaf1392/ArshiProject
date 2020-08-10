package com.veggiefridge.online.constants;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

//@Configuration
//@PropertySource(value = { "classpath:application.properties" })
public class PaytmConstants {
	
	//@Value("${paytm.merchantId}")
	public static final String MID="dtHXBX68721093259122";
	
	//@Value("${paytm.merchantKey}")
	public static final String MERCHANT_KEY="i8kMBXhmzY_1@cGg"; 
	
	//@Value("${paytm.channelId}")
	public static final String INDUSTRY_TYPE_ID="Retail"; 
	
	//@Value("${paytm.website}")
	public static final String CHANNEL_ID="WEB";
	
	//@Value("${paytm.industryTypeId}")
	public static final String WEBSITE="WEBSTAGING";
	
	//public final static String PAYTM_URL="https://securegw-stage.paytm.in/order/process/paytmCallback?ORDER_ID="+1234; 
	
	//@Value("${paytm.paytmUrl}")
	public static final String PAYTM_URL="https://securegw-stage.paytm.in/order/process";
	
    public static final String CALLBACK_URL="http://localhost:8080/pgresponse";
}

