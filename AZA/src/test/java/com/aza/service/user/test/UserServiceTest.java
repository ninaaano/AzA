package com.aza.service.user.test;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.domain.User;
import com.aza.service.user.UserService;


//@RunWith(SpringRunner.class)
@SpringBootTest
//@WebAppConfiguration
public class UserServiceTest {
	
	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Test
	public void testgetUser() throws Exception {
		
		User user = new User();
		user = userService.getUser("student3");
		
		//==> console 확인
		System.out.println(user);

	}
}
