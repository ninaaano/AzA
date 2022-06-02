package com.aza.service.students;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsDao {

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
	public List<Students> listProposalStudents(Search search, String teacherId) throws Exception;
	
	// STUDENT_RECORD :: Total Count - 승인 요청 중 (proposal 0)
	public int getProposalStudentsTotalCount(Search search, String teacherId) throws Exception;
	
	// STUDENT_RECORD :: LIST - 전체 학생 (proposal 2)
	public List<Students> listStudentsRecord(Search search, String teacherId) throws Exception;
	
	// STUDENT_RECORD :: Total Count - 전체 학생 (proposal 2)
	public int getStudentsRecordTotalCount(Search search, String teacherId) throws Exception;
	
	
	// ATTENDANCE :: INSERT
	public void addStudentsAttendance(Students students) throws Exception;
	
	// ATTENDANCE :: SELECT
	public Students getStudentsAttendance(int attendanceCode) throws Exception;
	
	// ATTENDANCE :: UPDATE
	public void updateStudentsAttendance(Students students) throws Exception;
	
	// ATTENDANCE :: DELETE
	public void deleteStudentsAttendance(int attendanceCode) throws Exception;
	
	// ATTENDANCE :: LIST
	public List<Students> listStudentsAttendance(Search search, String startMonth, String endMonth) throws Exception;
	
	// ATTENDANCE :: Total Count
	public int getStudentsAttendanceTotalCount(Search search, String startMonth, String endMonth) throws Exception;
	
}
