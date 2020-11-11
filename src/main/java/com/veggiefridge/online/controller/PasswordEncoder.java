package com.veggiefridge.online.controller;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Encoder;

import org.springframework.stereotype.Component;

@Component
public class PasswordEncoder {
	
	public static void main(String[] args) {
		String password=PasswordEncoder.sha256("arshi");
		System.out.println("sha256 method password ="+password);
		    
		    }
		
	

		
		    
			
			/*
			 * public static String encrytedData(String txt) throws Exception{ MessageDigest
			 * md= MessageDigest.getInstance("SHA-256"); md.reset();
			 * 
			 * md.update(txt.getBytes());
			 * 
			 * byte[] digest= md.digest(); System.out.println("Digest Text::"+new
			 * 
			 * String(digest));
			 * 
			 * Encoder encoder=Base64.getEncoder(); byte[]
			 * encoderDigestPasswrod=encoder.encode(digest);
			 * System.out.println("Encoder DigistPwd::"+new String(encoderDigestPasswrod));
			 * 
			 * return new String(encoderDigestPasswrod);
			 * 
			 * }
			 */
			
			 
	
	public static String sha256(String base) {
	    try{
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	        byte[] hash = digest.digest(base.getBytes("UTF-8"));
	        StringBuffer hexString = new StringBuffer();

	        for (int i = 0; i < hash.length; i++) {
	            String hex = Integer.toHexString(0xff & hash[i]);
	            if(hex.length() == 1) hexString.append('0');
	            hexString.append(hex);
	            
	        }

	        return hexString.toString();
	        
	    } catch(Exception ex){
	       throw new RuntimeException(ex);
	    }
	}
	}


