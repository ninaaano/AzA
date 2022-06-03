package com.aza.service.payment;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.Payment;

public interface PaymentService {
	// SELECT
	public Payment getPayment(int payCode) throws Exception;
	
	// UPDATE
	public void updatePayment(Payment payment) throws Exception;
	
	// ADD
	public void addPayment(Payment payment) throws Exception;
	
	// LIST
	public List<Payment> listPayment(Search search) throws Exception;

}
