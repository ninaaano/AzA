package com.aza.web.lesson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aza.service.lesson.LessonService;

@Controller
@RequestMapping("/lesson/*")
public class LessonController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	public LessonController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="addLesson", method=RequestMethod.GET )
	public String addLesson() throws Exception{
		System.out.println("/lesson/addLesson : GET");
		
		return "redirect:/lesson/addLessonView.jsp";
	}
}