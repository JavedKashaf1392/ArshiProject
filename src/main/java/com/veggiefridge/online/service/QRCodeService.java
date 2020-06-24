package com.veggiefridge.online.service;

import com.veggiefridge.online.model.QRCode;

public interface QRCodeService {
	
	 public void insertCustomerqr(QRCode customerqr);
	 
	 public QRCode getCustomerqr(String id);
	 
	 public void generate_qr(String image_name,String qrCodeData) ;

}
