package com.aza.service.students;

import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Students;

public interface StudentsService2 {

	// character ======================================================
	//  INSERT
	public void addStudentsCharacter(Students students) throws Exception;
	
	//  UPDATE
	public void updateStudentsCharacter(Students students) throws Exception;
	
	// DELETE
	public void deleteStudentsCharacter(int characterCode) throws Exception;
	
	//  SELECT
	public Students getStudentsCharacter(int characterCode) throws Exception;
	
	// exam =======================================================
	// INSERT
	public void addStudentsExam(Students students) throws Exception;
	
	// UPDATE
	public void updateStudentsExam(Students students) throws Exception;
	
	// DELETE
	public void deleteStudentsExam(int examCode) throws Exception;
	
	// SELECT
	public Students getStudentsExam(int examCode) throws Exception;
	
	
	
	
	
	
}
