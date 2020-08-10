package com.veggiefridge.online.service;

import java.util.List;

import com.veggiefridge.online.model.Customer;

public interface CustomerService {
	
	public List<Customer> getAllCustomers();
	
	public void addCustomer(Customer customer);
	
	public Customer getCustomer(int customerid);
	
	public Customer updateCustomer(Customer customer);
	
	public void deleteCustomer(Integer customerId);
	
	public Customer loginCustomer(Customer customer);

}
