package com.veggiefridge.online.dao;

import com.veggiefridge.online.model.OrderItemDetails;
import com.veggiefridge.online.model.QRCode;

public interface QRCodeDAO {
	
	 public void insertCustomerqr(QRCode customerqr);
	 
	 public QRCode getCustomerqr(String id);
	 
	 public void generate_qr(String image_name,String qrCodeData);
	 
	 public boolean saveOrder(QRCode qrcode);
	 
}
