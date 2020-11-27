package com.veggiefridge.online.dao;
import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Membership;

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
	public boolean add(Membership msw) {
		
		try {
			sessionFactory.getCurrentSession().persist(msw);
			System.out.println("add Membership method is running");
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	@Transactional
	@Override
	public Membership getByCustomer(int customerid) {
		String query ="FROM Membership WHERE customer.customerid =:customerid";
		try {
			System.out.println("getByCustomer");
			return (Membership) sessionFactory.getCurrentSession().createQuery(query).
					setParameter("customerid", customerid).uniqueResult();
		
		}catch(Exception ex) {
			return null;
				
		}
	}

	@Transactional
	@Override
	public Membership get(int MembershipID) {
		return (Membership) sessionFactory.getCurrentSession().get(Membership.class,MembershipID);
	}

	
}
