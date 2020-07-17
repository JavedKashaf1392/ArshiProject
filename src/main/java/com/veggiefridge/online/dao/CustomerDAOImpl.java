package com.veggiefridge.online.dao;

import java.util.List;

import javax.transaction.Transaction;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mysql.cj.Session;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;

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
		return (Customer) sessionFactory.getCurrentSession().get(Customer.class, customerid);
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
		Customer customer =(Customer) sessionFactory.getCurrentSession().load(Customer.class, customerId);
		  if (null !=customer) {
		  this.sessionFactory.getCurrentSession().delete(customer); 
		  }
		
	}

	@Override
	public Customer loginCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	
	/*
	 * @Override public User findAccount(String userName ) { Session session=
	 * (Session) sessionFactory.getCurrentSession(); Criteria crit = ((Criteria)
	 * session).createCriteria(User.class); crit.add(Restrictions.eq("userName",
	 * userName)); return (User) crit.uniqueResult(); }
	 */
}	



