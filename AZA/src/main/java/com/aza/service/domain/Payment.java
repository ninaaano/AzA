package com.aza.service.domain;

public class Payment {
	
	private int payCode; // 수납코드
	private int studentRecordNo; // 학생기록부 번호
	private char checkPay; // 수납여부
	private int amount; // 결제 금액
	private String payDay; // 수납일
	private String payer; // 결제자
	private String payDueDate; // 수납예정일
	private String impUid; // 아임포트 id
	private String merchantUid; // 아임포트 번호
	private int payOption; // 결제수단
	private String receiver; // 결제받는 사람
	private String studentId; // 수납 대상자(?) ID
	private String studentName; // 수납 대상자 이름
	
	private String imp_key;
	private String imp_secret;
	
	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public Payment() {
		
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getStudentRecordNo() {
		return studentRecordNo;
	}

	public void setStudentRecordNo(int studentRecordNo) {
		this.studentRecordNo = studentRecordNo;
	}

	public char getCheckPay() {
		return checkPay;
	}

	public void setCheckPay(char checkPay) {
		this.checkPay = checkPay;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPayDay() {
		return payDay;
	}

	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
	}

	public String getPayDueDate() {
		return payDueDate;
	}

	public void setPayDueDate(String payDueDate) {
		this.payDueDate = payDueDate;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	
	public int getPayOption() {
		return payOption;
	}

	public void setPayOption(int payOption) {
		this.payOption = payOption;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Payment [payCode=" + payCode + ", studentRecordNo=" + studentRecordNo + ", checkPay=" + checkPay
				+ ", amount=" + amount + ", payDay=" + payDay + ", payer=" + payer + ", payDueDate=" + payDueDate
				+ ", impUid=" + impUid + ", merchantUid=" + merchantUid + ", payOption=" + payOption + ", receiver="
				+ receiver + "]";
	}
	
	

}
