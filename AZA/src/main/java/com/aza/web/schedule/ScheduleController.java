package com.aza.web.schedule;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.domain.Schedule;
import com.aza.service.lesson.LessonService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	public ScheduleController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "manageLessonSchedule")
	public ModelAndView manageLessonSchedule(@ModelAttribute("search") Search search, HttpSession session ){
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/schedule/manageLessonSchedule");
		return model; 
	}

	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar";
		List<Schedule> schedule = null;
		try {
			schedule = lessonService.getSchedule();
			request.setAttribute("calendarList", schedule);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
}
