package com.veggiefridge.online.dao;

import com.veggiefridge.online.model.PGResponse;
import com.veggiefridge.online.model.Payment;

public interface PaymentDAO {
	
	 public boolean savePayment(Payment payment);
	 
	 public boolean savePayment(PGResponse pgresponse);

}
