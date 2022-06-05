package com.aza.service.students;

import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsService {

	// STUDENTS_RECORD :: INSERT
	public void addStudentsRecord(Students students) throws Exception;

	// STUDENTS_RECORD :: SELECT
	public Students getStudentsRecord(int recordCode) throws Exception;

	// STUDENTS_RECORD :: UPDATE 
	public void updateStudentsRecord(Students students) throws Exception;

	// STUDENTS_RECORD :: Proposal
	public void proposalStudents(int recordCode, char proposal) throws Exception;

	// STUDENTS_RECORD :: DELETE 
	public void deleteStudentsRecord(int recordCode) throws Exception;

	// STUDENT_RECORD :: LIST - 승인 요청 중 (proposal 0)
	public Map<String, Object> listProposalStudents(Search search, String teacherId) throws Exception;

	// STUDENT_RECORD :: LIST - 전체 학생 (proposal 2)
	public Map<String, Object> listStudentsRecord(Search search, String teacherId) throws Exception;

	
	// ATTENDANCE :: INSERT
	public void addAttendance(Students students) throws Exception;

	// ATTENDANCE :: SELECT
	public Students getStudentsAttendance(int attendanceCode) throws Exception;

	// ATTENDANCE :: UPDATE
	public void updateStudentsAttendance(Students students) throws Exception;

	// ATTENDANCE :: DELETE
	public void deleteStudentsAttendance(int attendanceCode) throws Exception;

	// ATTENDANCE :: LIST
	public Map<String, Object> listStudentsAttendance(Search search, String studentId, String lessonCode, String startMonth, String endMonth) throws Exception;

}
