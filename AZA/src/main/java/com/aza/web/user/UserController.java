package com.aza.web.user;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
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
		
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("/user/addUser : GET");
		
		//return "redirect:/user/addUserView.jsp";
		return modelAndView;
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public ModelAndView addUser( @ModelAttribute("user") User user ) throws Exception{
	
		System.out.println("/user/addUser : POST");
		userService.addUser(user);
		
		return new ModelAndView("redirect:/user/join.jsp");
	}	

	
	// test : login
	@RequestMapping( value="login")
	public @ResponseBody ModelAndView login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login");
		
		ModelAndView mv= new ModelAndView();
	
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		System.out.println(dbUser);
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		System.out.println(session.getAttribute("user"));
		
		mv.setViewName("/index");
		
		return mv;
	}
	
	@RequestMapping(value="getUser",method=RequestMethod.GET)
	public ModelAndView getUser (@RequestParam("userId")String userId) throws Exception{
		return new ModelAndView("/user/getUser","user",userService.getUser(userId));
	}
	
}
