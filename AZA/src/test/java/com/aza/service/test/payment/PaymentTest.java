package com.aza.service.test.payment;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
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
		
		pay = paymentService.getPayment(1026);
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
	//@Test // 용승이가 OK..!! 안되면 용승이탓!
	void testUpdatePayment() throws Exception {
		
		Payment payment = new Payment();//paymentService.getPayment(1021);
		payment.setPayCode(1021);
		payment.setCheckPay('N');
		System.out.println(payment);
		//payment.setPayCode(1009);
//		System.out.println(payment);
		paymentService.updatePayment(payment);
		System.out.println("2===>"+payment);
		assertEquals('N', payment.getCheckPay());
	}
	
	//@Test //OK
	void testDeletePayment() throws Exception{
		paymentService.deletePayment(1023);
	}
	
	//@Test // okok 근데 값이 이게 맞나
	public void testListPayment() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		search.setSearchCondition("2");
		search.setSearchKeyword("N");
	//	search.setSearchStartDate("2022/05/01");
	//	search.setSearchEndDate("2022/05/30");
		
		System.out.println("시작=====================");
		
		Map<String, Object> map = paymentService.listPayment(search);
		System.out.println("수납 map ===> " + map);
		
		List<Object> list = (List<Object>)map.get("list");
		//assertEquals(2,list.size());
		System.out.println("수납 list ===> " + list);
		
		
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("수납 TotalCount ====>> " + totalCount);
		System.out.println("수납 서치 ====>> " + search);
		
	}
	
	// @Test 
	// 수정해서 사용
//	    public void testPaymentByImpUid() {
//	    	
//	        String test_imp_uid = "imp15771574";
//	        try {
//	            IamportResponse<Payment> payment_response = client.paymentByImpUid(test_imp_uid);
//
//	            assertNotNull(payment_response.getResponse());
//	            assertEquals(test_imp_uid, payment_response.getResponse().getImpUid());
//	        } catch (IamportResponseException e) {
//	            System.out.println(e.getMessage());
//
//	            switch (e.getHttpStatusCode()) {
//	                case 401:
//	                    //TODO
//	                    break;
//	                case 500:
//	                    //TODO
//	                    break;
//	            }
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//
//	        String test_imp_uid_cancelled = "imp15771574";
//	        try {
//	            IamportResponse<Payment> cancelled_response = client.paymentByImpUid(test_imp_uid_cancelled);
//
//	            Payment cancelled = cancelled_response.getResponse();
//	            PaymentCancelDetail[] cancelDetail = cancelled.getCancelHistory();
//
//	            assertEquals(cancelDetail.length, 1);
//	            assertNotNull(cancelDetail[0].getPgTid());
//	        } catch (IamportResponseException e) {
//	            System.out.println(e.getMessage());
//
//	            switch (e.getHttpStatusCode()) {
//	                case 401:
//	                    //TODO
//	                    break;
//	                case 500:
//	                    //TODO
//	                    break;
//	            }
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//	    }
}
