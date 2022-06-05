package com.aza.service.test.students;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService3;



@SpringBootTest
public class StudentsTest3 {

	@Autowired
	@Qualifier("studentsServiceImpl3")
	private StudentsService3 studentsService3;

	
	//@Test
	public void testAddStudentsNote() throws Exception {
		
		Students students = new Students();
		
		students.setStudentId("student3");
		students.setNoteTitle("미적분");
		students.setNoteContent("미분도 어렵고 적분도 어렵다");
		
		studentsService3.addStudentsNote(students);
		System.out.println(students);

	}
	
	

	//@Test
	public void testGetStudentsNote() throws Exception {
		
		Students students = new Students();
		
		students = studentsService3.getStudentsNote(1001);
		
		System.out.println(students);
		
	}
	
	//@Test
	public void testUpdateStudentsNote() throws Exception {
		
		Students students = new Students();
		
		students.setNoteTitle("미분과적분");
		students.setNoteContent("미분은 어렵고 적분도 어렵당");
		students.setNoteCode(1003);
		
		studentsService3.updateStudentsNote(students);
	}
	
	//@Test
	public void testGetStudentsNoteListByStudentId() throws Exception {
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchId("student3");
		
		Map<String,Object> map = studentsService3.listStudentsNote(search, search.getSearchId());
		
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println(list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
		
		
	}
	
}
