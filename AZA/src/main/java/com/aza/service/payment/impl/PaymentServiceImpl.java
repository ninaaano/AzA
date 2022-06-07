package com.aza.service.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentDao;
import com.aza.service.payment.PaymentService;

@Service("paymentServiceImpl")
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
		int totalCount = paymentDao.totalPaymentCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

//======================================================================================
	
	@Override
	@Scheduled(cron="0 0 0 * * *") // 매일 00시 마다 실행
	@Bean
	public void addPaymentProcedure() throws Exception {
		paymentDao.addPaymentProcedure();		
	}	
	
//======================================================================================	
	@Override
	public void requestPay(String impUid) throws Exception {
		// TODO Auto-generated method stub
		
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://api.iamport.kr/users/getToken?_token=69bbd19d4356e54e8f6a1df7f276e2a223438730";
		String imp_key = "1382659815177138";
		String imp_secret = "b4ed387e2dddc2215f36f73dd4d5d629989345453969f937d7cec4792813c76ef9459616ca548ef3";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		JSONObject body = new JSONObject();
		body.put("imp_key",imp_key);
		body.put("imp_secret",imp_secret);
		
	
		HttpEntity<JSONObject>entity = new HttpEntity<>(body,headers);
		ResponseEntity<JSONObject> token  = restTemplate.postForEntity(url, entity, JSONObject.class);
	
	}




}
