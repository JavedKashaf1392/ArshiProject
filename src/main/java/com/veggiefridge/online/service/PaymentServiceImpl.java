package com.veggiefridge.online.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veggiefridge.online.dao.PaymentDAO;
import com.veggiefridge.online.model.Payment;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO paymentdao;

	@Override
	public boolean savePayment(Payment payment) {
		return paymentdao.savePayment(payment);
	}
	
	

}
