package com.aza.service.students;

import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsService3 {

	// ATTENDANCE :: INSERT
	public void addAttendance(Students students) throws Exception;

	// ATTENDANCE :: SELECT
	public Students getStudentsAttendance(int attendanceCode) throws Exception;

	// ATTENDANCE :: UPDATE
	public void updateStudentsAttendance(Students students) throws Exception;

	// ATTENDANCE :: DELETE
	public void deleteStudentsAttendance(int attendanceCode) throws Exception;

	// ATTENDANCE :: LIST
	public Map<String, Object> listStudentsAttendance(Search search, String startMonth, String endMonth) throws Exception;

}
