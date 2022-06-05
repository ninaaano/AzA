package com.aza.service.students.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao3;
import com.aza.service.students.StudentsService3;


@Service("studentsServiceImpl3")
public class StudentsServiceImpl3 implements StudentsService3 {

	@Autowired
	@Qualifier("studentsDaoImpl3")
	private StudentsDao3 studentsDao3;
	
	
	public StudentsServiceImpl3() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}
	
	public void setStudentsDao(StudentsDao3 studentsDao3) {
		this.studentsDao3 = studentsDao3;
	}

	@Override
	public void addStudentsNote(Students students) throws Exception {
		studentsDao3.addStudentsNote(students);
	}

	@Override
	public Students getStudentsNote(int noteCode) throws Exception {
		return studentsDao3.getStudentsNote(noteCode);
	}

	@Override
	public void updateStudentsNote(Students students) throws Exception {
		studentsDao3.updateStudentsNote(students);
	}

	@Override
	public void deleteStudentsNote(int noteCode) throws Exception {
		studentsDao3.deleteStudentsNote(noteCode);
	}

	@Override
	public Map<String, Object> listStudentsNote(Search search, String studentId) throws Exception {
		List<Students> list = studentsDao3.listStudentsNote(search, studentId);
		int totalCount = studentsDao3.getStudentsNoteTotalCount(search, studentId);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}


	
	
}
