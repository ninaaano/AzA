package com.aza.service.payment;

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

}
