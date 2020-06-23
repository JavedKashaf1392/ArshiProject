package com.veggiefridge.online.service;

import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;

public interface LoginService {
	Customer validateCustomer(User user);

}
