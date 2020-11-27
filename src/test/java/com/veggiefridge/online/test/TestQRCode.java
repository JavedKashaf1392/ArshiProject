package com.veggiefridge.online.test;

import java.sql.SQLException;
import java.util.Date;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.veggiefridge.online.model.QrCode;
import com.veggiefridge.online.service.QRCodeServiceImpl;

class TestQRCode {
	
	private static QRCodeServiceImpl service= null;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeEach
	void setUp() throws Exception {
		 service = new QRCodeServiceImpl();
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterEach
	void tearDown() throws Exception {
	}
	
	@Test
	final void testInsertCustomer() throws SQLException {
		QrCode customerqr = new QrCode();
		/* customerqr.setId("4"); */
		/* customerqr.setCustomerid("004"); */
		/*
		 * customerqr.setTransactionid("VF2020JUN"); customerqr.setDate(new Date());
		 * customerqr.setIsValid("2:00");
		 * customerqr.setQrcodestring("www.veggiefridge.com");
		 */
		service.insertCustomerqr(customerqr);
	}

	@Test
	final void testGetCustomerqr() throws SQLException {
		QrCode customerqr = service.getCustomerqr("3");
		System.out.println(customerqr.toString()); 
	}

	@Test
	final static void testGenerate_qr(String image_name,String qrCodeData) throws SQLException {
	   service.generate_qr(image_name, qrCodeData);
//	   System.out.println(customerqr.toString()); 

	}

}
