package com.veggiefridge.online.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
    //addKiosk
	

	@Override
	public Customer validateCustomer(User user) {
			return(Customer) sessionFactory.getCurrentSession().createQuery("from Customer where EmailId='" + user.getEmailId() + "' and password='" + user.getPassword()+ "'").list();	
		   
		}
	    
	}



