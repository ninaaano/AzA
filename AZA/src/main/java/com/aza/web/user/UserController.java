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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		System.out.println(" : /user/addUser : POST");

				
		return new ModelAndView("/login");
	}	

	
	// test : login
	@RequestMapping(value="login")
	public @ResponseBody ModelAndView login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login");
		
		ModelAndView mv= new ModelAndView();
	
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
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
			
			// teacher 
			if(dbUser.getRole().equals("teacher")) {
				mv.setViewName("/index_teacher");
			}
			
			// student 
			if(dbUser.getRole().equals("student")) {
				mv.setViewName("/index_student");
			}
			
			// parent 
			if(dbUser.getRole().equals("parent")) {
				mv.setViewName("/index_parent");
			}
			
			System.out.println(session.getAttribute("user"));

			System.out.println("");
			return mv; // 

		} else {
			System.out.println("");

			return new ModelAndView("/login"); // 

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
	
	@RequestMapping( value="quit", method=RequestMethod.GET )
	public String deleteUser() throws Exception{
		System.out.println("/user/deleteUser : GET");
		return "/user/quit";

	}
	
	@RequestMapping( value="quit", method=RequestMethod.POST )
	public String deleteUser(@ModelAttribute("user") User user, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		User member = (User)session.getAttribute("User");
		
		String dbpwd=member.getPassword();
		String pwd=user.getPassword();
		if(!(dbpwd.equals(pwd))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/quit";
		}
		userService.deleteUser(user);
		session.invalidate();

		System.out.println("");
		return "/login";
		

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
		
		return new ModelAndView("addRelation");

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

//		model.addAttribute("user", user);
//		
//		return "forward:/user/updateUser.jsp";
//	}

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

//		System.out.println("");
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

//		System.out.println("");
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

//		System.out.println("");
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


		@RequestMapping(value="findId")
		public String findIdView() {
			System.out.println("");
			return "user/findId";
		}
		
		@RequestMapping(value="find_id", method=RequestMethod.POST)

		public String findIdAction(User vo, Model model) throws Exception {
			User user = userService.findId(vo);
			
			if(user == null) { 
				model.addAttribute("check", 1);
				System.out.println("");
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("id", user.getUserId());
				System.out.println("");
			}
			System.out.println("");
			
			return "user/findId";
		}
		
		@RequestMapping(value="findPassword")
		public String findPasswordView() {
			System.out.println("");
			return "user/findPassword";
		}
		
     
		@RequestMapping(value="find_password", method=RequestMethod.POST)

		public String findPasswordAction(User vo, Model model) throws Exception {
			User user = userService.findPassword(vo);
			
			if(user == null) { 
				model.addAttribute("check", 1);
				System.out.println("");
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("updateid", user.getUserId());
				System.out.println("");
			}
			System.out.println("");
			return "user/findPassword";
		}
		
		@RequestMapping(value="update_password", method=RequestMethod.POST)
		public String updatePasswordAction(@RequestParam(value="updateid", defaultValue="", required=false) String id,
											User vo) throws Exception {
			vo.setUserId(id);
			System.out.println(vo);
			userService.updatePassword(vo);
			System.out.println("");
			return "user/findPassword";
		}

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
