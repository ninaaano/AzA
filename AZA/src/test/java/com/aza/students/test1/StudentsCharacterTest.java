package com.aza.students.test1;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService2;

@SpringBootTest
public class StudentsCharacterTest {
	
	@Autowired
	@Qualifier("studentsServiceImpl2")
	private StudentsService2 studentsService;
	
	// @Test //get Test OK
	public void testGetCharacter() throws Exception{
		
		Students students = new Students();
		
		students = studentsService.getStudentsCharacter(1002);
		//Assert.assertEquals("student21", students.getStudentId());
		System.out.println(students);
		
	}
	
	//@Test // add Test OK
	public void testAddCharacter() throws Exception{
		
		Students students = new Students();
		students.setStudentId("studetns21");
		students.setTeacherId("teacher2");
		students.setCharacterContent("Test_Content!!");
		
		
		
		
		studentsService.addStudentsCharacter(students);
		System.out.println(students);
		
	}
	
	//@Test //update test OK
	public void testUpdateCharacter() throws Exception{
		
		Students stu = new Students();
		stu.setCharacterCode(1003);
		stu.setCharacterContent("Update Test!");
		
		studentsService.updateStudentsCharacter(stu);
		
	}
	
	@Test // delete Test OK
	public void testDeleteCharacter() throws Exception{
				
		studentsService.deleteStudentsCharacter(1003);
	}
}
