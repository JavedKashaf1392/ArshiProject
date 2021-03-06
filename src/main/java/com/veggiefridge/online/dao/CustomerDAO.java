package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.Customer;

    public interface CustomerDAO{

    public List<Customer> getAllCustomers();

	public void addCustomer(Customer customer);
	
	public Customer updateCustomer(Customer customer);
	
	public Customer getCustomer(int customerid);
	
	public void deleteCustomer(Integer customerId);
	
	public Customer loginCustomer(Customer customer);
	
    public Customer getCustomerByEmail(String email);
	
	public Customer getCustomerByMobile(long mobile);

	
	/*public User findAccount(String email); */
	}
