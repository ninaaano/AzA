package com.aza.students.test1.stduents;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService2;

@SpringBootTest
public class StuedentsExamTest {
	
	@Autowired
	@Qualifier("studentsServiceImpl2")
	private StudentsService2 studentsService;
	
	//@Test // get Test Ok
	public void testGetExam() throws Exception{
		
		Students stu = new Students();
		
		stu = studentsService.getStudentsExam(1002);
		System.out.println("Test ===========>>>> " + stu);
		
		
	}
	
	//@Test // add test Ok
	public void testAddExam() throws Exception{
		
		Students stu = new Students();
		stu.setStudentId("students21");
		stu.setExamYear("1111");
		stu.setExamSemester("2");
		stu.setExamTerm("2");
		stu.setExamSubject("테스트");
		stu.setExamScore(50);
		
		studentsService.addStudentsExam(stu);
		System.out.println(stu);
		
	}
	
	//@Test //update Test Ok
	public void testUpdateExam() throws Exception{
		
		Students stu = studentsService.getStudentsExam(1000);
		System.out.println("Code : 1000 Exam ==>> " + stu);
		stu.setExamSubject("!..update 테스트..!");
		stu.setExamScore(50);
		
		studentsService.updateStudentsExam(stu);
		
	}
	//@Test // delete Test Ok
	public void testDeleteExam() throws Exception{
		
		studentsService.deleteStudentsExam(1000);
	}
	
	public void testListExam() throws Exception{
		
		
	}
}
