package com.veggiefridge.online.service;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.veggiefridge.online.dao.CustomerDAO;
import com.veggiefridge.online.model.Customer;

@Service
public class MailServiceImpl implements MailService{
	

	@Autowired
	private CustomerDAO customerDAO;
	
	
	@Autowired
    private JavaMailSender mailSender;
	
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	
	@Override
	public void sendMail(String email) {
		
	    MimeMessage message =  this.mailSender.createMimeMessage();
		MimeMessageHelper mimeHelper;
		try {
			mimeHelper = new MimeMessageHelper(message,true);
			mimeHelper.setTo(email);
			mimeHelper.setFrom("aq570975@gmail.com");
			mimeHelper.setSubject("Password Reset");
			mimeHelper.setText("<html><body>hi,<br/><a href='http://localhost:8080/vf-online/forgot/newPassword/"+email+"/'> Click here</a> to reset password</body></html>",true);
			mailSender.send(message);
		}   
		catch (MessagingException e) {
	    System.out.println("Error Sending email "+ e.getMessage());
		}
	}

	
	
	
}
	


