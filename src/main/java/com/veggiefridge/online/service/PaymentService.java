package com.veggiefridge.online.service;

import com.veggiefridge.online.model.PGResponse;
import com.veggiefridge.online.model.Payment;


public interface PaymentService {
	
	 public boolean savePayment(Payment payment);
	 
	 public boolean savePayment(PGResponse pgresponse);

}
