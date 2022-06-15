package com.aza.web.students;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;
import com.aza.service.students.StudentsService;
import com.aza.service.user.UserService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/students/rest/*")
public class StudentsRestController {
	
	// field
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;

	// field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;

	public StudentsRestController() {
		System.out.println(this.getClass());
	}
	
	
	// STUDENTS_RECORD :: 승인 완료된 학생들만
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
	
	// STUDENTS_RECORD :: 승인 요청된 학생들만
	@RequestMapping("listProposalStudents")
	public Map<String, Object> listProposalStudents(HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listProposalStudents");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listProposalStudents(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		return studentsService.listProposalStudents(search, teacherId);		
	}
	
	// STUDENTS_RECORD :: 승인 요청된 학생들만
	@RequestMapping("listTotalStudentsRecord")
	public Map<String, Object> listlistTotalStudentsRecord(HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listProposalStudents");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listTotalStudentsRecord(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		return studentsService.listTotalStudentsRecord(search, teacherId);		
	}
	
	
	// ATTENDANCE
	@RequestMapping(value="listStudentsAttendance/{month}", method=RequestMethod.POST)
	public Map<String, Object> listStudentsAttendance(@PathVariable("month") String month, HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listStudentsAttendance");
		
		LocalDate now = LocalDate.now();
		String searchStartDate = now.getYear() + "/" + month + "/01";
		String searchEndDate = now.getYear() + "/" + month + "/31";

		String userId = ((User) session.getAttribute("user")).getUserId();
		Search search = new Search();
		
		// 임시 => session으로 쓸거
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Map<String, Object> map = userService.listRelationByParent(search, userId);
		List students = (List) userService.listRelationByParent(search, userId).get("list");	
		
		String studentId = ((User) students.get(0)).getFirstStudentId();
		System.out.println("students : "+studentId);
		
		List lessons = (List) lessonService.listLessonStudent(search, studentId).get("list");
		String lessonCode = ((Lesson)lessons.get(0)).getLessonCode();
		System.out.println("lessons : "+lessonCode);
		
		//
		search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(31);

		return studentsService.listStudentsAttendance(search, studentId, lessonCode, searchStartDate, searchEndDate);	
	}

	// Exam ===========================================
	@RequestMapping(value = "manageStudentsExam")
	public Map<String,Object> listStudentsExam
	(HttpServletRequest request) throws Exception{
		
		System.out.println("listExam RestController Start...");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		
		Map<String, Object> map = studentsService.listStudentsExam(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		return map;
	}
	
	@RequestMapping(value = "getStudentsExam/{examCode}")
	public Students getStudentsExam(@PathVariable int examCode) throws Exception{
		
		Students students = new Students();
		students = studentsService.getStudentsExam(examCode);
		
		return students;		
	}
	
	// 수정시 저장된 값 뿌려주기(?)
	@RequestMapping(value = "updateStudentsExam/{examCode}", method = RequestMethod.GET)
	public Students updateStudentsExam(@PathVariable int examCode) throws Exception{
		
		System.out.println("rest/updateStudentsExam :: GET");
		
		return studentsService.getStudentsExam(examCode);
	}
	
	// 수정 method
	@RequestMapping(value = "updateStudentsExam/{examCode}", method = RequestMethod.POST)
	public Students updateStudentsExam(@RequestBody Students students) throws Exception{
		
		System.out.println("rest/updateStudentsExam :: POST");
		
		studentsService.updateStudentsExam(students);
		
		return students;		
	}
	
	@RequestMapping(value = "deleteStudentsExam/{ExamCode}")
	public void deleteStudentsExam(@PathVariable int examCode) throws Exception{
		
		studentsService.deleteStudentsExam(examCode);
	}
	
	
}
