package com.aza.service.students;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsDao3 {

	// StudentsNote :: INSERT
	public void addStudentsNote(Students students) throws Exception;
	
	// StudentsNote :: SELECT
	public Students getStudentsNote(int noteCode) throws Exception;
	
	// StudentsNote :: UPDATE
	public void updateStudentsNote(Students students) throws Exception;
	
	// StudentsNote :: DELETE
	public void deleteStudentsNote(int noteCode) throws Exception;
	
	// StudentsNote :: LIST
	public List<Students> listStudentsNote(Search search, String studentId) throws Exception;
	
	// StudentsNote :: Total Count
	public int getStudentsNoteTotalCount(Search search, String studentId) throws Exception;
	
}
