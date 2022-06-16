package com.aza.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
		public User addUser(@ModelAttribute User user) throws Exception {
			userService.addUser(user);
			return user;
		}
		
		@RequestMapping( value="/checkDuplication")
		public int checkDuplication(@RequestParam("id") String userId) throws Exception{
						
			System.out.println("==userIdCheck start==");
	        System.out.println("전달받은 id:"+userId);
	        int cnt = userService.checkDuplication(userId);
	        System.out.println("확인 결과:"+cnt);
	        return cnt;
		}
		
		@RequestMapping( value="/checkStudent")
		public int checkStudent(@RequestParam("id") String firstStudentId) throws Exception{
						
			System.out.println("==자녀아이디 찾아라==");
	        System.out.println("전달받은 id:"+firstStudentId);
	     
	        int cnt = userService.checkStudent(firstStudentId);
	        System.out.println("확인 결과:"+cnt);
	     
	        return cnt;

	    	}
		
//		//필요없는듯
//		@RequestMapping( value="/login", method=RequestMethod.GET )
//		public User login(@ModelAttribute User user,
//										HttpSession session ) throws Exception{
//		
//			System.out.println("rest쪽 로그인~~");
//			//Business Logic
//			System.out.println("::"+user);
//			User dbUser=userService.getUser(user.getUserId());
//			
//			if(dbUser!=null && user.getPassword().equals(dbUser.getPassword())){
//					session.setAttribute("user", dbUser);
//					// 메인화면이동
//					return dbUser;
//			}else {
//				return dbUser;
//			}
//			
//		//	return dbUser;
//		}

		
		
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
		public User updateUser (@ModelAttribute User user, HttpSession session) throws Exception {
			
			User userId = userService.getUser(user.getUserId());
			
			if(user.getUserId()==userId.getUserId()){
				session.setAttribute("user", userId);
			}
			
			return user;
		}
		
		
		@RequestMapping(value = "/quit",method = RequestMethod.POST)
		public User deleteUser(@ModelAttribute User user,HttpSession session) throws Exception {
			
			// 세션에 있는 member
			User member = (User)session.getAttribute("User");
			
			String dbpwd=member.getPassword();
			String pwd=user.getPassword();
			
			if(!(dbpwd.equals(pwd))) {
				
			}
			
			System.out.println("rest 삭제");
		userService.deleteUser(user);
					return user;
		}

		@RequestMapping(value = "/deleteRelation/{relationCode}",method = RequestMethod.POST)
		public User deleteRelation(@ModelAttribute User user, @PathVariable int relationCode) throws Exception {
			
			userService.deleteRelation(relationCode);
			
			return user;
		}
		
		@RequestMapping(value="/sendSMS/{phone}",method = RequestMethod.POST)
		public void sendSMS(@PathVariable("phone") String phone) throws Exception{
			
			String message = Integer.toString(userService.phoneAuth());
			userService.sendSMS(phone, message);
		}
		
	
	
	}

