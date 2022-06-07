package com.aza.web.payment;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class PaymentRestController {

	public PaymentRestController() {
		// TODO Auto-generated constructor stub
	}
	
		
	@PostMapping("/requestPay")
	public void requestPay(@RequestParam("imp_uid")String impUid) throws Exception{
	
	}
}

