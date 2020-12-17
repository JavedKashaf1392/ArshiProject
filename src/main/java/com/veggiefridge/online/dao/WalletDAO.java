package com.veggiefridge.online.dao;

import com.veggiefridge.online.model.Wallet;

public interface WalletDAO {
	
	 public boolean addRefundMoney(Wallet wallet);
	 
	 public Wallet updateWallet(Wallet wallet);

     public Wallet getWallet(int walletID); 

}
