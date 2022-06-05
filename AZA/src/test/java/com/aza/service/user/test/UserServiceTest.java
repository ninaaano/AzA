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
	
	
	//@Test
	public void testAddUser() throws Exception{
		User user = new User();
//		user.setUserId("student333");
//		user.setPassword("student333");
//		user.setRole("student");
//		user.setUserName("학생333");
//		user.setPhone("01066667777");
//		user.setSchool("가자고");
//		user.setGrade('3');
//		user.setBirth("20020303");
//		user.setParentPhone("01033331111");
		
		user.setUserId("parent333");
		user.setPassword("parent333");
		user.setRole("parent");
		user.setUserName("학부모333");
		user.setPhone("01088889999");
		user.setAlertState('0');
		user.setFirstStudentId("student33");
		user.setRelationName("아버지");
		
		userService.addUser(user);
	}
	
	//@Test
	public void testAddRelation() throws Exception {
		User user = new User();
		user.setUserId("parent3");
		user.setFirstStudentId("student33");
		user.setRelationName("어머니");
		
		userService.addRelation(user);
	}
	
	//@Test
	public void testgetUser() throws Exception {
		
		User user = new User();
		user = userService.getUser("student3");
		
		//==> console 확인
		System.out.println(user);

	}
	
	//@Test
	public void testUpdateUser() throws Exception {
		User user = new User();
		user.setUserId("parent333");
		user.setPassword("parent12333");
		user.setPhone("01066667777");
		user.setSchool("가자고");
		user.setGrade('3');
		user.setParentPhone("01077778888");
		
		userService.updateUser(user);
		
		System.out.println("==========="+user);
	}
	
	//@Test
	public void testDeleteUser() throws Exception {
		User user = new User();
		user.setUserId("parent333");
		
		userService.deleteUser(user.getUserId());
		
	}
	
	//@Test
	public void testCheckDuplication() throws Exception{
		userService.checkDuplication("student3");
		userService.checkDuplication("student666");
	}
	
	//@Test
	public void testUpdateCheck() throws Exception {
		User user = new User();
		user.setCheck('0');
		user.setUserId("student33");
		
		userService.updateCheck(user);
		System.out.println("================="+user);
	}
	
	//@Test
	public void testUpdateAlertState() throws Exception {
		User user = new User();
		user.setAlertState('1');
		user.setUserId("parent31");
		
		userService.updateAlertState(user);
		System.out.println("================="+user);
	}
	
	//@Test
	public void testUpdateStopAlertStartTime() throws Exception {
		User user = new User();
		user.setStopAlertStartTime("18:00");
		user.setUserId("teacher3");
		
		userService.updateStopAlertStartTime(user);
		System.out.println("================="+user);
	}
	
	//@Test
	public void testUpdateRelation() throws Exception {
		User user = new User();
		user.setRelationName("아버지");
		user.setUserId("parent3");
		user.setFirstStudentId("student31");
		
		userService.updateRelation(user);
	}
	
	@Test
	public void testListRelation() throws Exception {
		User user = new User();
		user.setUserId("parent3");
		
		userService.listRelation(user.getUserId());
		System.out.println("========"+user);
	}
}
