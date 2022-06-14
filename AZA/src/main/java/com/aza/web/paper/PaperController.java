package com.aza.web.paper;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.domain.User;
import com.aza.service.paper.PaperService;
import com.aza.service.user.UserService;

@Controller
@RequestMapping("/paper/*")
public class PaperController {
	
	@Autowired
	@Qualifier("paperServiceImpl")
	private PaperService paperService; 
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PaperController() {
		System.out.println(this.getClass());
	}
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	//Quiz
	@RequestMapping(value="listPaperQuiz")
	public ModelAndView listPaperQuiz(@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		System.out.println("/paper/listPaperQuiz");
		
		String userId = ((User) session.getAttribute("user")).getUserId();
		
		User user = userService.getUser(userId);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = new HashMap();
		System.out.println("====>=>=>"+user.getRole());
		
		if(user.getRole().equals("student")) {
			map = paperService.listPaperQuizStudent(search, userId);
		}else if(user.getRole().equals("teacher")) {
			map = paperService.listPaperQuizTeacher(search, userId);
		}
		
		System.out.println("========================================================"+map.get("list"));
		System.out.println("========================================================"+(Integer)map.get("totalCount"));
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/paper/listPaperQuiz");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPaperQuiz", method=RequestMethod.GET)
	public ModelAndView addPaperQuiz(HttpSession session) throws Exception {
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("/paper/addPaperQuiz : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/paper/addPaperQuiz");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPaperQuiz", method=RequestMethod.POST)
	public ModelAndView addPaperQuiz(@ModelAttribute("paper") Paper paper) throws Exception {
		
		System.out.println("/paper/addPaperQuiz : POST");
		
		paperService.addPaperQuiz(paper);
//		paperService.addPaperQuestion(paper);
//		paperService.addPaperChoice(paper);
		
		System.out.println("==="+paper);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/paper/listPaperQuiz");
		
		return modelAndView;
	}
	
	
	
	
	//HOMEWORK
	@RequestMapping(value="listPaperHomework")
	public ModelAndView listPaperHomework(@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		System.out.println("/paper/listPaperHomework");
		
		String userId = ((User) session.getAttribute("user")).getUserId();
		
		User user = userService.getUser(userId);
		
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = new HashMap();
		System.out.println("====>=>=>"+user.getRole());
		
		if(user.getRole().equals("student")) {
			map = paperService.listPaperHomeworkByStudent(search, userId);
		}else if(user.getRole().equals("teacher")) {
			map = paperService.listPaperHomeworkByTeacher(search, userId);
		}

		
		System.out.println("========================================================"+map.get("list"));
		System.out.println("========================================================"+(Integer)map.get("totalCount"));
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/paper/listPaperHomework");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		
		return modelAndView;
	}
	
	@RequestMapping( value="addPaperHomework", method=RequestMethod.GET )
	public ModelAndView addPaperHomework() throws Exception{
	
		System.out.println("/paper/addPaperHomework : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/paper/addPaperHomework");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPaperHomework", method=RequestMethod.POST)
	public ModelAndView addPaperHomework(@ModelAttribute("paper") Paper paper) throws Exception {
	
		System.out.println("/students/addStudentsNote : POST");

		paperService.addPaperHomework(paper);
		
		System.out.println("==="+paper);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("redirect:/paper/listPaperHomework");		

		return modelAndView;
	}
	
	@RequestMapping(value="updatePaperHomework", method=RequestMethod.POST)
	public ModelAndView updatePaperHomework(@ModelAttribute("paper") Paper paper) throws Exception {
		
		System.out.println("/paper/updatePaperHomework : POST");
		// Business Logic
		paperService.updatePaperHomework(paper);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/paper/getPaperHomework?homeworkCode="+paper.getHomeworkCode());
		
		return modelAndView;
						
	}
	
	@RequestMapping(value="getPaperHomework", method=RequestMethod.GET)
	public ModelAndView getPaperHomework(@RequestParam("homeworkCode") int homeworkCode) throws Exception {

		System.out.println("paper/getPaperHomework : GET");
		
		Paper paper = paperService.getPaperHomework(homeworkCode);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("paper/getPaperHomework");
		modelAndView.addObject("paper", paper);
		
		System.out.println("===="+paper);
 
		return modelAndView;

	}
	
	@RequestMapping(value="deletePaperHomework")
	public ModelAndView deleteStudentsNote(@RequestParam("homeworkCode") int homeworkCode, HttpSession session) throws Exception {
		
		System.out.println("/deleteStudentsNote");
		String studentId = ((User) session.getAttribute("user")).getUserId();
		
		paperService.deletePaperHomework(homeworkCode);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/paper/listPaperHomework");
		
		return modelAndView;
	}
	
}
