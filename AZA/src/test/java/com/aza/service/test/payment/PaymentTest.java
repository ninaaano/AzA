package com.aza.service.test.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.payment.PaymentService;

@SpringBootTest
public class PaymentTest {
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService payment;
	

}
