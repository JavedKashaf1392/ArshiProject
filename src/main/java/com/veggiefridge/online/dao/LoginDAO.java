package com.veggiefridge.online.dao;

import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;

public interface LoginDAO {
	
	 Customer validateCustomer(User user);

}
