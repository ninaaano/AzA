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

}
