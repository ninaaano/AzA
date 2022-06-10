package com.aza.web.user;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.service.domain.User;
import com.aza.service.user.UserService;

@Controller
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
		mv.setViewName("/join");
		
		return mv;
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public ModelAndView addUser( @ModelAttribute("user") User user, HttpSession httpSession,@RequestParam("userId") String userId) throws Exception{
		
	//	user.setBuyer((User)session.getAttribute("user"));
	//	user.setUser(userService.getUser(userId));
	//	user.setTranCode("1");
		
		userService.addUser(user);
		
		System.out.println("/user/addUser : POST");
				
		return new ModelAndView("/main");
	}	

	
	// test : login
	@RequestMapping( value="login")
	public @ResponseBody ModelAndView login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login");
		
		ModelAndView mv= new ModelAndView();
		mv.setViewName("/index");
	
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		System.out.println(dbUser);
		
		if(dbUser!=null && user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
			System.out.println(session.getAttribute("user"));
			System.out.println("로그인 성공이시다");
			return mv; // 일치하면 메인
		} else {
			System.out.println("안돼 로그인 시켜줄 생각없어 돌아가");
			return new ModelAndView("/login"); // 틀리면 로그인화면
		}
	}
	

		
	
	
	
//	// test : login
//	@RequestMapping( value="login")
//	public @ResponseBody ModelAndView login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
//		
//		System.out.println("/user/login");
//		
//		ModelAndView mv= new ModelAndView();
//	
//		//Business Logic
//		User dbUser=userService.getUser(user.getUserId());
//		System.out.println(dbUser);
//		
//		if(user.getPassword().equals(dbUser.getPassword())){
//			session.setAttribute("user", dbUser);
//			mv.setViewName("/index");
//		} 
//		
//		System.out.println(session.getAttribute("user"));
//		return mv;
//	}
	
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
	
}
