package com.aza.service.test.students;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.alert.AlertService;
import com.aza.service.domain.Alert;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService;

@SpringBootTest
public class StudentsTest {

	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;

	@Autowired
	@Qualifier("alertServiceImpl")
	private AlertService alertService;


	// STUDNETS_RECORD

	//	@Test :: get
	public void testGetStudentsRecord() throws Exception {

		Students students = new Students();

		students = studentsService.getStudentsRecord(1023);

		System.out.println(students);

	}


//		@Test // :: add
	public void testAddStudentsRecord() throws Exception {

		Students students = new Students();

		students.setLessonCode("ABCD1234");
		students.setStudentId("student12");
		students.setLessonStartDate("2022/06/05"); //이거 통일시켜야할듯
		students.setFees(10000);
		students.setPayDueDate("30");

		System.out.println(students);

		studentsService.addStudentsRecord(students);

	}


	//	@Test // :: update
	public void testUpdateStudentsRecord() throws Exception {

		Students students = studentsService.getStudentsRecord(1023);

		students.setPayDueDate("20");

		System.out.println(students);

		studentsService.updateStudentsRecord(students);

	}


	//	@Test // :: proposal
	public void testProposalStudents() throws Exception {

		studentsService.proposalStudents(1041, '1'); // 승인

		System.out.println(studentsService.getStudentsRecord(1041));
	}


	//	@Test // :: delete
	public void testDeleteStudentsRecord() throws Exception {

		studentsService.deleteStudentsRecord(1040);

		System.out.println(studentsService.getStudentsRecord(1040));
	}


	//	@Test // :: listProposal (0 : 승인 요청중)
	public void testListProposalStudents() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		Map<String,Object> map = studentsService.listProposalStudents(search, "teacher1");

		List<Object> list = (List<Object>)map.get("list");

		System.out.println(list);

		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);

	}


//	@Test // :: listProposal (1 : 승인 요청완료)
	public void testListStudentsRecord() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		
		System.out.println("search"+search);
		
		Map<String,Object> map = studentsService.listStudentsRecord(search, "teacher1");

		List<Object> list = (List<Object>)map.get("list");

		System.out.println(list);

		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);

	}


	///////////////////////////////////////////////////////////////////////
	// ATTENDANCE

	//	@Test
	public void testGetStudentsAttendance() throws Exception {

		Students students = new Students();

		students = studentsService.getStudentsAttendance(1020);

		System.out.println(students);

	}

	//	@Test
	public void testAddStudentsAttendance() throws Exception {

		Students students = new Students();
		students.setStudentId("student11");
		students.setLessonCode("ABCD1234");
		students.setAttendanceDate("20220604");
		students.setAttendanceState("조퇴");

		System.out.println(students);

		studentsService.addAttendance(students);

	}

	@Test
	public void testUpdateStudentsAttendance() throws Exception {

		Students students = studentsService.getStudentsAttendance(1024);
		students.setAttendanceState("도망");

		studentsService.updateStudentsAttendance(students);

		System.out.println(studentsService.getStudentsAttendance(1024));

	}


	//	@Test
	public void testDeleteStudentsAttendance() throws Exception {

		studentsService.deleteStudentsAttendance(1023);

	}


//		@Test
	public void testListStudentsAttendance() throws Exception {

		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String,Object> map = studentsService.listStudentsAttendance(search, "student11", "ABCD1234", "2022/06/03", "2022/06/05");

		// between and => 초과 ~ 이하

		List<Object> list = (List<Object>)map.get("list");

		System.out.println(list);

		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);


	}


}
