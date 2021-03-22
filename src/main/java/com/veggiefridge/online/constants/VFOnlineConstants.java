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
	
    public static final String PICKUP_STATUS="Pending";
	
	public static final String PICKUPSTATUS="Delivered";
	
	public static final String organic="organic";
	
	public static final String qrCodeIsValid="true";
	
	public static final String PSTATUS="Cancelled";
	  
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
	
	public static final String DateFormatter="MMMM d, yyyy  hh:mm a ";
	
	public static final String RUPEE_SIGN="&#8377; ";
	
	public static final String ORDER_HEADING="My Orders";
	
	public static final String ORDERDETIAL_HEADING="Order Detail";
	
	public static final String REVIEW="Review";
	
	public static final String RE_ORDER="Re-Order";
	
	public static final String CART_ITEM_PRICE="Price";
	
	public static final String CART_ITEM_QUANTITY="Quantity";
	
	public static final String CART_ITEM_TOTAL="Total";
	
	public static final String CART_SUBTOTAL="SubTotal";
	
	public static final String CART_GRANDTOTAL="GrandTotal";
	
	/* .......Server Side Error Msgs........ */
	
	public static final String WRONG_EMAIL_PASSWORD=" Your login attempt was not successful due to Bad Credential";
	
	public static final String LOGOUT=" You've been logged out successfully";
	
	public static final String CART_UPDATE="cart updated";
	
	public static final String CART_PRODUCT_ADD="Product Added Inside a Cart";
	
	public static final String headeblurimage="url('images/Blur.png')";
	public static final String classvalue ="hero flex items-center";
	public static final String animateimage="vegies.png";
	public static final String creditwalletAmount="Money Has Been Credit In Your Account";

	/* ..... Clint Side ErrorMasg ..... */
	
	
	
	
	
	
}
