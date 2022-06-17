package com.aza.web.students;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;
import com.aza.service.students.StudentsService;
import com.aza.service.user.UserService;

@Controller
@RequestMapping("/students/*")
public class StudentsController {
	
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
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
	
	
	public StudentsController() {
		System.out.println(this.getClass());
	}
	
	// STUDENTS_RECORD
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
		
		//  1 list
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/listStudentsRecord");
		mv.addObject("listStudentsRecord", listMap.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		
		//  0 list
		search.setPageSize(50);	
		Map<String, Object> proposalMap = studentsService.listProposalStudents(search, teacherId);
		mv.addObject("listProposal", proposalMap.get("list"));
		
		return mv;			
	}
	
	@RequestMapping(value="/addStudentsRecord", method=RequestMethod.POST)
	public ModelAndView addStudentsRecord(@ModelAttribute("students") Students students, HttpSession session) throws Exception {
		
		System.out.println("/students/addStudentsRecord");
		
		User student = (User) session.getAttribute("user");
		String studentId = student.getUserId();
		
		students.setStudentId(studentId);
		
		System.out.println(students);
		studentsService.addStudentsRecord(students);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		
		return mv;
	}
	
	@RequestMapping(value="updateStudentsRecord", method=RequestMethod.POST)
	public ModelAndView updateStudentsRecord(@ModelAttribute("students") Students students) throws Exception {
		
		System.out.println("/students/updateStudentsRecord");
		
		studentsService.updateStudentsRecord(students);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/getStudentsRecord/"+students.getRecordCode());
		
		return mv;
	}
	
