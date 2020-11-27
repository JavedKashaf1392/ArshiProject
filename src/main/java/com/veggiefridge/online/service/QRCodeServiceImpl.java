package com.veggiefridge.online.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.QRCodeDAO;
import com.veggiefridge.online.model.QrCode;

@Service
@Transactional
public class QRCodeServiceImpl implements QRCodeService {
	
	@Autowired
	private QRCodeDAO qrCodeDAO;
	
	@Override
	@Transactional
	public void insertCustomerqr(QrCode customerqr) {
		qrCodeDAO.insertCustomerqr(customerqr);
	}

	@Override
	@Transactional
	public QrCode getCustomerqr(String id) {
		return qrCodeDAO.getCustomerqr(id);
	}

	@Override
	@Transactional
	public void generate_qr(String image_name, String qrCodeData) {
		qrCodeDAO.generate_qr(image_name, qrCodeData);
	}

	@Override
	public boolean saveOrder(QrCode qrcode) {
		return qrCodeDAO.saveOrder(qrcode);
	}

}
