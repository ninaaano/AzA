package com.aza.service.students;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsDao3 {

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
