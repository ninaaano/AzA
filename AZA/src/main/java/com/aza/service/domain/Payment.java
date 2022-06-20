package com.aza.service.domain;

public class Payment {
	
	private int payCode; // 
	private int studentRecordNo; // 
	private char checkPay; //
	private int amount; // 
	private String payDay; //
	private String payer; // 
	private String payDueDate; // 
	private String impUid; // 
	private String merchantUid; // 
	private int payOption; // 
	private String receiver; // 
	private String studentId; // 
	private String studentName; // 
	
	private Lesson payLessonName; // 
	
	public Payment() {
		
	}

	public Lesson getPayLessonName() {
		return payLessonName;
	}



	public void setPayLessonName(Lesson payLessonName) {
		this.payLessonName = payLessonName;
	}



	public String getImp_key() {
		return imp_key;
	}

	public void setImp_key(String imp_key) {
		this.imp_key = imp_key;
	}

	public String getImp_secret() {
		return imp_secret;
	}

	public void setImp_secret(String imp_secret) {
		this.imp_secret = imp_secret;
	}

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
				+ receiver + ", studentId=" + studentId + ", studentName=" + studentName + ", payLessonName=" + payLessonName
				+ ", imp_key=" + imp_key + ", imp_secret=" + imp_secret + "]";
	}

	
	
	

}
