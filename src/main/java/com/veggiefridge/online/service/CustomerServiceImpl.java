package com.veggiefridge.online.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veggiefridge.online.dao.CustomerDAO;
import com.veggiefridge.online.model.Customer;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;

	@Override
	@Transactional
	public List<Customer> getAllCustomers() {
		return customerDAO.getAllCustomers();
	}

	@Override
	@Transactional
	public void addCustomer(Customer customer) {
		customerDAO.addCustomer(customer);
	}

	@Override
	public Customer getCustomer(int customerid) {
		return customerDAO.getCustomer(customerid);
	}
	
	 public void setCustomerDAO(CustomerDAO customerDAO) { 
		  this.customerDAO = customerDAO;
		  }

	@Override
	public Customer updateCustomer(Customer customer) {
		 return customerDAO.updateCustomer(customer);
	}

	@Override
	@Transactional
	public void deleteCustomer(Integer customerId) {
//		return customerDAO.getCustomer(customerId);
//		 customerDAO.getCustomer(customerId);
		 customerDAO.deleteCustomer(customerId);
	}

//	@Override
//	public void deleteCustomer(Integer customerId) {
//		 return customerDAO.getCustomer(customerid);
//		
//	}

}
