package com.veggiefridge.online.controller;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class PwdEncryptAndDecryptWithAES {
		private static final String SECRET_KEY = "abc123xyz123abcd";
		private static final String INIT_VECTOR = "abc123xyz123abcd";

		public static String encryptMsg(String msg) throws Exception {
			IvParameterSpec ivParamSpec = new IvParameterSpec(INIT_VECTOR.getBytes());
			SecretKeySpec secretKeySpec = new SecretKeySpec(SECRET_KEY.getBytes("UTF-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");

			cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParamSpec);

			byte[] encrypted = cipher.doFinal(msg.getBytes());

			return Base64.getEncoder().encodeToString(encrypted);

		}
		
		
		public static String decryptMsg(String msg) throws Exception {
			IvParameterSpec ivParamSpec = new IvParameterSpec(INIT_VECTOR.getBytes());

			SecretKeySpec secretKeySpec = new SecretKeySpec(SECRET_KEY.getBytes("UTF-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");

			cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParamSpec);

			byte[] decodedMsg = Base64.getDecoder().decode(msg);

			byte[] decrypted = cipher.doFinal(decodedMsg);

			return new String(decrypted);

		}

		
		public static void main(String[] args) throws Exception {
			
			String originalMsg = "arshi";
			System.out.println("Original Msg :: " + originalMsg);
			
			String encryptedEncodedMsg = PwdEncryptAndDecryptWithAES.encryptMsg(originalMsg);
			System.out.println("Encrypted + Encoded Msg :: " + encryptedEncodedMsg);

			String decryptedMsg = PwdEncryptAndDecryptWithAES.decryptMsg(encryptedEncodedMsg);
			System.out.println("Decrypted Msg :: " + decryptedMsg);

		}


	}


