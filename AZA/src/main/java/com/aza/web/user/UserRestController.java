package com.aza.web.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		
		@RequestMapping(value="getUser", method=RequestMethod.POST)
		public User getUser(HttpSession session) throws Exception {
			return (User) session.getAttribute("user");
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
		

		@RequestMapping( value="/login", method=RequestMethod.POST )
		public User login(@ModelAttribute User user,
										HttpSession session ) throws Exception{
		
			System.out.println("rest쪽 로그인~~");
			//Business Logic
			System.out.println("::"+user);
			User dbUser=userService.getUser(user.getUserId());
			
			if( user.getPassword().equals(dbUser.getPassword())){
				session.setAttribute("user", dbUser);
			}
			
			return dbUser;
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
		
		
		@RequestMapping("getUser")
		public User getUser (@PathVariable String userId,HttpSession session) throws Exception {
			
			User dbUser = (User) session.getAttribute("user");
			User user = userService.getUser(userId);

			if(user.getRole().equals("parent")) {
				
				String parentId = dbUser.getUserId();
				String studentId = dbUser.getUserId();
				Search search = new Search();
				search.setCurrentPage(1);
				search.setPageSize(30);
				List<User> studentList = (List)userService.listRelationByParent(search, parentId).get("list");
				
				for(User student : studentList) {
					User parentInfo = userService.getUser(student.getUserId());
					parentInfo.setRelationName(student.getRelationName());
					parentInfo.setFirstStudentId(studentId);
					String userName = dbUser.getUserName();
					parentInfo.setUserName(userName);
					
					System.out.println(studentList);
					System.out.println(parentInfo);
					
				}
			}
			return userService.getUser(userId);
		}
		
//		@RequestMapping(value="updateUser", method = RequestMethod.GET)
//		public User updateUser (@PathVariable String userId) throws Exception {
//			
//			System.out.println("/user/updateUser : GET");
//			//Business Logic
//			User user = userService.getUser(userId);
//			
//			return user;
//		}
//		
//		@RequestMapping( value="/updateUser", method=RequestMethod.POST )
//		public User updateUser(@ModelAttribute User user, HttpSession session) throws Exception{
//
//			System.out.println("/user/updateUser : POST");
//			//Business Logic
//					
//			// userService.updateUser(user);
//			User sessionId=userService.getUser(user.getUserId());
//			if(user.getUserId().equals(sessionId.getUserId())){
//				session.setAttribute("user", sessionId);
//			}
//			
//			return sessionId;
//		}
		
//		쓰는지 모르겟음.. 나중에 돌려보기		
//		@RequestMapping(value = "/quit",method = RequestMethod.POST)
//		public User deleteUser(@ModelAttribute User user,HttpSession session) throws Exception {
//			
//			// 세션에 있는 member
//			User member = (User)session.getAttribute("User");
//			
//			String dbpwd=member.getPassword();
//			String pwd=user.getPassword();
//			
//			if(!(dbpwd.equals(pwd))) {
//				
//			}
//			
//			System.out.println("rest 삭제");
//		userService.deleteUser(user);
//					return user;
//		}

		@RequestMapping(value = "/deleteRelation/{relationCode}",method = RequestMethod.POST)
		public User deleteRelation(@ModelAttribute User user, @PathVariable int relationCode) throws Exception {
			
			userService.deleteRelation(relationCode);
			
			return user;
		}
		
		@RequestMapping(value="/sendSMS/{phone}")
		public void sendSMS(User vo,Model model,@PathVariable("phone") String phone,HttpSession session) throws Exception{
//			int num = userService.phoneAuth();
//			String message = "AZA에서 보낸 인증번호는 ["+num+"] 입니다."; // 아니 왜 문자열 넣으면 400에러 뜨냐?
			User user = userService.checkPhone(vo);

			if(user == null) { 
				model.addAttribute("result", "success");
				String message = Integer.toString(userService.phoneAuth());
				userService.sendSMS(phone, message);
				System.out.println("checkPhone");
			} else { 
				model.addAttribute("result", "fail");
				System.out.println("NO CHECK PHONE");
			}
			System.out.println("<<CHECK PHONE>>");
		
		}
		
		@RequestMapping(value="/confirmCode/{confirm}/{phoneAuth}")
		public JSONObject confirmCode(@PathVariable String confirm,
								@PathVariable Integer phoneAuth, HttpSession session) throws Exception {
			
			JSONObject json = new JSONObject();
			int num =(Integer)session.getAttribute(confirm);			
			String userId = (String)session.getAttribute("userId");
			System.out.println("send : "+phoneAuth);
			System.out.println("recall : "+num);
			if(phoneAuth == num) {
				json.put("result", "인증완료");
				json.put("userId", userId);
				session.removeAttribute(confirm);
			} else {
				json.put("result", "인증실패");
			}
			
			return json;
		}
	
	}

