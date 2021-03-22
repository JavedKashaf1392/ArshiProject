package com.veggiefridge.online.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.MailService;

@Controller
@RequestMapping(value ="/forgot")
public class ForgotPasswordController {

	@Autowired
	private MailService mailService;

	@Autowired
	private CustomerService customerservice;

	@Autowired
	private JavaMailSender mailSenderObj;
	
	@Autowired
	private EncryptPassword enPwd;
	
	
	public void setMailSenderObj(JavaMailSender mailSenderObj) {
		this.mailSenderObj = mailSenderObj;
	}
	
	
	     //Enter email for Forgot password
		@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
		public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
			ModelAndView mav = new ModelAndView("forgotPassword");
			return mav;
		}

	 //ResetPassword
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String resetRequest(@RequestParam(value = "email") String email, HttpServletRequest request) {
		email = request.getParameter("email");
		Customer customer = new Customer();
		
		if (!email.isEmpty()) {
			customer = customerservice.getCustomerByEmail(email);

			mailService.sendMail(email);
		}
		return "checkMail";
	}

	@RequestMapping(value = "/newPassword/{email}")
	public String resetPassword(@PathVariable String email, Model model)
	{
		 //check if the email id is valid and registered with us.
		Customer customer = new Customer();
		customer.setEmail(email);
		model.addAttribute("customer", customer);
		return "changePassword";
	}

	 //forPassword
	@RequestMapping(value = "/sendMail")
	public String forPassword(HttpServletRequest request) throws MessagingException {
		Customer customer = new Customer();
		String email = request.getParameter("email");
		if (!email.isEmpty()) {
			customer = customerservice.getCustomerByEmail(email);
			if (customer != null) {
				// print a simple debug info
				System.out.println("Your email Is" + email);
				MimeMessage mimeMessage = mailSenderObj.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
				// mimeMessage.setContent(htmlMsg, "text/html"); /** Use this or below line **/
				helper.setText("<html>\r\n" + "<head>\r\n"
						+ "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css\">\r\n"
						+ "</head>\r\n" + "<body style=\"font-family: Arial, Helvetica, sans-serif;\r\n"
						+ " background-color:#f1f1f1;\">\r\n" + "\r\n"
						+ "<div  class=\"modal\" style=\" display:block;\r\n" + "  position: relative;\r\n"
						+ "  left: 50;\r\n" + "  top: 50;\r\n" + "  width:10%;\r\n"
						+ "  height: 70%;                     \r\n" + "  margin-top: 50%;\r\n"
						+ "  margin-left:30%;\">\r\n" + "         \r\n"
						+ "     <form class=\"modal-content animate\"  style=\" background-color: #fefefe;\r\n"
						+ "  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */\r\n"
						+ "  border: 1px solid #888;\r\n"
						+ "  width:35%; /* Could be more or less, depending on screen size */\">\r\n" + "     \r\n"
						+ "   <div class=\"imgcontainer\" style=\" text-align: center;\r\n"
						+ "  margin: 24px 0 12px 0;\r\n" + "  position: relative;\">\r\n"
						+ "   <!--  <span onclick=\"document.getElementById('id01').style.display='none'\" class=\"close\" title=\"Close Modal\">&times;</span> -->\r\n"
						+ "   <spring:url value=\"/images\" var=\"images\" />\r\n"
						+ "   <img src=\"${images}/logo.jpg\" width=\"150\" height=\"100\"/>\r\n" + "   </div>\r\n"
						+ "         \r\n"
						+ "    <h6 style=\"color:#4CAF50;font-size:90%; margin-top:2%; text-align:center;\"> Eat Healthy,Drink Healthy </h6>\r\n"
						+ "    <h5>We have received your request for reset password. Follow this link to reset your customer account password at VeggieFridge</h5>     \r\n"
						+ "         \r\n"
						+ "    <div class=\"container\" style=\"text-align: center; padding: 16px;\">    \r\n"
						+ "   <!-- <a href='http://localhost:8080/vf-online/forgot/newPassword"
						+ "		  		email+\"/'>Click here</a> to reset password</body></html>-->\r\n"
						+ "         \r\n" + "         <a href='http://localhost:8080/vf-online/forgot/newPassword/"
						+email + "		  		/' style=\"display: inline-block;\r\n"
						+ "        padding: 10px 40px;\r\n" + "        text-align: center;\r\n"
						+ "        text-decoration: none;\r\n" + "        color: #ffffff;\r\n"
						+ "        background-color:#4CAF50;\r\n" + "        border-radius: 6px;\r\n"
						+ "        outline: none;margin-top:6px;font-size:12px;\">Click here to Reset Your Password</a>\r\n"
						+ "        \r\n" + "    </div>\r\n"
						+ "    <h5 style=\"color: cornflowerblue;\">If this request is not done by you so please ignore the message.</h5>\r\n"
						+ "\r\n" + "    <div class=\"container\" style=\"background-color:#f1f1f1\">\r\n" + "    \r\n"
						+ "    <table style=\"align-content: center;\">\r\n"
						+ "    <h6 style=\"color: black;\">Download the VeggieFridge App</h6>\r\n" + "     <th> \r\n"
						+ "    <a href=\"abc.htm\">                      \r\n"
						+ "    <spring:url value=\"/images\" var=\"images\" />\r\n"
						+ "    <img src=\"${images}/Apple-App-store-icon.png\" width=\"80\" height=\"30\" style=\"float: right; margin-right:7%\"/>\r\n"
						+ "    </a> \r\n" + "    </th>\r\n" + "    <th>\r\n"
						+ "    <a href=\"abc.htm\">                        \r\n"
						+ "    <spring:url value=\"/images\" var=\"images\" />\r\n"
						+ "    <img src=\"${images}/Google-App-store-icon.png\" width=\"80\" height=\"30\" style=\"float: right;\"/>\r\n"
						+ "    </a>      \r\n" + "    </th>\r\n" + "    </table>  \r\n" + "    </div>\r\n"
						+ "                            <div class=\"social\" style=\"align-content: center;margin-left:22%;\"> \r\n"
						+ "                           \r\n"
						+ "                            <a href=\"https://facebook.com/coding.np\"><span class=\"fab fa-facebook-f\" style=\"background-color:#3B5998;color:white; height: 35px;\r\n"
						+ "    width: 35px;\r\n" + "    color:white;\r\n" + "    line-height: 40px;\r\n"
						+ "    text-align: center;\r\n" + "    font-size: 16px;\r\n" + "    border-radius: 50px;\r\n"
						+ "    transition: 0.3s;\"></span></a>\r\n"
						+ "                            <a href=\"#\"><span class=\"fab fa-twitter\" style=\"background-color: #55ACEE;color:white; height: 35px;\r\n"
						+ "    width: 35px;\r\n" + "    color:white;\r\n" + "    line-height: 40px;\r\n"
						+ "    text-align: center;\r\n" + "    font-size: 16px;\r\n" + "    border-radius: 50px;\r\n"
						+ "    transition: 0.3s;\"></span></a>\r\n"
						+ "                            <a href=\"https://instagram.com/coding.np\" ><span class=\"fab fa-instagram\" style=\"background-color: #125688;color:white; height: 35px;\r\n"
						+ "    width: 35px;\r\n" + "    color:white;\r\n" + "    line-height: 40px;\r\n"
						+ "    text-align: center;\r\n" + "    font-size: 16px;\r\n" + "    border-radius: 50px;\r\n"
						+ "    transition: 0.3s;\"></span></a>\r\n"
						+ "                            <a href=\"https://youtube.com/c/codingnepal\"><span class=\"fab fa-linkedin\"  style=\"background-color:  #007bb5;color:white; height: 35px;\r\n"
						+ "    width: 35px;\r\n" + "    color:white;\r\n" + "    line-height: 40px;\r\n"
						+ "    text-align: center;\r\n" + "    font-size: 16px;\r\n" + "    border-radius: 50px;\r\n"
						+ "    transition: 0.3s;\"></span></a>\r\n"
						+ "                            <a href=\"https://youtube.com/c/codingnepal\"><span class=\"fab fa-pinterest\"  style=\"background-color: #bb0000;color:white; height: 35px;\r\n"
						+ "    width: 35px;\r\n" + "    color:white;\r\n" + "    line-height: 40px;\r\n"
						+ "    text-align: center;\r\n" + "    font-size: 16px;\r\n" + "    border-radius: 50px;\r\n"
						+ "    transition: 0.3s;\"></span></a>\r\n"
						+ "                            <p style=\"margin-left:8%\">support@veggiefridge.com</p><p style=\"margin-left:24%\">9823576042</p>\r\n"
						+ "                            </div>\r\n" + "  \r\n"
						+ "<h6 style=\"color:red;\">This is a system generated email, please do not reply</h6>    \r\n"
						+ " \r\n" + "    \r\n" + " </form>\r\n" + " </div>\r\n" + "</body>\r\n" + "</html>"
, true); // Use
				System.out.println("mail..."+email);
				helper.setTo(email);
				System.out.println("mail...+================================="+helper);
				mailSenderObj.send(mimeMessage);
				System.out.println("mailSenderObj+================================="+mailSenderObj);
				System.out.println("message sent succesfully");

			}

			else {
				System.out.println("Invalid Email");
			}

		} 
		return "checkMail";
	}

	
	   //mapping set New Password
	@RequestMapping(value = "/passwordChanged", method = RequestMethod.POST)
	public String setNewPassword(@ModelAttribute("customer") Customer cust, ModelMap map, BindingResult resultcust) {
		Customer customer = customerservice.getCustomerByEmail(cust.getEmail());
		System.out.println("emailId"+customer.getEmail());
		if (customer!= null) {
			// update password and Acct Status $ Displyay Successe Message
			/* customer.setPassword(cust.getNewPassword()); */
			customer.setPassword(EncryptPassword.sha256(cust.getNewPassword()));
			customerservice.updateCustomer(customer);
			System.out.println("update customer successfully");
		}
		return "redirect:/login";
	}
}
