package com.aza.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentDao;
import com.aza.service.payment.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	@Qualifier("paymentDaoImpl")
	private PaymentDao paymentDao;
	
	public void setPaymentDao(PaymentDao paymentDao) {
		this.paymentDao = paymentDao;
	}
	
	public PaymentServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public Payment getPayment(int payCode) throws Exception {
		// TODO Auto-generated method stub
		return paymentDao.getPayment(payCode);
	}

	@Override
	public void updatePayment(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		paymentDao.updatePayment(payment);
	}

	@Override
	public void addPayment(Payment payment) throws Exception {
		// TODO Auto-generated method stub
		paymentDao.addPayment(payment);
	}
	
	@Override
	public void deletePayment(int payCode) throws Exception {
		// TODO Auto-generated method stub
		paymentDao.deletePayment(payCode);
		
	}
	
	
	@Override
	public Map<String, Object> listPayment(Search search) throws Exception {
		List<Payment> list = paymentDao.listPayment(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}





}
