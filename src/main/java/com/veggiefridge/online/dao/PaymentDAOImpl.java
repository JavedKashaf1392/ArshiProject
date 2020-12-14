package com.veggiefridge.online.dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.veggiefridge.online.model.PGResponse;
import com.veggiefridge.online.model.Payment;
import com.veggiefridge.online.model.QrCode;

@Repository
@Transactional
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean savePayment(Payment payment) {

		try {			
			sessionFactory.getCurrentSession().persist(payment);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public boolean savePayment(PGResponse pgresponse) {

		try {			
			sessionFactory.getCurrentSession().persist(pgresponse);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	
}
