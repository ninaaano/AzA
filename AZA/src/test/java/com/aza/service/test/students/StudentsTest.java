package com.aza.service.test.students;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService;

@SpringBootTest
public class StudentsTest {

	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
	
	// STUDENTS_RECORD
	//@Test
	public void testGetStudentsRecord() throws Exception {
		
		Students students = new Students();
		
		students = studentsService.getStudentsRecord(1023);
		
		System.out.println(students);

	}
	
	
	
	
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
}
