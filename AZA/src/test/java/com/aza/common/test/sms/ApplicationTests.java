package com.aza.common.test.sms;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

//
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.NaverSmsService;
import com.fasterxml.jackson.core.JsonProcessingException;
//
import org.springframework.expression.ParseException;

@SpringBootTest
class ApplicationTests {
    @Autowired
    private NaverSmsService NaverSmsService;

    @Test
    void sendSms() throws JsonProcessingException, ParseException, UnsupportedEncodingException, URISyntaxException, NoSuchAlgorithmException, InvalidKeyException {
    	NaverSmsService.sendSms("01049660466","오예");
    }
}



//@RestController
//@RequiredArgsConstructor
//public class ApplicationTests {
//
//	private NaverSmsService smsService;
//
//    @PostMapping("/user/sms")
//    public ResponseEntity<NaverSmsResponseDTO> test(@RequestBody Request request) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
//    	NaverSmsResponseDTO data = smsService.sendSms(request.getRecipientPhoneNumber(), request.getContent());
//        return ResponseEntity.ok().body(data);
//    }
//}