package com.aza.web.user;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.domain.User;
import com.aza.service.user.UserService;

@Controller
@CrossOrigin(origins="*", allowedHeaders="*")
@RequestMapping("/user/*")
public class UserController {

	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public ModelAndView addUser() throws Exception{
		
		System.out.println("/user/addUser : GET");

		ModelAndView mv= new ModelAndView();
		mv.setViewName("/user/join");
		
		return mv;
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public ModelAndView addUser( @ModelAttribute("user") User user) throws Exception{
		
	//	user.setBuyer((User)session.getAttribute("user"));
	//	user.setUser(userService.getUser(userId));
	//	user.setTranCode("1");
		
		userService.addUser(user);
		
		System.out.println("컨트롤러 쪽 : /user/addUser : POST");
				
		return new ModelAndView("/login");
	}	

	
	// test : login
	@RequestMapping(value="login")
	public @ResponseBody ModelAndView login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login");
		
		ModelAndView mv= new ModelAndView();
	
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		
		// 로그인한 사람의 role이 parent일때 id로 listrelation 받아와서 session에 넣어주기 
		
		System.out.println(dbUser);
		
		if(dbUser!=null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			
			if(dbUser.getRole().equals("parent")) {
				Search search = new Search();
				search.setPageSize(pageSize);
				search.setCurrentPage(1);
				List<User> students = (List) userService.listRelationByParent(search, dbUser.getUserId()).get("list");
				
				session.setAttribute("students", students);
			}
			
			// teacher 인 경우
			if(dbUser.getRole().equals("teacher")) {
				mv.setViewName("/index_teacher");
			}
			
			// student 인 경우
			if(dbUser.getRole().equals("student")) {
				mv.setViewName("/index_student");
			}
			
			// parent 인 경우
			if(dbUser.getRole().equals("parent")) {
				mv.setViewName("/index_parent");
			}
			
			System.out.println(session.getAttribute("user"));
			System.out.println("로그인 성공이시다");
			return mv; // 일치하면 메인
		} else {
			System.out.println("안돼 로그인 시켜줄 생각없어 돌아가");
			return new ModelAndView("/login"); // 틀리면 로그인화면
		}
	}
	
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public ModelAndView logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
				
		return new ModelAndView("redirect:/index.jsp");
	}
	
	@RequestMapping(value="getUser",method=RequestMethod.GET)
	public ModelAndView getUser (@RequestParam("userId")String userId) throws Exception{
		return new ModelAndView("/user/getUser","user",userService.getUser(userId));
	}
	
	@RequestMapping(value="/updateUser", method = RequestMethod.POST)
	public ModelAndView updatePurchase (@ModelAttribute("user") User user) throws Exception {
		
		userService.updateUser(user);
		
		return new ModelAndView("/getUser.jsp","user",user);
	}
	
	@RequestMapping( value="deleteUser", method=RequestMethod.GET )
	public ModelAndView deleteUser() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/user/deleteUser : GET");
		
		return modelAndView;
	}
	
	@RequestMapping( value="addRelation", method=RequestMethod.GET )
	public ModelAndView addRelation() throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/user/addRelation : GET");
		
		//return "redirect:/user/addUserView.jsp";
		return modelAndView;
	}
	
	@RequestMapping( value="addRelation", method=RequestMethod.POST )
	public ModelAndView addRelation( @ModelAttribute("user") User user ) throws Exception{
	
		System.out.println("/user/addRelation : POST");
		userService.addRelation(user);
		
		return new ModelAndView("addRelation"); // 수정해서 사용
	}	
	
	@RequestMapping(value="getRelation",method=RequestMethod.GET)
	public ModelAndView getRelation (@RequestParam("relationCode")int relationCode) throws Exception{
		return new ModelAndView("/user/getRelation","user",userService.getRelation(relationCode));
	}
	
//	@RequestMapping( value="updateUser", method=RequestMethod.GET )
//	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{
//
//		System.out.println("/user/updateUser : GET");
//		//Business Logic
//		User user = userService.getUser(userId);
//		// Model 과 View 연결
//		model.addAttribute("user", user);
//		
//		return "forward:/user/updateUser.jsp";
//	}

	// 고쳐서 쓰셈..
	@RequestMapping( value="updateRelation", method=RequestMethod.POST )
	public ModelAndView updateRelation(@RequestParam("currentPage") int currentPage,@RequestParam("relationCode")int relationCode) throws Exception{

		System.out.println("/user/updateRelation : POST");
		//Business Logic
		
		User user = userService.getRelation(relationCode);
		user.setRelationCode(relationCode);
		userService.updateRelation(user);
		
//		 relationCode = userService.getRelation(user.getRelationCode());
//		
//		if(user.getRelationCode()==relationCode.getRelationCode()){
//			session.setAttribute("user", relationCode);
//		}
		
		return new ModelAndView("redirect:/user/updateRelation?relationCode="+user.getRelationCode());
	}
	
