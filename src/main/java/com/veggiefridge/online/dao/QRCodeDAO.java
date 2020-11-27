package com.veggiefridge.online.dao;

import com.veggiefridge.online.model.QrCode;

public interface QRCodeDAO {
	
	 public void insertCustomerqr(QrCode customerqr);
	 
	 public QrCode getCustomerqr(String id);
	 
	 public void generate_qr(String image_name,String qrCodeData);
	 
	 public boolean saveOrder(QrCode qrcode);
	 
}
