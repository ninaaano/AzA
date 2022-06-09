package com.aza.web.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentService;


@RestController
@RequestMapping("/payment/rest/*")
public class PaymentRestController {

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	public PaymentRestController() {
		System.out.println(this.getClass());
	}
	
//	@RequestMapping(value = "listPayment")
//	public Map listPayment
//	(HttpServletRequest request) throws Exception{
//		
//		System.out.println("listPayment RestStart...");
//		
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(3);	
//		
//		Map<String, Object> map =paymentService.listPayment(search);
//		return map;
//	}

	@RequestMapping(value = "getPayment", method = RequestMethod.GET)
	public Payment getPayment() throws Exception{
		System.out.println("rest/getPayment : GET");
		
		return paymentService.getPayment(1020);
		
	}
//	@RequestMapping(value="listPayment")
//	public payment 
	
}

