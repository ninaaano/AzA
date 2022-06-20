package com.aza.web.message;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;
import com.aza.service.students.StudentsService;
import com.aza.service.user.UserService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/message/rest/*")
public class MessageRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;


	public MessageRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("listMessage")
	public List listMessage(HttpSession session) throws Exception {

		System.out.println("/message/rest/listMessage");

		List others = new ArrayList<>();

		User dbUser = (User) session.getAttribute("user");
		
		System.out.println(dbUser);

		others.add(dbUser);

		if (dbUser.getRole().equals("teacher")) {
			
			System.out.println("get message other List : teacher");

			String teacherId = dbUser.getUserId();

			Search search = new Search();
			int totalCount = (int) studentsService.listStudentsRecord(search, teacherId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);

			// others.add(teacherId);

			List<Students> studentsList = (List<Students>) studentsService.listStudentsRecord(search, teacherId).get("list");

			for (Students student : studentsList) {

				System.out.println(student + ": forStudent");
				String studentId = student.getStudentId();
				
				User studentInfo = userService.getUser(studentId);
				others.add(studentInfo);

				// search = new Search();
				totalCount = (int) userService.listRelationByStudent(search, studentId).get("totalCount");
				// search.setCurrentPage(1);
				search.setPageSize(totalCount);

				List<User> parentList = (List<User>) userService.listRelationByStudent(search, studentId).get("list");

				for (User parent : parentList) {

					User parentInfo = userService.getUser(parent.getUserId());
					parentInfo.setRelationName(parent.getRelationName());
					parentInfo.setFirstStudentId(studentId);

					others.add(parentInfo);
				}
			}

		}

		else if (dbUser.getRole().equals("student")) {
			
			System.out.println("get message other List : student");
			String studentId = dbUser.getUserId();
			Search search = new Search();
			int totalCount = (int) lessonService.listLessonStudent(search, studentId).get("totalCount");
			search.setCurrentPage(1);
			search.setPageSize(totalCount);
			
			List<Lesson> teacherList = (List<Lesson>) lessonService.listLessonStudent(search, studentId).get("list");
			
			for(Lesson lesson : teacherList) {
				System.out.println(lesson + ": forStudent");
				User teacher = userService.getUser(lessonService.getLesson(lesson.getLessonCode()).getTeacherId());
				others.add(teacher);
				
				// 선생님 아이디 나오면 수정할 부분 : 
				// others.add(teacher);
			}
		}

		else if (dbUser.getRole().equals("parent")) {

			System.out.println("get message other List : parent");
			String parentId = dbUser.getUserId();
			Search search = new Search();
			search.setCurrentPage(1);
			search.setPageSize(30);
			List<User> studentsList = (List) userService.listRelationByParent(search, parentId).get("list");
			
			for(User student : studentsList) {
				
				List<Lesson> teacherList = (List<Lesson>) lessonService.listLessonStudent(search, student.getFirstStudentId()).get("list");
				
				for(Lesson lesson : teacherList) {
					System.out.println(lesson + ": forStudent");
					User teacher = userService.getUser(lessonService.getLesson(lesson.getLessonCode()).getTeacherId());
					others.add(teacher);
				}
				
				
			}
			
			
		}

		return others;
	}

}
