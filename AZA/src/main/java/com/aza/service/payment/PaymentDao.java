package com.aza.service.payment;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.Payment;

public interface PaymentDao {
	
	// SELECT
	public Payment getPayment(int payCode) throws Exception;
	
	// UPDATE
	public void updatePayment(Payment payment) throws Exception;
	
	// ADD
	public void addPayment(Payment payment) throws Exception;
	
	// LIST
	public List<Payment> listPayment(Search search) throws Exception;
	
	// 자동 add
	public void addPaymentProcedure(Payment payment) throws Exception;
	
	// totalCount
	public void totalPaymentCount(Search search) throws Exception;
	
}
