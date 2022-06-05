package com.aza.service.students;

import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsService3 {

	// StudentsNote :: INSERT
	public void addStudentsNote(Students students) throws Exception;

	// StudentsNote :: SELECT
	public Students getStudentsNote(int noteCode) throws Exception;

	// StudentsNote :: UPDATE
	public void updateStudentsNote(Students students) throws Exception;

	// StudentsNote :: DELETE
	public void deleteStudentsNote(int noteCode) throws Exception;

	// StudentsNote :: LIST
	public Map<String, Object> listStudentsNote(Search search, String studentId) throws Exception;

}
