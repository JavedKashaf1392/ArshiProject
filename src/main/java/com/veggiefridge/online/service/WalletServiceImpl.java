package com.veggiefridge.online.service;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veggiefridge.online.dao.WalletDAO;
import com.veggiefridge.online.model.Wallet;

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

}
