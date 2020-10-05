package com.veggiefridge.online.controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.MailService;

@Controller
@RequestMapping(value="/forgot")
public class ForgotPasswordController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private JavaMailSender mailSenderObj;
	
    //ResetPassword
	@RequestMapping(value="/resetPassword" , method=RequestMethod.POST)
	public String resetRequest(@RequestParam(value="email") String email,HttpServletRequest request){
    email = request.getParameter("email");
    Customer customer = new Customer();
		if (!email.isEmpty()) {
		    customer =customerservice.getCustomerByEmail(email);
				
		mailService.sendMail(email);
		}
		return "checkMail";
	}
	
	
	
	//@RequestMapping(value="/newPassword/{email}" )
	//public String resetPassword(@PathVariable String email,Map<String,String> model)
	//{
		 //check if the email id is valid and registered with us.
		//model.put("email", email);
		//return "changePassword";
	//}
	
	
	@RequestMapping(value="/newPassword/{email}")
	public String resetPassword(@PathVariable String email,Model model)
	
	{
		 //check if the email id is valid and registered with us.
		Customer customer=new Customer();
		customer.setEmail(email);
		model.addAttribute("customer", customer);
		return "changePassword";
	}
	

	@RequestMapping(value ="/forgotPassword")
	public Map<String, String> forgotPassword(HttpServletRequest request) {
		Map<String,String> response = new LinkedHashMap<>();
		Customer customer = new Customer();
		String receiverEmail = request.getParameter("receiverEmail");
		String receiverMobile = request.getParameter("receiverMobile");
		String message = "https://www.veggiefridge.com/forgotPassword";
		String subject = "Forgot Password Link";
		
		try{
			if(!receiverEmail.isEmpty()){
		    customer=customerservice.getCustomerByEmail(receiverEmail);
		        if (customer != null){
			    CommonsMultipartFile attachFileObj =null;
					// Logging The Email Form Parameters For Debugging Purpose
					System.out.println("Sending Email to \nReceipient?= " + receiverEmail + ", Subject?= " + subject
					+ ", Message?= " + message + "\n");

					    mailSenderObj.send(new MimeMessagePreparator(){
						public void prepare(MimeMessage mimeMessage) throws MessagingException{
							MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
							mimeMsgHelperObj.setTo(receiverEmail);
							mimeMsgHelperObj.setText(message);
							mimeMsgHelperObj.setSubject(subject);

							//Determine If There Is An File Upload. If Yes, Attach It To The Client Email
							if((attachFileObj != null) && (attachFileObj.getSize() > 0)
									&& (!attachFileObj.equals(""))) {
								System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
								mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(),
										new InputStreamSource() {
											public InputStream getInputStream() throws IOException {
												return attachFileObj.getInputStream();
											}
										});
							} else {
								System.out.println("\nNo Attachment Sending Text Email!\n");
							}
						}
					});

					System.out.println("\nMessage Send Successfully.... Hurrey!\n");
					response.put("result", "true");
					response.put("error", "null");
				} else{
					response.put("result", "false");
					response.put("error", "Invalid User");
				}

			}

			//if (!receiverMobile.isEmpty()) {

				//customer = custservice.getCustomerByMobile(Long.parseLong(receiverMobile));

				//if (customer != null) {
					//System.out.println("Sending SMS to \nReceipient?= " + receiverMobile + ", Subject?= " + subject
							//+ ", Message?= " + message + "\n");
					//SmsSender smsSender = new SmsSender();
					//smsSender.sendSms(receiverMobile, subject + "\n" + message);
					//response.put("result", "true");
					//response.put("error", "null");
				//} else {
					//response.put("result", "false");
					//response.put("error", "Invalid User");
				//}
			//}

			if (receiverMobile == null & receiverEmail == null) {
				response.put("result", "false");
			  response.put("Error", "Provide Valid Email & Number");
			}

		} catch (Exception e) {
			response.put("result", "false");
			response.put("error", e.toString());
		}
		
		return response;
	}
	
	      
	   //forPassword
	@RequestMapping(value ="/forPassword")
	public String forPassword(HttpServletRequest request)throws MessagingException{
    Customer customer=new Customer();
    String email = request.getParameter("email");
   
   if(!email.isEmpty()){
   customer=customerservice.getCustomerByEmail(email);
	if (customer != null){
	//print a simple debug info
	System.out.println("email"+email);
	//create a simple email object
	//SimpleMailMessage smm=new SimpleMailMessage();
    //smm.setTo(email);
	//smm.setSubject("forgotPassword");
	/*
	 * smm.
	 * setText("<html><body>hi,<br/><a href='http://localhost:8080/vf-online/forgot/newPassword/"
	 * +email+"/'>Click here</a> to reset password</body></html>");
	 */
		  MimeMessage mimeMessage = mailSenderObj.createMimeMessage();
		  MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
		  String htmlMsg = "<html><body><img name=\"_1170:827\" src=\"page_001.jpg\" height=\"70\" width=\"27\" border=\"0\" usemap=\"#Map\"></div><h1 style=\"color:green\">VeggieFridge</h1> <h4>Eat Healthy,Drink Healthy</h4></br>hi,Arshi<br/><h3>Subject</h3>: Reset Password</br><h2>We have received your request for reset password. Follow this link to reset your customer account password at VeggieFridge.</h2> <a href='http://localhost:8080/vf-online/forgot/newPassword/"+ 
		  		email+"/'>Click here</a> to reset password</body></html>";
		  
		  //mimeMessage.setContent(htmlMsg, "text/html"); /** Use this or below line **/
		  helper.setText(htmlMsg, true); // Use this or above line.
		  helper.setTo(email);
		  mailSenderObj.send(mimeMessage);
		  System.out.println("message sent succesfully");
	
    }
	
	else{
		System.out.println("Invalid Email");
	}
     
    }
    else {
    	System.out.println("Invalid Email");	
	}
	return "checkMail";	
	}
	
	   //send attachment
	 @RequestMapping(value ="sendMail")
	 public void sendMail(final String from, final String to,final String subject,final String msg) {  
	        try {  
	        MimeMessage message = mailSenderObj.createMimeMessage();  
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);  
	        helper.setFrom("aq570975@gmail.com");  
	        helper.setTo("aq570975@gmail.com");  
	        helper.setSubject("forgot password");  
	        helper.setText("forgotPasswordpage");  
	        // attach the file  
	        FileSystemResource file = new FileSystemResource(new File("vf-online/WEB-INF/pages/footer.jsp"));  
	        helper.addAttachment("forgotpassword", file);//file will be sent by this name  
	        
	        mailSenderObj.send(message);  
	        }catch(MessagingException e){e.printStackTrace();}  
	    }  
	
	 
	  //mapping set New Password
	 @RequestMapping(value ="/passwordChanged", method = RequestMethod.POST)
	 public String setNewPassword(@ModelAttribute("customer")Customer cust, ModelMap map) {
     
     Customer customer=customerservice.getCustomerByEmail(cust.getEmail());
	 if(customer!=null){   	
     
       //update password and Acct Status $ Displyay Successe Message	
    	 
		 customer.setPassword(cust.getNewPassword());
		 customer.setConfirmPassword(cust.getConfirmNewPassword());
         customerservice.updateCustomer(customer);
         System.out.println("update customer successfully");
	 }
	 
     return "redirect:/home/loginform";
	 }
}
   
	
	
	
	
	
	

	


