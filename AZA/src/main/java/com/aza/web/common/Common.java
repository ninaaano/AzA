package com.aza.web.common;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.service.domain.User;

@Controller
public class Common {

	public Common() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/")
	public @ResponseBody ModelAndView firstPageController() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/login");
		
		return mv;
	}
	
	@RequestMapping("/home")
	public @ResponseBody ModelAndView homeController(HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		String role = user.getRole();
		
		ModelAndView mv = new ModelAndView();
		
		if(role.equals("teacher")) {
			mv.setViewName("/common/home_teacher");
		}
		
		if(role.equals("student")) {
			mv.setViewName("/common/home_student");
		}
		
		if(role.equals("parent")) {
			mv.setViewName("/common/home_parent");
		}

		
		return mv;
	}
	
	// 부모님 -> 자녀관리
	@RequestMapping("/parent/kids") 
	public ModelAndView parentKidsController(HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/common/sub_bar_parent");
		mv.addObject("user", user);
		
		return mv;
		
	}

}
