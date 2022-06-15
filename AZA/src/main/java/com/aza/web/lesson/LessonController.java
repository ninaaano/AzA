package com.aza.web.lesson;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;

//@CrossOrigin(origins = "*", allowedHeaders = "*")

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
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="addLessonView", method=RequestMethod.GET)
	public ModelAndView addLessonView() throws Exception{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/lesson/addLessonView");
		
		return model;
	}
	
	@RequestMapping(value="addLesson", method=RequestMethod.POST)
	public ModelAndView addLesson(@ModelAttribute("lesson") Lesson lesson) throws Exception{
		ModelAndView model = new ModelAndView();
		
		lessonService.addLesson(lesson);
		model.setViewName("redirect:/lesson/listLesson");
		
		return model;
	}
	
	@RequestMapping(value="listLesson")
	public ModelAndView listLesson(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		String role = ((User) session.getAttribute("user")).getRole();
		
		if(role.equals("teacher")) {
			String teacherId = ((User) session.getAttribute("user")).getUserId();
			Map<String, Object> map = lessonService.listLessonTeacher(search, teacherId);
			
			Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
			
			ModelAndView model = new ModelAndView();
			model.setViewName("/lesson/listLesson");
			model.addObject("list",map.get("list"));
			model.addObject("resultPage",resultPage);
			model.addObject("search",search);
		
			return model;
		} else {
			String userId = ((User) session.getAttribute("user")).getUserId();
			Map<String, Object> map = lessonService.listLessonStudent(search, userId);
			
			Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
			ModelAndView model = new ModelAndView();
			model.setViewName("/lesson/listLesson");
			model.addObject("list",map.get("list"));
			model.addObject("resultPage",resultPage);
			model.addObject("search",search);
		
			return model;
		}
	}
	
	@RequestMapping(value="getLesson")
	public ModelAndView getLesson(@RequestParam("lessonCode") String lessonCode) throws Exception{
		ModelAndView model = new ModelAndView();
		Lesson lesson = lessonService.getLesson(lessonCode);
		
		model.addObject("lesson", lesson);
		model.setViewName("/lesson/getLesson");
		return model;
	}
	
	@RequestMapping(value="updateLessonView")
	public ModelAndView updateLessonView(@RequestParam("lessonCode") String lessonCode) throws Exception {
		ModelAndView model = new ModelAndView();
		Lesson lesson = lessonService.getLesson(lessonCode);
		
		model.addObject("lesson",lesson);
		model.setViewName("/lesson/updateLessonView");
		return model;
	}
	
	@RequestMapping(value="udpateLesson")
	public ModelAndView updateLesson(@ModelAttribute("lesson") Lesson lesson) throws Exception{
		ModelAndView model = new ModelAndView();
		lessonService.updateLesson(lesson);
		model.setViewName("redirect:/lesson/getLesson");
		return model;
	}
	
	//delete
	@RequestMapping(value="deleteLesson")
	public ModelAndView deleteLesson(@RequestParam("lessonCode") String lessonCode) throws Exception{
		ModelAndView model = new ModelAndView();
		lessonService.deleteLesson(lessonCode);
		model.setViewName("redirect:/lesson/listLesson");
		return model;
	}
	
	@RequestMapping(value="manageLessonBook")
	public ModelAndView manageLessonBook(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
	
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
//		String role = ((User) session.getAttribute("user")).getRole();
				
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		Map<String, Object> map = lessonService.listLessonTeacher(search, teacherId);
		
		Page resultPage = new Page(search.getCurrentPage(),
				((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/lesson/manageLessonBook");
		model.addObject("list",map.get("list"));
		model.addObject("resultPage",resultPage);
		model.addObject("search",search);
		
		return model;
	}
	
	
	@RequestMapping("1")
	public ModelAndView chatbot() throws Exception{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/chatbot/chatbot");
		
		return model;
	}
	
}