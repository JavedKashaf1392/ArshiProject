package com.veggiefridge.online.dao;

import java.util.List;

import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.model.WalletPayment;

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
		 return (Wallet) sessionFactory.getCurrentSession().get(Wallet.class, walletID);
	}

	
	    @Override
	    public Wallet fetchWallet(int customerid) {
		//return (Wallet) sessionFactory.getCurrentSession().get(Wallet.class,customerid);
		String query = "FROM Wallet WHERE customer.customerid =:customerid";
		return (Wallet) sessionFactory.getCurrentSession()
				.createQuery(query)
					.setParameter("customerid", customerid).uniqueResult();
	}

		@Override
		public List<WalletPayment> listWalletPayment() {
		return sessionFactory.getCurrentSession().createQuery("from WalletPayment").list();
		}

		
		
		@Override
		public boolean addWalletPayment(WalletPayment walletpayment) {
			try {			
				sessionFactory.getCurrentSession().persist(walletpayment);			
				return true;
			}
			catch(Exception ex) {
				return false;
			}
			
		}

		
		@Override
		public List<WalletPayment> listWalletPayment(int walletID) {
			String query = "FROM WalletPayment WHERE wallet.walletID=:walletID";
			return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("walletID",walletID)
											.list();
		}
		
		}


