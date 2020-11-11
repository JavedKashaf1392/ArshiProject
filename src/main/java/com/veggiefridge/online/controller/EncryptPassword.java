package com.veggiefridge.online.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import org.springframework.stereotype.Component;

@Component
public class EncryptPassword {
	    
public static String sha256(String enpassword) {
	
    try{
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
		/* digest.update(enpassword.getBytes()); */
		/* digest.update(salt); */
        byte[] hash = digest.digest(enpassword.getBytes("UTF-8"));
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
    
/*
    private static byte[] getSalt() throws NoSuchAlgorithmException {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }
    
public static void main(String[] args) throws NoSuchAlgorithmException {

    // same salt should be passed
	 byte[] salt = getSalt(); 
    String password1 = sha256("arshi");
    String password2 = sha256("arshi");
    System.out.println(" Password 1 -> " + password1);
    System.out.println(" Password 2 -> " + password2);
    if (password1.equals(password2)) {
        System.out.println("passwords are equal");
    }*/
}

