/**
 * 
 */
package com.veggiefridge.online.config;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.veggiefridge.online.constants.VFOnlineConstants;

/**
 * @author Akshay N Wakudkar
 *
 */

public class SMSConfiguration {
	
	public void SendSMS(String numbers) {
		
		try {
			  // construct data
			String apiKey = VFOnlineConstants.SMS_APIKEY;
			String message = VFOnlineConstants.SMS_MESSAGE;
			String sender = VFOnlineConstants.SMS_CODE;
		    numbers = "&numbers=" + "917020385462";
		    
		    //send data
			HttpURLConnection conn = (HttpURLConnection) new URL(VFOnlineConstants.SMS_URL).openConnection();
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
