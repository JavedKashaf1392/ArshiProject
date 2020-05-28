package com.veggiefridge.online.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.veggiefridge.online.model.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;

//	get all customers
	@Override
	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomers() {
		return sessionFactory.getCurrentSession().createQuery("from Customer") .list(); 
	}

//	add customer
	@Override
	public void addCustomer(Customer customer) {
		sessionFactory.getCurrentSession().saveOrUpdate(customer);
	}

//	get customer
	@Override
	public Customer getCustomer(int customerid) {
		return (Customer) sessionFactory.getCurrentSession().get( Customer.class, customerid);
	}

//	update customer
	@Override
	public Customer updateCustomer(Customer customer) {
		sessionFactory.getCurrentSession().update(customer); 
		return customer;
	}

//	delete customer
	@Override
	public void deleteCustomer(Integer customerId) {
		Customer customer =(Customer) sessionFactory.getCurrentSession().load( Customer.class, customerId);
		  if (null !=customer) {
		  this.sessionFactory.getCurrentSession().delete(customer); 
		  }
		
	}

}	



