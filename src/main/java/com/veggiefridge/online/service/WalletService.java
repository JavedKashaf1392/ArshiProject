package com.veggiefridge.online.service;

import java.util.List;

import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.model.WalletPayment;

public interface WalletService {
	
	  public boolean addRefundMoney(Wallet wallet);
	
	 public Wallet updateWallet(Wallet wallet);

    public Wallet getWallet(int walletID); 
    
    public Wallet fetchWallet(int customerid);
    
    public List<WalletPayment> listWalletPayment();
    
    public boolean addWalletPayment(WalletPayment walletpayment);
    
    public List<WalletPayment> listWalletPayment(int walletID);

}
