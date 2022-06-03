//package com.aza.common;
//
//import java.io.UnsupportedEncodingException;
//import java.net.URI;
//import java.net.URISyntaxException;
//import java.nio.charset.Charset;
//import java.security.InvalidKeyException;
//import java.security.NoSuchAlgorithmException;
//import java.util.ArrayList;
//import java.util.Base64;
//import java.util.Date;
//import java.util.List;
//
//import javax.crypto.Mac;
//import javax.crypto.spec.SecretKeySpec;
//
//import org.springframework.expression.ParseException;
//import org.springframework.http.HttpEntity;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpMethod;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//@Service
//public class NaverSmsService {
//	
//	
//	public NaverSmsResponseDTO sendSms(String recipientPhoneNumber, String content, String reserveTime, String reserveTimeZone, String smsId, String type) throws ParseException, JsonProcessingException, 
//	UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, URISyntaxException { 
//		Long time = new Date().getTime();
//		String jsonBody = null;
//		String requestUri = "https://sens.apigw.ntruss.com/sms/v2/services/"+NaverSmsDTO.SERVICE_ID;
//		if (recipientPhoneNumber != null && recipientPhoneNumber != "") {
//			List<NaverSmsMessageRequestDTO> messages = new ArrayList<>(); // ������ ������� ������ ����. 
//			messages.add(new NaverSmsMessageRequestDTO(recipientPhoneNumber,content)); // content�κ��� ������ // ��ü json�� ���� �޽����� �����.
//			NaverSmsRequestDTO smsRequestDto = null;
//			
//			if (reserveTime != null && reserveTime != "") {
//				smsRequestDto = new NaverSmsRequestDTO(reserveTime, type, "COMM", "82", NaverSmsDTO.SEND_FROM, "MangoLtd", messages); // �׾ƿ� �ٵ� json ���·� ��ȯ�����ش�. 
//			}else {			
//				smsRequestDto = new NaverSmsRequestDTO(type, "COMM", "82", NaverSmsDTO.SEND_FROM, "MangoLtd", messages); // �׾ƿ� �ٵ� json ���·� ��ȯ�����ش�. 
//			}
//			ObjectMapper objectMapper = new ObjectMapper(); 
//			jsonBody = objectMapper.writeValueAsString(smsRequestDto); // ������� ���� ���������� ����ش�.
//			requestUri = requestUri+"/messages";
//		}else {
//			requestUri = requestUri+"/reservations/"+smsId;
//		}
//		System.out.println(requestUri);
//		HttpHeaders headers = new HttpHeaders(); 
//		headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
//		headers.set("x-ncp-apigw-timestamp", time.toString()); 
//		headers.set("x-ncp-iam-access-key", NaverSmsDTO.ACCESS_KEY ); // ���� �߿��� signature �����ϱ�. 
//		String sig = "";
//		if (recipientPhoneNumber != null && recipientPhoneNumber != "") {
//			sig = makeSignature(time);
//		}else {
//			sig = makeSignature2(time, smsId);
//		}
//		headers.set("x-ncp-apigw-signature-v2", sig); // ������ ������ jsonBody�� ����� �����Ѵ�.
//		HttpEntity<String> entity = new HttpEntity<>(jsonBody, headers);
//		
//		System.out.println(entity); // restTemplate�� post ��û�� ������. �� �� ������ 202 �ڵ� ��ȯ�ȴ�. 
//		RestTemplate restTemplate = new RestTemplate();
//		NaverSmsResponseDTO sendSmsResponseDto = new NaverSmsResponseDTO();
//		
//		  if (recipientPhoneNumber != null && recipientPhoneNumber != "") {
//			  sendSmsResponseDto = restTemplate.postForObject(new URI(requestUri), entity, NaverSmsResponseDTO.class); 
//			  System.out.println(sendSmsResponseDto); 
//		  }else {
//			  ResponseEntity<String> resEntity = restTemplate.exchange(requestUri,
//			  HttpMethod.DELETE,entity, String.class ); 
//			  System.out.println(resEntity); 
//		  }
//		return sendSmsResponseDto;
//	}
//
//	
//	public String makeSignature(Long time) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException { 
//		String space = " "; // one space 
//		String newLine = "\n"; // new line 
//		String method = "POST"; // method 
//		String url = "/sms/v2/services/"+NaverSmsDTO.SERVICE_ID+"/messages"; // url (include query string) 
//		String timestamp = time.toString(); // current timestamp (epoch) 
//		String accessKey = NaverSmsDTO.ACCESS_KEY; // access key id (from portal or Sub Account) 
//		String secretKey = NaverSmsDTO.SECRET_KEY; 
//		String message = new StringBuilder() 
//				.append(method) 
//				.append(space) 
//				.append(url) 
//				.append(newLine) 
//				.append(timestamp) 
//				.append(newLine) 
//				.append(accessKey) 
//				.toString();
//		System.out.println(message);
//		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256"); 
//		Mac mac = Mac.getInstance("HmacSHA256"); 
//		mac.init(signingKey); 
//		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8")); 
//		String encodeBase64String = Base64.encodeBase64String(rawHmac); 
//		return encodeBase64String; 
//		
//	}
//	
//	public String makeSignature2(Long time, String smsId) throws UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException { 
//		String space = " "; // one space 
//		String newLine = "\n"; // new line
//		String method = "DELETE"; // method 
//		String url = "/sms/v2/services/"+NaverSmsDTO.SERVICE_ID+"/reservations/"+smsId; // url (include query string) 
//		String timestamp = time.toString(); // current timestamp (epoch) 
//		String accessKey = NaverSmsDTO.ACCESS_KEY; // access key id (from portal or Sub Account) 
//		String secretKey = NaverSmsDTO.SECRET_KEY; 
//		String message = new StringBuilder() 
//				.append(method) 
//				.append(space) 
//				.append(url) 
//				.append(newLine) 
//				.append(timestamp) 
//				.append(newLine) 
//				.append(accessKey) 
//				.toString();
//		System.out.println(message);
//		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256"); 
//		Mac mac = Mac.getInstance("HmacSHA256"); 
//		mac.init(signingKey); 
//		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8")); 
//		String encodeBase64String = Base64.encodeBase64String(rawHmac);
//		System.out.println(encodeBase64String);
//		return encodeBase64String; 
//		
//	}
//
//	
//
//
//
//}