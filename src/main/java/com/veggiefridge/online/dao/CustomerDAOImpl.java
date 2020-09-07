package com.veggiefridge.online.dao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.loader.custom.Return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//get all customers
	@Override
	@SuppressWarnings("unchecked")
	public List<Customer> getAllCustomers() {
		return sessionFactory.getCurrentSession().createQuery("from Customer").list(); 
	}

     //add customer
	@Override
	public void addCustomer(Customer customer) {
	Session session=sessionFactory.openSession();	
	Transaction tx= session.beginTransaction();
	if(customer!=null) {
		try {
			session.save(customer);
			tx.commit();
			session.close();
		}
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
	}
	
	//sessionFactory.getCurrentSession().saveOrUpdate(customer);
	}
 
    //get customer
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
		Session session=sessionFactory.openSession();	
		Transaction tx= session.beginTransaction();
	    String hql="from com.veggiefridge.online.model.Customer as customer where customer.email=?and customer.password=?";	
	   
	    try{
	    	Query query=session.createQuery(hql);
			query.setParameter(0,customer.getEmail());
			query.setParameter(1,customer.getPassword());
		    customer=(Customer) query.uniqueResult();
		    tx.commit();
		    session.close();
		}
	    
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return customer;
	}

	
	//get Customer by email
	@Override
	public Customer getCustomerByEmail(String email) {
		Customer customer = new Customer();
		Session session=sessionFactory.openSession();	
		Transaction tx= session.beginTransaction();
	    String hql="from com.veggiefridge.online.model.Customer as customer where customer.email=?";	
		try {
			Query query=session.createQuery(hql);
			query.setParameter(0,email);
		    customer=(Customer) query.uniqueResult();
		    tx.commit();
		    session.close();
		}
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return customer;
		}
	
	//get Customer by mobile
	@Override
	public Customer getCustomerByMobile(long mobile) {
		Customer customer = new Customer();
		Session session=sessionFactory.openSession();	
		Transaction tx= session.beginTransaction();
	    String hql="from com.veggiefridge.online.model.Customer as customer where customer.mobile=?";	
		try {
			Query query=session.createQuery(hql);
			query.setParameter(0,mobile);
		    customer=(Customer) query.uniqueResult();
		    tx.commit();
		    session.close();
		}
		catch (Exception e) {
			tx.rollback();
			session.close();
			e.printStackTrace();
		}
		return customer;
		}
	}
	
	
	
	



