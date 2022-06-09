package com.aza.web.students;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.students.StudentsService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/students/rest/*")
public class StudentsRestController {
	
	// field
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;

	public StudentsRestController() {
		System.out.println(this.getClass());
	}
	
	
	// STUDENTS_RECORD
	@RequestMapping("listStudentsRecord")
	public Map<String, Object> listStudentsRecord(HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listStudentsRecord");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listStudentsRecord(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
				
		return studentsService.listStudentsRecord(search, teacherId);		
	}
	
	
	// ATTENDANCE
	@RequestMapping("listStudentsAttendance")
	public ModelAndView listStudentsAttendance(@ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("/students/rest/listStudentsAttendance");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(30);
		
		Map<String, Object> map = studentsService.listStudentsAttendance(search, search.getSearchId(), search.getLessonCode(), search.getSearchStartDate(), search.getSearchEndDate());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/listAttendance");
		mv.addObject("list", map.get("list"));
		mv.addObject("resultPage", resultPage);
		
		return mv;
	}
	

	
	
	
	
}
