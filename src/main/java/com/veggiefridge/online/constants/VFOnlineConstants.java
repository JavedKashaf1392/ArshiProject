/**
 * 
 */
package com.veggiefridge.online.constants;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import com.veggiefridge.online.config.SMSConfiguration;

/**
 * @author Akshay N Wakudkar
 *
 */

@Configuration
@PropertySource(value = { "classpath:application.properties"})
public class VFOnlineConstants {
	
	//SMS
	@Value("${sms.textlocal.apiKey}")
	public static String SMS_APIKEY ;  //= "sms.textlocal.apiKey"
	
	@Value("${sms.textlocal.message}")
	public static String SMS_MESSAGE; // = "sms.textlocal.message";
	
	@Value("${sms.textlocal.code}")
	public static String SMS_CODE ;  //= "sms.textlocal.code"; 
	
	@Value("${sms.textlocal.url}")
	public static String SMS_URL;
	
	// MAIL
	@Value("${mail.emailfromrecipient}")
	public static String MAIL_EMAILFROMRECIPIENT;
	
	@Value("${mail.emailsubject}")
	public static String MAIL_EMAILSUBJECT;
	
	@Value("${mail.emailmessage}")
	public static String MAIL_EMAILMESSAGE;
	
	//@Value("${order.pickup.status}")
	public static final String PICKUP_STATUS="pending";
	
	public static final String PICKUPSTATUS="delivered";
	
	public static final String organic="organic";
	
	public static final String qrCodeIsValid="true";

}
