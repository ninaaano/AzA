package com.aza.service.user.test;


import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.User;
import com.aza.service.user.UserDao;
import com.aza.service.user.UserService;


//@RunWith(SpringRunner.class)
@SpringBootTest
//@WebAppConfiguration
public class UserServiceTest {
	
	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	//@Test
	public void testAddUser() throws Exception{
		User user = new User();
//		user.setUserId("student333");
//		user.setPassword("student333");
//		user.setRole("student");
//		user.setUserName("�л�333");
//		user.setPhone("01066667777");
//		user.setSchool("���ڰ�");
//		user.setGrade('3');
//		user.setBirth("20020303");
//		user.setParentPhone("01033331111");
		
		user.setUserId("parent34");
		user.setPassword("parent34");
		user.setRole("parent");
		user.setUserName("�кθ�34");
		user.setPhone("01044445555");
		user.setAlertState('0');
		user.setFirstStudentId("student33");
		user.setRelationName("��Ӵ�");
		
		userService.addUser(user);
	}
	
	//@Test
	public void testAddRelation() throws Exception {
		User user = new User();
		user.setUserId("parent3");
		user.setFirstStudentId("student33");
		user.setRelationName("��Ӵ�");
		
		userService.addRelation(user);
	}
	
	//@Test
	public void testgetUser() throws Exception {
		
		User user = new User();
		user = userService.getUser("student3");
		
		//==> console Ȯ��
		System.out.println(user);

	}
	
	//@Test
	public void testUpdateUser() throws Exception {
		User user = new User();
		user.setUserId("parent333");
		user.setPassword("parent12333");
		user.setPhone("01066667777");
		user.setSchool("���ڰ�");
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
		user.setRelationName("�ƹ���");
		user.setUserId("parent3");
		user.setFirstStudentId("student31");
		
		userService.updateRelation(user);
	}
	
	@Test
	public void testListRelationByStudent() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = userService.listRelationByStudent(search, "student11");
		
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println("====================="+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("===================="+totalCount);
		
	}
	
//	@Test
	public void testListRelationByParent() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		
		Map<String,Object> map = userService.listRelationByParent(search, "parent11");
		
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println("====================="+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("===================="+totalCount);
		
	}
	
	//@Test
//	public void testGetRelation() throws Exception {
//		User user = new User();
//		user.setUserId("parent33");
//		user.setFirstStudentId("student33");
//		
//		userService.getRelation(user.getFirstStudentId(), user.getUserId());
//	}
	
	//@Test
	public void testGetRelation() throws Exception {
		User user = new User();
		user.setRelationCode(1006);
		
		userService.getRelation(user.getRelationCode());
	}
}