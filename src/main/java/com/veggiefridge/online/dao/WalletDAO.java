package com.veggiefridge.online.dao;

import java.util.List;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.Wallet;
import com.veggiefridge.online.model.WalletPayment;

public interface WalletDAO {
	
	 public boolean addRefundMoney(Wallet wallet);
	 
	 public Wallet updateWallet(Wallet wallet);

     public Wallet getWallet(int walletID);
     
     public Wallet fetchWallet(int customerid);
     
     public List<WalletPayment> listWalletPayment();
     
     public boolean addWalletPayment(WalletPayment walletpayment);
     
     public List<WalletPayment> listWalletPayment(int walletID);
   
}
