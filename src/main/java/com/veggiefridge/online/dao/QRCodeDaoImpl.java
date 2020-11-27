package com.veggiefridge.online.dao;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.mysql.cj.xdevapi.Statement;
import com.veggiefridge.online.model.QrCode;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

@Repository
@Transactional
public class QRCodeDaoImpl implements QRCodeDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
//    public void insertCustomerqr(QRCode customerqr) throws SQLException {
//		
//		String sqlString = "insert into customerqr(id,customerid,transactionid,date,isValid,qrcodestring) values(?,?,?,?,?,?)";
//		connection = daoConfig.getConnection();
//		
//		PreparedStatement preparedStatement =connection.prepareStatement(sqlString);
//		preparedStatement.setString(1, customerqr.getId());
//		preparedStatement.setString(2, customerqr.getCustomerid());
//		preparedStatement.setString(3, customerqr.getTransactionid());
//		preparedStatement.setString(4, customerqr.getDate());
//		preparedStatement.setString(5, customerqr.getIsValid());
//		preparedStatement.setString(6, customerqr.getQrcodestring());
//		preparedStatement.executeUpdate();
//		System.out.println("Data inserted");
//	} 
//	
//    public QRCode getCustomerqr(String id) throws SQLException {
//		
//		String sqlString = "Select * from customerqr where id= ?";
//		connection = daoConfig.getConnection();
//		PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
//     	preparedStatement.setString(1, id);
////		preparedStatement= null;
//		ResultSet resultSet = preparedStatement.executeQuery();
//		QRCode customerqr = null;
//		
//		while(resultSet.next()) {
//			
////          Dynamic_QR.generate_qr(rs.getString("id"),rs.getString("customerid"));
//			
//			QRCodeDaoImpl.generate_qr(resultSet.getString("customerid"),resultSet.getString("qrcodestring"));
//			
//			String id1 = resultSet.getString("id");
//			String customerid = resultSet.getString("customerid");
//			String transactionid = resultSet.getString("transactionid");
//			String date = resultSet.getString("date");
//			String isValid = resultSet.getString("isValid");
//			String qrcodestring = resultSet.getString("qrcodestring");
//			
//			customerqr = new QRCode();
//			customerqr.setId(id1);
//			customerqr.setCustomerid(customerid);
//			customerqr.setTransactionid(transactionid);
//			customerqr.setDate(date);
//			customerqr.setIsValid(isValid);
//			customerqr.setQrcodestring(qrcodestring);
//		}
//		return customerqr;
//		}
//	
//	public static void generate_qr(String image_name,String qrCodeData) {
//        try {
//            String filePath = "C:\\Users\\Akshay N Wakudkar\\STS-WORKSPACE 2\\vf-QRCode\\"+image_name+".png";
//            String charset = "UTF-8"; // or "ISO-8859-1"
//            Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
//            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
//            BitMatrix matrix = new MultiFormatWriter().encode(
//                new String(qrCodeData.getBytes(charset), charset),
//                BarcodeFormat.QR_CODE, 200, 200, hintMap);
//            MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
//                .lastIndexOf('.') + 1), new File(filePath));
//            System.out.println("QR Code image created successfully!");
//        } catch (Exception e) {
//            System.err.println(e);
//        }
//	}

	@Override
	public void insertCustomerqr(QrCode customerqr) {

		sessionFactory.getCurrentSession().saveOrUpdate(customerqr);
	}

	@Override
	public QrCode getCustomerqr(String id) {
		
//		while(resultSet.next()) {
//			
//			QRCodeDaoImpl.generate_qr(resultSet.getString("customerid"),resultSet.getString("qrcodestring"));
//		
		return (QrCode) sessionFactory.getCurrentSession().get(QrCode.class, id);
	}

	@Override
	public  void generate_qr(String image_name, String qrCodeData) {

		try {
            String filePath = "C:\\Users\\Akshay N Wakudkar\\sts-4.4.2.RELEASE\\QRCode\\"+image_name+".png";
            String charset = "UTF-8"; // or "ISO-8859-1"
            Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            BitMatrix matrix = new MultiFormatWriter().encode(
                new String(qrCodeData.getBytes(charset), charset),
                BarcodeFormat.QR_CODE, 200, 200, hintMap);
            MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
                .lastIndexOf('.') + 1), new File(filePath));
            System.out.println("QR Code image created successfully!");
        } catch (Exception e) {
            System.err.println(e);
        }
	}

	@Override
	public boolean saveOrder(QrCode qrcode) {
		
		try {			
			sessionFactory.getCurrentSession().persist(qrcode);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}
}
    
