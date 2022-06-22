package com.aza.web.lesson;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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


@CrossOrigin(origins = "*", allowedHeaders = "*")
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
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
	int pageSize;
	
	@RequestMapping(value="addLessonView", method=RequestMethod.GET)
	public ModelAndView addLessonView() throws Exception{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/lesson/addLessonView");
		
		return model;
	}
	
	@RequestMapping(value="addLesson", method=RequestMethod.POST)
	public ModelAndView addLesson(@ModelAttribute("lesson") Lesson lesson, HttpSession session) throws Exception{
		ModelAndView model = new ModelAndView();
	
		String day = lesson.getLessonDay();
		String[] splitDay = day.split(",");
		String lessonDay = String.join("", splitDay);
		
		lesson.setLessonDay(lessonDay);		
		String teacherId = ((User)session.getAttribute("user")).getUserId();
		
		lesson.setTeacherId(teacherId);
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
	
	@RequestMapping(value="getLesson", method=RequestMethod.GET)
	public ModelAndView getLesson(@RequestParam("lessonCode") String lessonCode) throws Exception{
		System.out.println("==========");
		System.out.println("getLesson start.....");
		System.out.println("==========");
		
		ModelAndView model = new ModelAndView();
		Lesson lesson = lessonService.getLesson(lessonCode);
		
		model.addObject("lesson", lesson);
		model.setViewName("/lesson/getLesson");
		return model;
	}
	
	// 수업 수정
	@RequestMapping(value="updateLessonView", method=RequestMethod.GET)
	public ModelAndView updateLessonView(@RequestParam("lessonCode") String lessonCode) throws Exception {
		ModelAndView model = new ModelAndView();
		Lesson lesson = lessonService.getLesson(lessonCode);
		
		model.addObject("lesson",lesson);
		model.setViewName("/lesson/updateLessonView");
		return model;
	}
	
	// 수업 수정 후 화면
	@RequestMapping(value="udpateLesson", method=RequestMethod.POST)
	public ModelAndView updateLesson(@ModelAttribute("lesson") Lesson lesson) throws Exception{
		ModelAndView model = new ModelAndView();
		lessonService.updateLesson(lesson);
		model.setViewName("redirect:/lesson/getLesson?lessonCode="+lesson.getLessonCode());
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

		//lesson code와 lessonName 가져와야함		
		System.out.println("manageLessonBook실행");
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		String role = ((User) session.getAttribute("user")).getRole();
		if(role.equals("teacher")) {		
			String teacherId = ((User) session.getAttribute("user")).getUserId();
	//		System.out.println(teacherId);
			
			Map<String, Object> lessonName = lessonService.listBookTeacher(search, teacherId);
//			System.out.println("================");
//			System.out.println(lessonName);
//			System.out.println("================");
			Map<String, Object> map = lessonService.listLessonBook(search, teacherId);
//			System.out.println("================");
//			System.out.println(map);
//			System.out.println("================");
			
			Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
			
			ModelAndView model = new ModelAndView();
			model.setViewName("/lesson/manageLessonBook");
			model.addObject("book",lessonName.get("book"));
			model.addObject("list",map.get("list"));
			model.addObject("resultPage",resultPage);
			model.addObject("search",search);
			System.out.println(model);

			return model;
		}else {
			String userId = ((User) session.getAttribute("user")).getUserId();
			Map<String, Object> map = lessonService.listLessonBookStudetns(search, userId);
			
			Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(),pageUnit,pageSize);
			
			ModelAndView model = new ModelAndView();
			model.setViewName("/lesson/manageLessonBook");
			model.addObject("list",map.get("list"));
			model.addObject("resultPage",resultPage);
			model.addObject("search",search);
			System.out.println(model);
			
			return model;
		}
	}
	
	@RequestMapping(value="deleteLessonBook",method = RequestMethod.GET)
	public ModelAndView deleteLessonBook(@RequestParam(value="isbn",required=false) String isbn, HttpServletRequest request) throws Exception{
		System.out.println("===========");
		System.out.println("deleteLessonBook Controller");
		System.out.println("===========");
		System.out.println("isbn="+isbn);
		System.out.println("===========");
		String is = request.getParameter("isbn");
		System.out.println(is);
		
		lessonService.deleteLessonBook(isbn);
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:/lesson/manageLessonBook");
		
		return model;
	}
	
	@RequestMapping("1")
	public ModelAndView chatbot() throws Exception{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("/chatbot/chatbot");
		
		return model;
	}
	
	
}