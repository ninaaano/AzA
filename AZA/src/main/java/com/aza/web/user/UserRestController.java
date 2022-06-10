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
		
		@RequestMapping( value="/login", method=RequestMethod.POST )
		public User login(	@RequestBody User user,
										HttpSession session ) throws Exception{
		
			System.out.println("/user/login : POST");
			//Business Logic
			System.out.println("::"+user);
			User dbUser=userService.getUser(user.getUserId());
			
			if(dbUser!=null && user.getPassword().equals(dbUser.getPassword())){
					session.setAttribute("user", dbUser);
					// 메인화면이동
					return dbUser;
			}else {
				return dbUser;
			}
			
		//	return dbUser;
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
		
		@RequestMapping("listRelationByParent/{parentId}")
		public Map<String, Object> listRelationByParent(@PathVariable("parentId") String parentId, HttpSession session) throws Exception { 
		
			System.out.println("/user/rest/listRelationByParent/{parentId}");
			
			Search search = new Search();
			int totalCount = (int) userService.listRelationByParent(search, parentId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);
			
			return userService.listRelationByParent(search, parentId);
		}
		
		
		@RequestMapping(value = "getUser/{userId}", method = RequestMethod.GET)
		public User getUser (@PathVariable String userId) throws Exception {
			
			return userService.getUser(userId);
		}
		
		@RequestMapping(value="updateUser", method = RequestMethod.POST)
		public User updateUser (@RequestBody User user, HttpSession session) throws Exception {
			
			User userId = userService.getUser(user.getUserId());
			
			if(user.getUserId()==userId.getUserId()){
				session.setAttribute("user", userId);
			}
			
			return user;
		}
		
		
		@RequestMapping(value = "deleteUser/{userId}",method = RequestMethod.POST)
		public User deletePurchase(@RequestBody User user, @PathVariable String userId) throws Exception {
			
			userService.deleteUser(userId);
			
			return user;
		}

		@RequestMapping(value = "/deleteRelation/{relationCode}",method = RequestMethod.POST)
		public User deleteRelation(@RequestBody User user, @PathVariable int relationCode) throws Exception {
			
			userService.deleteRelation(relationCode);
			
			return user;
		}
		
		@RequestMapping(value="sendSMS")
		public void phoneAuth(UserService naverServiceImpl) throws Exception{
			naverServiceImpl.phoneAuth();
		}
		
	
	
	}

