package com.aza.students.test1.stduents;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
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
	
	@Test
	public void testListExam() throws Exception{
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		
		System.out.println("시작=====================");
		
		Map<String, Object> map = studentsService.listStudentsExam(search, "수학", "student21");
		System.out.println("listExam map ===> " + map);
		
		List<Object> list = (List<Object>)map.get("list");
		assertEquals(3,list.size());
		System.out.println("listExam check ===> " + list);
		
		System.out.println("listExam ====>> "+list);
		
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("listExam TotalCount ====>> " + totalCount);
		System.out.println("listExam 서치 ====>> " + search);
		
	}
}
