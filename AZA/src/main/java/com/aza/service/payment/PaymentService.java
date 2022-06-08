package com.aza.service.payment;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Payment;

public interface PaymentService {
	// SELECT
	public Payment getPayment(int payCode) throws Exception;
	
	// UPDATE
	public void updatePayment(Payment payment) throws Exception;
	
	// ADD
	public void addPayment(Payment payment) throws Exception;
	
	// DELETE
	public void deletePayment(int payCode) throws Exception;
	
	// LIST
	public Map<String, Object> listPayment(Search search) throws Exception;
	
	public void requestPay(String impUid) throws Exception;
	
	// 자동 add
	public void addPaymentProcedure() throws Exception;
	
	//아임포트..
	public String getToken() throws IOException;
	
	public int paymentInfo(String imp_uid, String access_token);
	
	public void payMentCancle(String access_token, String imp_uid, String amount, String reason);
}
