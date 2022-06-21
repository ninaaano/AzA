package com.aza.web.students;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	// STUDENTS_RECORD ::
	@RequestMapping("listStudentsRecord")
	public Map<String, Object> listStudentsRecord(HttpSession session, @RequestParam(required = false, value = "lessonCode") String lessonCode) throws Exception {
		
		System.out.println("/students/rest/listStudentsRecord");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listStudentsRecord(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		if(lessonCode != null && lessonCode.length() > 1) {
			
			search.setSearchCondition("2");
			search.setSearchKeyword(lessonCode);
			
		}
		return studentsService.listStudentsRecord(search, teacherId);			
	}
	
	// STUDENTS_RECORD ::
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
	
	// STUDENTS_RECORD ::
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
	@RequestMapping(value={"listStudentsAttendance/{month}/{year}/{date}", "listStudentsAttendance/{month}/{year}"},method= {RequestMethod.POST, RequestMethod.GET})
	public Map<String, Object> listStudentsAttendance(	@PathVariable("month") int month, 
														@PathVariable(required = false, value="year") String year,
														@RequestParam(required=false, value="date") Integer date,
														HttpSession session,
														@RequestParam(required = false, value="studentId") String studentId,
														@RequestParam(required = false, value="lessonCode") String lessonCode														
														) throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(31);
		
		if(date != null)  {
			
			System.out.println("/students/rest/listStudentsAttendance : teacherHome.js -> attendace ���� üũ");
			
			int prevDate = date -1;
			String searchStartDate = year + "/" + month + "/" + prevDate;
			String searchEndDate = year + "/" + month + "/" + date;
			
			return studentsService.listStudentsAttendance(search, studentId, lessonCode, searchStartDate, searchEndDate);	
		}
		
		System.out.println("/students/rest/listStudentsAttendance");
		
		LocalDate now = LocalDate.now();
		String prevMonth = Integer.toString(month - 1); 
		prevMonth = prevMonth.length() < 2 ? "0" + prevMonth : prevMonth;
		String curMonth = month < 10 ? "0" + Integer.toString(month) : Integer.toString(month);
		
		if(year == null) {
			year = Integer.toString(now.getYear());
		}
		
		String searchStartDate = year + "/" + prevMonth + "/31";
		String searchEndDate = year + "/" + curMonth + "/31";

		String userId = ((User) session.getAttribute("user")).getUserId();

		if(studentId==null || studentId.length() < 1) {
			List students = (List) session.getAttribute("students");
			studentId = ((User) students.get(0)).getFirstStudentId();			
		}
		
		System.out.println("studentId : "+studentId);
		
		if(lessonCode == null || lessonCode.length() < 1) {
			List lessons = (List) lessonService.listLessonStudent(search, studentId).get("list");
			lessonCode = ((Lesson)lessons.get(0)).getLessonCode();	
		}
		
		System.out.println("lessonCode : "+lessonCode);

		return studentsService.listStudentsAttendance(search, studentId, lessonCode, searchStartDate, searchEndDate);	
	}

	
	@RequestMapping(value="addStudentsAttendance", method=RequestMethod.POST)
	public Students addStudentsAttendance(@RequestBody Students student) throws Exception {
		
		studentsService.addStudentsAttendance(student);
		
		Search search = new Search(); 
		search.setCurrentPage(1);
		search.setPageSize(1);
		
		String date = student.getAttendanceDate();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");	
		Calendar cal = Calendar.getInstance();    
		Date tempDate = transFormat.parse(date);

		cal.setTime(tempDate);    
		cal.add(Calendar.DATE, -1);
		String startDate = transFormat.format(cal.getTime());
		
		List list =  (List) studentsService.listStudentsAttendance(search, student.getStudentId(), student.getLessonCode(), startDate, date).get("list");

		return (Students) list.get(0);		
	}
	
	@RequestMapping(value="updateStudentsAttendance", method= {RequestMethod.POST, RequestMethod.GET})
	public Students upStudentsAttendnace(@RequestBody Students student) throws Exception {
		

		System.out.println("/rest/updatestudentsAttendance : "+student);

		
		studentsService.updateStudentsAttendance(student);
		
		return studentsService.getStudentsAttendance(student.getAttendanceCode());
	
	}
	
	/*
	 * @RequestMapping(value="checkAttendanceValue"), method =
	 * 
	 */
	
	// Exam ===========================================
	@RequestMapping(value="listStudentsExam/subject")
	public List<String> listExamSubject(HttpSession session) throws Exception {
		System.out.println("listStudentsExam/subject Start...");
		
		User user = (User) session.getAttribute("user");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		search.setSearchId(user.getUserId());
		Map<String, Object> temp1 = studentsService.listStudentsExamByStudent(search);
		int totalCount = (int) temp1.get("totalCount");
		search.setPageSize(totalCount);
		
		Map<String, Object> temp2 = studentsService.listStudentsExamByStudent(search);
		List<Students> examList = (List<Students>) temp2.get("list");
		List<String> subjectList = new ArrayList<String>();
		for(Students data : examList) {
			String subject = data.getExamSubject();
			if(!subjectList.contains(subject)) {
				subjectList.add(subject);
			}
		}
		
		return subjectList;
		
	}
	
	
	@RequestMapping(value = "listStudentsExam")
	public Map<String, Object> listStudentsExam(HttpSession session, @RequestBody(required = false) Students students) throws Exception{
		
		System.out.println("listExam RestController Start...");

		User user = (User) session.getAttribute("user");
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		search.setSearchId(user.getUserId());
		//search.setPageSize(pageSize);
		Map<String, Object> temp1 = studentsService.listStudentsExamByStudent(search);
		int totalCount = (int) temp1.get("totalCount");
		search.setPageSize(totalCount);
		
		if(students == null || students.getExamSubject() == null || students.getExamSubject().length() < 1) {
			Students firstData = (Students) ((List) temp1.get("list")).get(0);
			search.setSearchKeyword(firstData.getExamSubject());
		} else {
			search.setSearchKeyword(students.getExamSubject());
		}
		
		/*
		 * Map<String, Object> temp2 = studentsService.listStudentsExam(search);
		 * List<Students> examList = (List<Students>) temp2.get("list"); List<String>
		 * subjectList = new ArrayList<String>(); for(Students data : examList) { String
		 * subject = data.getExamSubject(); if(!subjectList.contains(subject)) {
		 * subjectList.add(subject); } }
		 * 
		 * Map<String, Object> map = new HashMap<>();
		 */
		/*
		 * map.put("examList", examList); map.put("subjectList", subjectList);
		 */
		return studentsService.listStudentsExam(search);
	}

	
	@RequestMapping(value = "getStudentsExam/{examCode}")
	public Students getStudentsExam(@PathVariable int examCode) throws Exception{
		
		Students students = new Students();
		students = studentsService.getStudentsExam(examCode);
		
		return students;		
	}
	
	@RequestMapping(value = "addStudentsExam")
	public void addStudentsExam(@ModelAttribute("students") Students students) throws Exception{
		
		studentsService.addStudentsExam(students);	
	}
	
	@RequestMapping(value = "updateStudentsExam/{examCode}", method = RequestMethod.GET)
	public Students updateStudentsExam(@PathVariable int examCode) throws Exception{
		
		System.out.println("rest/updateStudentsExam :: GET");
		
		return studentsService.getStudentsExam(examCode);
	}
	
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
	
	@RequestMapping(value = "getStudentsCharacter/{characterCode}")
	public Students getStudentsCharacter(@PathVariable int characterCode) throws Exception{
		
		System.out.println("restGetStudentCharacter...");
		Students students = new Students();
		students = studentsService.getStudentsCharacter(characterCode);
		
		return students;		
	}
	
	@RequestMapping("listStudentsNote")
	public Map<String, Object> listStudentsNote(HttpSession session) throws Exception {
		
		Map result = null;
		System.out.println("/students/rest/listStudentsNote");
		
		User dbUser = (User) session.getAttribute("user");		
		String userId = dbUser.getUserId();
		
		User user = userService.getUser(userId);
		
		Search search = new Search();
		int totalCount;
		
		if(user.getRole().equals("student")) {
			totalCount = (int) studentsService.listStudentsNote(search, userId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);
			
			result = studentsService.listStudentsNote(search, userId);
			
		}
		
		return result;			
	}

	@RequestMapping(value = "getCheckStudentsCharacter")
	public ModelAndView getCheckStudentsCharacter
		(@ModelAttribute("search") Search search, Students students, ModelAndView mv, @RequestParam("studentId") String studentId, HttpSession session) throws Exception{
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		search.setSearchId(teacherId);
		search.setSearchKeyword(studentId);
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("teacherId => " + teacherId + " / ");
		System.out.println("studentId => " + studentId);

		// empty character
		if(studentsService.checkCharacterTotalCount(search) < 1) {
			// add list
			Map<String, Object> listMap = studentsService.listStudentsRecord(search, teacherId);
			System.out.println("check search Keyword=> " + search.getSearchKeyword() + "teacherId => " + teacherId);
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
			User userStudent = userService.getUser(studentId);
			mv.addObject("list", listMap.get("list"));
			mv.addObject("resultPage", resultPage);
			mv.addObject("search", search);
			mv.addObject("userStudent", userStudent);
			
		}else {
			// !empty character
			students = studentsService.getCheckStudentsCharacter(search);
			// get list
			Map<String, Object> list = studentsService.listStudentsCharacter(search);
			System.out.println("update list ==>> " + list);
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)list.get("totalCount")).intValue(), pageUnit, pageSize);

			mv.addObject("list", list.get("list"));
			mv.addObject("resultPage", resultPage);
			mv.addObject("search", search);
			mv.addObject("students",students);
			System.out.println("student Character ==> " + students);
			mv.setViewName("/students/getStudentsCharacter");
		}
		
		return mv;
	}
}