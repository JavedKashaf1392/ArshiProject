package com.veggiefridge.online.dao;

import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.Wallet;

@Repository
@Transactional
public class WalletDAOImpl implements WalletDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addRefundMoney(Wallet wallet) {
		try {			
			sessionFactory.getCurrentSession().persist(wallet);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public Wallet updateWallet(Wallet wallet) {
		sessionFactory.getCurrentSession().update(wallet); 
		return wallet;
	}

	@Override
	public Wallet getWallet(int walletID) {
		 return (Wallet) sessionFactory.getCurrentSession().get(Product.class, walletID);
	}

}
