package com.veggiefridge.online.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name ="pgresponse")
public class PGResponse {
	
private static final long serialVersionUID = -3465813074486302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int paymentinfoId;
	
	@JoinColumn(name="bankName")
	private String bankName;
	
	@JoinColumn(name="bankTransactionId")
	private String bankTransactionId;
	
	@JoinColumn(name="currency")
	private String currency;
	
	@JoinColumn(name="gateWayName")
	private String gateWayName;
	
	@JoinColumn(name="mID")
	private String mID;
	
	@JoinColumn(name="orderId")
	private String orderId;
	
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	@JoinColumn(name=" paymentMode")
	private String paymentMode;
	
	@JoinColumn(name="resCode")
	private String resCode;
	
	@JoinColumn(name="resMsg")
	private String resMsg;
	
	@JoinColumn(name="status")
	private String status;
	
	@JoinColumn(name="txnAmount")
	private String txnAmount;
	
	@JoinColumn(name="txnDate")
	private String txnDate;
	
	@JoinColumn(name="txnId")
	private String txnId;

	public int getPaymentinfoId() {
		return paymentinfoId;
	}

	public void setPaymentinfoId(int paymentinfoId) {
		this.paymentinfoId = paymentinfoId;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankTransactionId() {
		return bankTransactionId;
	}

	public void setBankTransactionId(String bankTransactionId) {
		this.bankTransactionId = bankTransactionId;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getGateWayName() {
		return gateWayName;
	}

	public void setGateWayName(String gateWayName) {
		this.gateWayName = gateWayName;
	}

	public String getmID() {
		return mID;
	}

	public void setmID(String mID) {
		this.mID = mID;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getResMsg() {
		return resMsg;
	}

	public void setResMsg(String resMsg) {
		this.resMsg = resMsg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTxnAmount() {
		return txnAmount;
	}

	public void setTxnAmount(String txnAmount) {
		this.txnAmount = txnAmount;
	}

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}

	public String getTxnId() {
		return txnId;
	}

	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}

	
	@Override
	public String toString() {
		return "PGResponse [paymentinfoId=" + paymentinfoId + ", bankName=" + bankName + ", bankTransactionId="
				+ bankTransactionId + ", currency=" + currency + ", gateWayName=" + gateWayName + ", mID=" + mID
				+ ", orderId=" + orderId + ", paymentMode=" + paymentMode + ", resCode=" + resCode + ", resMsg="
				+ resMsg + ", status=" + status + ", txnAmount=" + txnAmount + ", txnDate=" + txnDate + ", txnId="
				+ txnId + "]";
	}
    
}
