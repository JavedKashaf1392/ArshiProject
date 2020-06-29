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
@PropertySource(value = { "classpath:application.properties" })
public class VFOnlineConstants {
	
	// SMS
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
}