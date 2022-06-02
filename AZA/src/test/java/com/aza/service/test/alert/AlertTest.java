package com.aza.service.test.alert;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.alert.AlertService;
import com.aza.service.domain.Alert;

@SpringBootTest
public class AlertTest {

	@Autowired
	@Qualifier("alertServiceImpl")
	private AlertService alertService;
	
	@Test
	public void testGetAlert() throws Exception {
		
		Alert alert = new Alert();
		
		alert = alertService.getAlert(1020);
		
		System.out.println(alert);
		
	}
	
	
}