//	@RequestMapping( value="find_id_form")
//	public ModelAndView findId() throws Exception{
//		System.out.println("아이디 겟또");
//		ModelAndView mv= new ModelAndView();
//		mv.setViewName("/user/findId");
//		
//		return mv;
//	}
//
//	
//	@RequestMapping( value="find_id", method=RequestMethod.POST )
//	public ModelAndView findId( @ModelAttribute("user") User user) throws Exception{
//		user = userService.findId(user);
//		System.out.println("컨트롤러 아이디 포스또");
//		ModelAndView mv= new ModelAndView();
//		if(user==null) {
//			mv.addObject("check",1);
//		}else {
//			mv.addObject("check",0);
//			mv.addObject("userId",user.getUserId());
//		}
//		
//		return new ModelAndView("/user/findId");
//	}
//	
//	@RequestMapping( value="find_password_form")
//	public ModelAndView findPassword() throws Exception{
//		System.out.println("비밀번호 겟또");
//		ModelAndView mv= new ModelAndView();
//		mv.setViewName("/user/findPassword");
//		
//		return mv;
//	}
//
//	
//	@RequestMapping( value="find_password", method=RequestMethod.POST )
//	public ModelAndView findPassword( @ModelAttribute("user") User user) throws Exception{
//		user = userService.findPassword(user);
//		System.out.println("컨트롤러 아이디 포스또");
//		ModelAndView mv= new ModelAndView();
//		if(user==null) {
//			mv.addObject("check",1);
//		}else {
//			mv.addObject("check",0);
//			mv.addObject("updateId",user.getUserId());
//		}
//		
//		return new ModelAndView("/user/findPassword");
//	}
//	
//	@RequestMapping( value="update_password", method=RequestMethod.POST )
//	public ModelAndView updatePassword( @ModelAttribute("user") User user,@RequestParam(value="updateid", defaultValue="", required=false)String userId) throws Exception{
//		
//		user.setUserId(userId);
//		System.out.println(user);
//		userService.updatePassword(user);
//		return new ModelAndView("/user/updatePassword");
//	}
//	
//	@RequestMapping(value="check_password_view")
//	public String updatePassword(HttpSession session) throws Exception {
//		
//		User user = (User)session.getAttribute("loginUser");
//		
//		if(user==null) {
//			return "user/login";
//		}else {
//			return "user/getUser";
//		}
//	}

	 // 아이디 찾기 페이지 이동
		@RequestMapping(value="findId")
		public String findIdView() {
			return "user/findId";
		}
		
	    // 아이디 찾기 실행
		@RequestMapping(value="findId", method=RequestMethod.POST)
		public String findIdAction(User vo, Model model) throws Exception {
			User user = userService.findId(vo);
			
			if(user == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("id", user.getUserId());
			}
			
			return "user/findId";
		}
		
	    // 비밀번호 찾기 페이지로 이동
		@RequestMapping(value="findPassword")
		public String findPasswordView() {
			return "user/findPassword";
		}
		
	    // 비밀번호 찾기 실행
		@RequestMapping(value="findPassword", method=RequestMethod.POST)
		public String findPasswordAction(User vo, Model model) throws Exception {
			User user = userService.findPassword(vo);
			
			if(user == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("updateid", user.getUserId());
			}
			
			return "user/findPassword";
		}
		
	    // 비밀번호 바꾸기 실행
		@RequestMapping(value="update_password", method=RequestMethod.POST)
		public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) String id,
											User vo) throws Exception {
			vo.setUserId(id);
			System.out.println(vo);
			userService.updatePassword(vo);
			return "user/findPasswordConfirm";
		}
		
	    // 비밀번호 바꾸기할 경우 성공 페이지 이동
		@RequestMapping(value="check_password_view")
		public String checkPasswordForModify(HttpSession session, Model model) {
			User loginUser = (User) session.getAttribute("loginUser");
			
			if(loginUser == null) {
				return "user/login";
			} else {
				return "mypage/checkformodify";
			}
		}		
	
}
