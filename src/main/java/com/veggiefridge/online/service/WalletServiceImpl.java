package com.veggiefridge.online.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veggiefridge.online.dao.WalletDAO;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.model.WalletPayment;

@Service
@Transactional
public class WalletServiceImpl implements WalletService {
	
	@Autowired
	private WalletDAO walletdao;

	@Override
	public boolean addRefundMoney(Wallet wallet) {
		return walletdao.addRefundMoney(wallet);
	}

	@Override
	public Wallet updateWallet(Wallet wallet) {
		return walletdao.updateWallet(wallet);
	}

	@Override
	public Wallet getWallet(int walletID) {
		return walletdao.getWallet(walletID);
	}
    
	@Override
	public Wallet fetchWallet(int customerid) {
		return walletdao.fetchWallet(customerid);
	}
    
	@Override
	public List<WalletPayment> listWalletPayment(){
		return walletdao.listWalletPayment();
	}

	@Override
	public boolean addWalletPayment(WalletPayment walletpayment) {
		return walletdao.addWalletPayment(walletpayment);
	}

	@Override
	public List<WalletPayment> listWalletPayment(int walletID) {
		return walletdao.listWalletPayment(walletID);
	}

}
