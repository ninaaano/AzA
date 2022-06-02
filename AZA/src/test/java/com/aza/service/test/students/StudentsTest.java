package com.aza.service.test.students;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.alert.AlertService;
import com.aza.service.domain.Alert;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService;

@SpringBootTest
public class StudentsTest {

	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
<<<<<<< HEAD
	
	// STUDENTS_RECORD
	//@Test
=======
	@Autowired
	@Qualifier("alertServiceImpl")
	private AlertService alertService;
	
//	@Test
>>>>>>> refs/heads/HM
	public void testGetStudentsRecord() throws Exception {
		
		Students students = new Students();
		
		students = studentsService.getStudentsRecord(1023);
		
		System.out.println(students);

	}
	
	
<<<<<<< HEAD
	
	
	// ATTENDANCE
	@Test
	public void testGetStudentsAttendance() throws Exception {
		
		Students students = new Students();
		
		students = studentsService.getStudentsAttendance(1020);
		
		System.out.println(students);
	}
	
	
	//@Test
	public void testAddStudentsAttendance() throws Exception {
		
	}
=======
//	@Test
	public void testGetStudentsAttendance() throws Exception {
		
		Students students = new Students();
		
		students = studentsService.getStudentsAttendance(1020);
		
		System.out.println(students);
		
	}
	
	@Test
	public void testAddStudentsAttendance() throws Exception {
		
		Students students = new Students();
		students.setStudentId("student11");
		students.setLessonCode("ABCD1234");
		students.setAttendanceDate("20220601");
		students.setAttendanceState("출석");
		
		System.out.println(students);
		
		studentsService.addAttendance(students);
		
	}
	
	
	//@Test
	public void testGetAlert() throws Exception {
		
		Alert alert = new Alert();
		
		alert = alertService.getAlert(1020);
		
		System.out.println(alert);
	}
	
	
	
	
	
>>>>>>> refs/heads/HM
}
