package com.aza.service.test.payment;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentService;

@SpringBootTest
public class PaymentTest {
	
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	//@Test // get test ok
	void testGetPayment() throws Exception {
		
		Payment pay = new Payment();
		
		pay = paymentService.getPayment(1019);
		System.out.println("getPay TEST === >> "+pay);
		
	}
	
	@Test // Add Test ok
	void testAddPayment() throws Exception {
		Payment pay = new Payment();
		pay.setStudentRecordNo(1008);
		pay.setStudentId("student21");
		pay.setAmount(50);
		
		paymentService.addPayment(pay);
		System.out.println(pay);
		
		/* 
		 * student_record_no 
		 * student_id
		 * student_name
		 * amount 
		 * pay_due_date 
		 * */
	}
	//@Test
	void testUpdatePayment() throws Exception {
		
		Payment payment = paymentService.getPayment(1009);
		//payment.setPayCode(1009);
//		System.out.println(payment);
		paymentService.updatePayment(payment);
		assertEquals("Y", payment.getCheckPay());
	}
	
	//@Test //OK
	void testDeletePayment() throws Exception{
		paymentService.deletePayment(1023);
	}
}
