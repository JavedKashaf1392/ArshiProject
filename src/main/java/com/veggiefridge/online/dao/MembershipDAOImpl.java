package com.veggiefridge.online.dao;
import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.MembershipWallet;

@Repository
@Transactional
public class MembershipDAOImpl implements MembershipDAO{
      
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	@Override
	public boolean add(MembershipWallet msw) {
		
		try {
			sessionFactory.getCurrentSession().persist(msw);
			System.out.println("add MembershipWallet method is running");
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	@Transactional
	@Override
	public MembershipWallet getByCustomer(int customerid) {
		String query ="FROM MembershipWallet WHERE customer.customerid =:customerid";
		try {
			System.out.println("getByCustomer");
			return (MembershipWallet) sessionFactory.getCurrentSession().createQuery(query).
					setParameter("customerid", customerid).uniqueResult();
		
		}catch(Exception ex) {
			return null;
				
		}
	}

	@Transactional
	@Override
	public MembershipWallet get(int MembershipID) {
		return (MembershipWallet) sessionFactory.getCurrentSession().get(MembershipWallet.class,MembershipID);
	}

	
}
