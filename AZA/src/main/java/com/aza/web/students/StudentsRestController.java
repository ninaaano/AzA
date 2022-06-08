package com.aza.web.students;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
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
	

	public StudentsRestController() {
		System.out.println(this.getClass());
	}
	
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
}
