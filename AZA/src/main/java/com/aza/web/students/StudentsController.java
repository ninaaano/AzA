package com.aza.web.students;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.students.StudentsService;

@Controller
@RequestMapping("/students/*")
public class StudentsController {
	
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;

	public StudentsController() {
		System.out.println(this.getClass());
	}
	
	@Value("${pagetUnit}")
	int pageUnit;

	@Value("${{pageSize}")
	int pageSize;
	
	
	@RequestMapping(value="listStudentsRecord")
	public ModelAndView listStudentsRecord(@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		System.out.println("/students/listStudentsRecord");
		
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> listMap = studentsService.listStudentsRecord(search, teacherId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// 승인완료 1 list
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/listStudentsRecord");
		mv.addObject("listStudentsRecord", listMap.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		
		// 승인요청 0 list
		search.setPageSize(50);
		search.setCurrentPage(1);		
		Map<String, Object> proposalMap = studentsService.listProposalStudents(search, teacherId);
		mv.addObject("listStudentsRecord", proposalMap.get("list"));
		
		return mv;			
	}

	
	@RequestMapping(value="addStudentsRecord", method=RequestMethod.POST)
	public ModelAndView addStudentsRecord(@ModelAttribute("students") Students students) throws Exception {
		
		System.out.println("/students/addStudentsRecord");
		
		studentsService.addStudentsRecord(students);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsRecord");
		
		return mv;
	}
	
}
