package com.aza.service.user.test;


import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.User;
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
		
		user.setUserId("parent333");
		user.setPassword("parent333");
		user.setRole("parent");
		user.setUserName("�кθ�333");
		user.setPhone("01088889999");
		user.setAlertState('0');
		user.setFirstStudentId("student33");
		user.setRelationName("�ƹ���");
		
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
		User user = userService.getRelation(1004);
		user.setRelationName("삼촌");
		user.setUserId("parent4");
		user.setFirstStudentId("student44");
		
		userService.updateRelation(user);
		System.out.println("수정 : " +user);
	}
	
	//@Test
/*	public void testListRelation() throws Exception {
		User user = new User();
		user.setUserId("parent3");
		
		userService.listRelation(user.getUserId());
		System.out.println("========"+user);
	}
	*/
	
	//@Test
		public void testgetRelation() throws Exception {
			User user = new User();
			userService.getRelation(1004);
			System.out.println("get : "+user);
		}
	
	@Test
	public void testListRelation() throws Exception {
//		User user = new User();
//		user.setUserId("parent3");
		
		Search search = new Search();
		search.setCurrentPage(1);
	 	search.setPageSize(3);
		Map<String, Object> map = userService.listRelation(search,"parent3");
		
		List<Object> list = (List<Object>)map.get("list");
		Assert.assertEquals(3, list.size());
		System.out.println("========"+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);	
		
		System.out.println("=======================================");
	 	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = userService.listRelation(search, "parent3");
	 	
	 	list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	}
	
	//@Test
		 public void testListRelationByParentId() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword("admin");
		 	Map<String,Object> map = userService.listRelation(search, "parent3");
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(1, list.size());
		 	
			//==> console 확인
		 	//System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("0");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = userService.listRelation(search, "parent3");
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
			//==> console 확인
		 	//System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }
		 
		 //@Test
		 public void testListRelationByStudentId() throws Exception{
			 
		 	Search search = new Search();
		 	search.setCurrentPage(1);
		 	search.setPageSize(3);
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword("SCOTT");
		 	Map<String,Object> map = userService.listRelation(search, "student3");
		 	
		 	List<Object> list = (List<Object>)map.get("list");
		 	Assert.assertEquals(3, list.size());
		 	
			//==> console 확인
		 	//System.out.println(list);
		 	
		 	Integer totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 	
		 	System.out.println("=======================================");
		 	
		 	search.setSearchCondition("1");
		 	search.setSearchKeyword(""+System.currentTimeMillis());
		 	map = userService.listRelation(search, "student3");
		 	
		 	list = (List<Object>)map.get("list");
		 	Assert.assertEquals(0, list.size());
		 	
			//==> console 확인
		 	//System.out.println(list);
		 	
		 	totalCount = (Integer)map.get("totalCount");
		 	System.out.println(totalCount);
		 }	 
}
