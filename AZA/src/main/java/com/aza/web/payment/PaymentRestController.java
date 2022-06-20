package com.aza.web.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value = "listPayment")
	public Map<String,Object> listPayment
	(HttpServletRequest request) throws Exception{
		
		System.out.println("listPayment RestController Start...");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		
		Map<String, Object> map = paymentService.listPayment(search);
		return map;
	}

	@RequestMapping(value = "getPayment/{payCode}", method = RequestMethod.GET)
	public Payment getPayment(@PathVariable int payCode) throws Exception{
		System.out.println("rest/getPayment : GET");
		
		return paymentService.getPayment(payCode);
		
	}

	@RequestMapping(value = "updatePayment", method = RequestMethod.GET)
	public void updatePayment(@ModelAttribute("payment") Payment payment) throws Exception{
		System.out.println("rest/getPayment : GET");
		
		 payment = paymentService.getPayment(payment.getPayCode());
		 payment.setCheckPay('Y');		
		 payment.setImpUid(payment.getImpUid());		
	}	
	
	@RequestMapping("complete")
	public ResponseEntity<String> completePayment
	(HttpSession session, Payment payment)throws Exception{
		System.out.println("rest Payment Complete");
		String token = paymentService.getToken();
		System.out.println("토큰 ==> " + token);
		String impUid = payment.getImpUid();
		
		payment = paymentService.getPayment(payment.getPayCode());
		int amount = paymentService.paymentInfo(impUid, token);
		System.out.println("rest Amount=>" + amount);
		//실결제 금액과 일치하는지 확인.
		int checkPrice = payment.getAmount();
		System.out.println("checkPrice => " + checkPrice);
		
		//일치하지 않을 때 결제 취소
		try {
			if(checkPrice != amount) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "결제 금액 오류");
			 return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
		}else {
			//결제 성공시 수납완료로 상태 변경, impUid값 저장
			System.out.println("checkPrice = amount check OK");
			System.out.println("checkPrice = amount payment value=>" + payment);
			payment.setPayCode(payment.getPayCode());
			System.out.println("getpayCode => => " + payment.getPayCode());
			payment.setCheckPay('Y');
			payment.setImpUid(impUid);
			paymentService.updatePayment(payment);
			System.out.println("결제 성공");
			System.out.println("comlete payment => " + payment);
			
		}
			
		}catch (Exception e) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "결제 오류");
			System.out.println("Cencle..?");
			 return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
