/**
 * 
 */
package com.veggiefridge.online.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.constants.VFOnlineConstants;

/**
 * @author Akshay N Wakudkar
 *
 */
@Controller
public class EmailController {
	
	private static final Logger logger = Logger.getLogger(KioskController.class);

	public EmailController() {
		System.out.println("EmailController.EmailController()");
	}
	
	 static String emailToRecipient; // emailSubject, emailMessage;
	    static String emailfromrecipient = VFOnlineConstants.MAIL_EMAILFROMRECIPIENT; //"akshayastar72@gmail.com";
	 
	    static String emailsubject = VFOnlineConstants.MAIL_EMAILSUBJECT;
	    		
	    static String emailmessage = VFOnlineConstants.MAIL_EMAILMESSAGE;
	    static ModelAndView modelViewObj;
	 
	    @Autowired
	    private JavaMailSender mailSenderObj;
	 
//	    @RequestMapping(value = {"/", "emailForm"}, method = RequestMethod.GET)
//	    public ModelAndView showEmailForm(ModelMap model) {
//	        modelViewObj = new ModelAndView("emailForm");
//	        return  modelViewObj;       
//	    }
//	 
	    // This Method Is Used To Prepare The Email Message And Send It To The Client
	    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
	    public ModelAndView sendEmailToClient(HttpServletRequest request, final @RequestParam CommonsMultipartFile attachFileObj) {
	 
	        // Reading Email Form Input Parameters      
	        emailsubject = request.getParameter("subject");
	        emailmessage = request.getParameter("message");
	        emailToRecipient = request.getParameter("mailTo");
	 
	        // Logging The Email Form Parameters For Debugging Purpose
	        System.out.println("\nReceipient?= " + emailToRecipient + ", subject?= " + emailsubject + ", message?= " + emailmessage + "\n");
	 
	        mailSenderObj.send(new MimeMessagePreparator() {
	            public void prepare(MimeMessage mimeMessage) throws Exception {
	 
	                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");             
	                mimeMsgHelperObj.setTo(emailToRecipient);
	                mimeMsgHelperObj.setFrom(emailfromrecipient);               
	                mimeMsgHelperObj.setText(emailmessage);
	                mimeMsgHelperObj.setSubject(emailsubject);
	 
	                // Determine If There Is An File Upload. If Yes, Attach It To The Client Email              
	                if ((attachFileObj != null) && (attachFileObj.getSize() > 0) && (!attachFileObj.equals(""))) {
	                    System.out.println("\nAttachment Name?= " + attachFileObj.getOriginalFilename() + "\n");
	                    mimeMsgHelperObj.addAttachment(attachFileObj.getOriginalFilename(), new InputStreamSource() {                   
	                        public InputStream getInputStream() throws IOException {
	                            return attachFileObj.getInputStream();
	                        }
	                    });
	                } else {
	                    System.out.println("\nNo Attachment Is Selected By The User. Sending Text Email!\n");
	                }
	            }
	        });
	        System.out.println("\nMessage Send Successfully.... Hurrey!\n");
	 
	        modelViewObj = new ModelAndView("success","messageObj","Thank You! Your Email Has Been Sent!");
	        return  modelViewObj;   
	    }
	}