	@RequestMapping(value="getStudentsRecord/{recordCode}", method=RequestMethod.GET)
	public ModelAndView getStudentsRecord(@PathVariable("recordCode") int recordCode) throws Exception {
		
		System.out.println("/students/getStudentsRecord");
		
		Students student = studentsService.getStudentsRecord(recordCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/getStudentsRecord");
		mv.addObject("student", student);
		
		return mv;
	}
	
	@RequestMapping(value="deleteStudentsRecord/{recordCode}")
	public ModelAndView deleteStudentsRecord(@PathVariable("recordCode") int recordCode) throws Exception {
		
		System.out.println("/students/deleteStudentsRecord");
		
		studentsService.deleteStudentsRecord(recordCode);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsRecord");
		
		return mv;		
	}
	
	@RequestMapping(value="proposalStudents/{recordCode}/{proposal}")
	public ModelAndView proposalStudents(@PathVariable("recordCode") int recordCode, @PathVariable("proposal") char proposal) throws Exception {
		
		System.out.println("/students/proposalStudents");
		
		studentsService.proposalStudents(recordCode, proposal);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsRecord");
		
		return mv;	
	}
	
	
	// ATTENDANCE 
	@RequestMapping("addStudentsAttendance")
	public ModelAndView addStudentsAttendance(@RequestBody Students students, ModelAndView mv) throws Exception {
		
		System.out.println("/students/rest/addStudentsAttendance");
		
		studentsService.addStudentsAttendance(students);
		
	
		//ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsAttendance");
		
		return mv;
	}
	
	@RequestMapping("updateStudentsAttendance")
	public ModelAndView updateStudentsAttendance(@RequestBody Students students, ModelAndView mv) throws Exception {
		
		System.out.println("/students/rest/updateStudentsAttendance");
		
		studentsService.updateStudentsAttendance(students);
		
//		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsAttendance");
		
		return mv;
	}
	
	@RequestMapping("deleteStudentsAttendance")
	public ModelAndView deleteStudentsAttendance(@RequestParam("attendanceCode") int attendanceCode, ModelAndView mv) throws Exception {
		
		System.out.println("/students/rest/deleteStudentsAttendance");
		
		studentsService.deleteStudentsAttendance(attendanceCode);
		
		//ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/students/listStudentsAttendance");
		
		return mv;
	}
	
	@RequestMapping("getStudentsAttendance")
	public Students getStudentsAttendance(@RequestParam("attendanceCode") int attendanceCode) throws Exception {
		
		System.out.println("/students/rest/getStudentsAttendance");
		
		return studentsService.getStudentsAttendance(attendanceCode);
	}
	
	@RequestMapping("listStudentsAttendance")
	public ModelAndView listStudentsAttendance(@ModelAttribute("search") Search search, HttpSession session, @RequestParam(required = false) String studentId, @RequestParam(required = false) String lessonCode) throws Exception {
		
		System.out.println("/students/listStudentsAttendance");
		
		String searchStartDate = search.getSearchStartDate();
		String searchEndDate = search.getSearchEndDate();	
		
		System.out.println(search);

		// 
		if(search.getSearchStartDate() == null || search.getSearchStartDate().length() < 1) {
			LocalDate now = LocalDate.now();
			String prevMonth = Integer.toString(now.getMonthValue() - 1); 
			prevMonth = prevMonth.length() < 2 ? "0" + prevMonth : prevMonth;
			searchStartDate = now.format(DateTimeFormatter.ofPattern("yyyy/"+prevMonth+"/31"));
			searchEndDate = now.format(DateTimeFormatter.ofPattern("yyyy/MM/31"));			
		}
		

		String userId = ((User) session.getAttribute("user")).getUserId();
		List students = (List) session.getAttribute("students");

		// 임시 => session으로 쓸거
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(studentId == null) {
			studentId = ((User) students.get(0)).getFirstStudentId();			
		}
		
		User student = userService.getUser(studentId);

		System.out.println("student : "+student);
		
		List lessons = (List) lessonService.listLessonStudent(search, studentId).get("list");
		
		if(lessonCode == null) {
			lessonCode = ((Lesson)lessons.get(0)).getLessonCode();
		}

		System.out.println("lessonCode : "+lessonCode);
		
		search.setCurrentPage(1);
		search.setPageSize(31);
		
		Map<String, Object> map = studentsService.listStudentsAttendance(search, studentId, lessonCode, searchStartDate, searchEndDate);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/listStudentsAttendance");
		mv.addObject("listStudentsRecord", map.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		mv.addObject("students", students);
		mv.addObject("lessons", lessons);

		return mv;			
	}
	
	//========================>Note
	@RequestMapping( value="addStudentsNote", method=RequestMethod.GET )
	public ModelAndView addStudentsNote(HttpSession session) throws Exception{
		
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		
		
		System.out.println("/students/addStudentsNote : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/students/addStudentsNote");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addStudentsNote", method=RequestMethod.POST)
	public ModelAndView addStudentsNote(@ModelAttribute("students") Students students) throws Exception {
	
		System.out.println("/students/addStudentsNote : POST");

		studentsService.addStudentsNote(students);
		
		System.out.println("==="+students);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.setViewName("redirect:/students/listStudentsNote");		

		return modelAndView;
	}
	
	@RequestMapping(value="updateStudentsNote", method=RequestMethod.POST)
	public ModelAndView updateStudentsNote(@ModelAttribute("students") Students students) throws Exception {
		
		System.out.println("/studentst/updateStudentsNote : POST");
		// Business Logic
		studentsService.updateStudentsNote(students);
		
		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/students/getStudentsNote?NoteCode="+students.getNoteCode());
		modelAndView.setViewName("redirect:/students/listStudentsNote");
		
		return modelAndView;
						
	}
	
	@RequestMapping(value="getStudentsNote", method=RequestMethod.GET)
	public ModelAndView getStudentsNote(@RequestParam("noteCode") int noteCode) throws Exception {

		System.out.println("students/getStudentsNote : GET");
		
		Students students = studentsService.getStudentsNote(noteCode);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("students/getStudentsNote");
		modelAndView.addObject("students", students);
		
		System.out.println("===="+students);
 
		return modelAndView;

	}
	
	@RequestMapping(value="deleteStudentsNote")
	public ModelAndView deleteStudentsNote(@RequestParam("noteCode") int noteCode, HttpSession session) throws Exception {
		
		System.out.println("/deleteStudentsNote");
		String studentId = ((User) session.getAttribute("user")).getUserId();
		
		studentsService.deleteStudentsNote(noteCode);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/students/listStudentsNote");
		
		return modelAndView;
	}
	
	@RequestMapping(value="listStudentsNote")
	public ModelAndView listStudentsNote(@ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		System.out.println("/students/listStudentsNote");
		
		String studentId = ((User) session.getAttribute("user")).getUserId();
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> listMap = studentsService.listStudentsNote(search, studentId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/students/listStudentsNote");
		mv.addObject("list", listMap.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);		
		
		return mv;			
	}
	
	// CHARACTER testl===================================
	
	// CHARACTER test후 수정 ===================================
	// 단순 view연결
	@RequestMapping(value="addStudentsCharacter", method=RequestMethod.GET)
	public ModelAndView addStudentsCharacter
	(ModelAndView mv, HttpSession session, @ModelAttribute("search") Search search) throws Exception {
		

		System.out.println("/students/addStudentsCharacter :: GET ::단순 View");

		
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> listMap = studentsService.listStudentsRecord(search, teacherId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		mv.addObject("list", listMap.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		
		mv.setViewName("/students/addStudentsCharacter");

		
		return mv;		
	}
	
	// character add!
	@RequestMapping(value="addStudentsCharacter", method=RequestMethod.POST)
	public ModelAndView addStudentsCharacter
	(@ModelAttribute("students") Students students, ModelAndView mv, 
			HttpSession session) throws Exception {
		

		System.out.println("/students/addStudentsCharacter :: POST ::등록");

		String teacherId = ((User) session.getAttribute("user")).getUserId();
		students.setTeacherId(teacherId);
		
		studentsService.addStudentsCharacter(students);
		
		mv.setViewName("/students/getStudentsCharacter");
		mv.addObject("students",students);
		
		
		return mv;
	}
	
	@RequestMapping(value="updateStudentsCharacter", method=RequestMethod.GET)
	public ModelAndView updateStudentsCharacter(@RequestParam("characterCode") int characterCode,Students students,ModelAndView mv,HttpSession session) throws Exception {
		

		System.out.println("/students/updateStudentsCharacter :: GET :: 단순 VIEW");

		String teacherId = ((User) session.getAttribute("user")).getUserId();
		students.setTeacherId(teacherId);
		
		System.out.println("update characterCode => " + characterCode);
		
		studentsService.getStudentsCharacter(characterCode);

		mv.setViewName("/students/updateStudentsCharacter");
		
		return mv;		
	}
	
	@RequestMapping(value="updateStudentsCharacter", method=RequestMethod.POST)
	public ModelAndView updateStudentsCharacter(@ModelAttribute("students") Students students,ModelAndView mv,HttpSession session) throws Exception {
		

		System.out.println("/students/updateStudentsCharacter :: POST :: 수정하기");

		String teacherId = ((User) session.getAttribute("user")).getUserId();
		students.setTeacherId(teacherId);
		
		
		studentsService.updateStudentsCharacter(students);

		mv.setViewName("/students/updateStudentsCharacter");
		
		return mv;		
	}
	
	@RequestMapping(value="deleteStudentsCharacter")
	public ModelAndView deleteStudentsCharacter(@RequestParam("characterCode") int characterCode, ModelAndView mv, HttpSession session) throws Exception {
		
		System.out.println("/students/deleteStudentsCharacter");
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		Students students = new Students();
		students.setTeacherId(teacherId);
		
		
		System.out.println(characterCode);
		studentsService.deleteStudentsCharacter(characterCode);

		mv.setViewName("redirect:/students/addStudentsCharacter");
		
		return mv;		
	}
	
	
	
	@RequestMapping(value="getStudentsCharacter")
	public ModelAndView getStudentCharacter(@RequestParam("characterCode") int characterCode, ModelAndView mv) throws Exception{
		
		System.out.println("getStudentsCharacter ... ");
		
		Students students = studentsService.getStudentsCharacter(characterCode);
		mv.addObject("students",students);
		mv.setViewName("/students/getStudentsCharacter");
		System.out.println("Code Test ====>> " + characterCode);
		return mv;
	}
	
	// Exam
	@RequestMapping(value="manageStudentsExam")
	public ModelAndView listStudentsExam
	( @ModelAttribute("search") Search search, Model model, ModelAndView mv,HttpSession session) throws Exception{
		System.out.println("listStudentsExam Start...");
		
		String studentId = ((User) session.getAttribute("user")).getUserId();
		search.setSearchId(studentId);

		search.setSearchKeyword("수학");

		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);	
		
		Map<String, Object> map = studentsService.listStudentsExam(search);
		
		Page resultPage =  new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		mv.addObject("list", map.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		mv.setViewName("/students/manageStudentsExam");
		
		return mv;
	}

	
	
}
