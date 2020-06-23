package com.veggiefridge.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veggiefridge.online.dao.KioskDAO;
import com.veggiefridge.online.dao.LoginDAO;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.User;

@Service
public class LoginServiceImpl implements LoginService {
	
	
	@Autowired
	private  LoginDAO dao;

	@Override
	public Customer validateCustomer(User user) {
		return dao.validateCustomer(user);
	}

	
}
