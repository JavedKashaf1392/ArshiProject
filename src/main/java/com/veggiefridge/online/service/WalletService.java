package com.veggiefridge.online.service;

import com.veggiefridge.online.model.Wallet;

public interface WalletService {
	
	  public boolean addRefundMoney(Wallet wallet);
	
	 public Wallet updateWallet(Wallet wallet);

    public Wallet getWallet(int walletID); 
    
    public Wallet fetchWallet(int customerid);

}
