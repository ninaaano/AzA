package com.aza.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.User;
import com.aza.service.user.UserService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/user/rest/*")
public class UserRestController {

		
		///Field
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		//setter Method 구현 않음
			
		public UserRestController(){
			System.out.println(this.getClass());
		}
		
		@RequestMapping(value="addUser", method=RequestMethod.POST)
		public User addUser(@RequestBody User user) throws Exception {
			userService.addUser(user);
			return user;
		}
		
		@RequestMapping( value="checkDuplication/{userId}", method=RequestMethod.POST )
		public int checkDuplication(@RequestParam("id") String userId) throws Exception{
			
			System.out.println("/user/checkDuplication : POST");
			
			System.out.println("==userIdCheck start==");
	        System.out.println("전달받은 id:"+userId);
	        int cnt = userService.checkDuplication(userId);
	        System.out.println("확인 결과:"+cnt);
	        return cnt;
		}
		
		
		/////for Msg
		@RequestMapping("listRelationByStudent/{studentId}")
		public Map<String, Object> listStudentsRecord(@PathVariable("studentId") String studentId, HttpSession session) throws Exception { 
		
			System.out.println("/user/rest/listRelationByStudent/{studentId}");
			
			Search search = new Search();
			int totalCount = (int) userService.listRelationByStudent(search, studentId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);
			
			return userService.listRelationByStudent(search, studentId);
		}


		
		
	
	
	}

