/**
 * 
 */
package com.veggiefridge.online.config;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author Akshay N Wakudkar
 *
 */
public class SMSConfiguration {
	
	public void SendSMS() {
		
		try {
			  // construct data
			String apiKey = "apikey=" + "y91y/WBUY+k-I9eap8G39CfNZm1GkaIAz7xSapWDgI";
			String message = "&message=" + "VeggieFridge sends you reset password link given below: ";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "917020385462";
			
			//send data
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			System.out.println(stringBuffer.toString());
					
		}catch (Exception e) {}
		
	}

}
