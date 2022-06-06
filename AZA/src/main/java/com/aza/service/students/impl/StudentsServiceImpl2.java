package com.aza.service.students.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao2;
import com.aza.service.students.StudentsService2;

@Service
public class StudentsServiceImpl2 implements StudentsService2 {

	@Autowired
	@Qualifier("studentsDaoImpl2")
	private StudentsDao2 studentsDao ;
	public void setStudentsDao(StudentsDao2 studentsDao) {
		this.studentsDao = studentsDao;
	}
	
	public StudentsServiceImpl2() {
		System.out.println(this.getClass());
	}

	@Override
	public void addStudentsCharacter(Students students) throws Exception {
		studentsDao.addStudentsCharacter(students);

	}

	@Override
	public void updateStudentsCharacter(Students students) throws Exception {
		studentsDao.updateStudentsCharacter(students);

	}

	@Override
	public void deleteStudentsCharacter(int characterCode) throws Exception {
		studentsDao.deleteStudentsCharacter(characterCode);

	}

	@Override
	public Students getStudentsCharacter(int characterCode) throws Exception {
		// TODO Auto-generated method stub
		return studentsDao.getStudentsCharacter(characterCode);
	}

	@Override
	public void addStudentsExam(Students students) throws Exception {
		studentsDao.addStudentsExam(students);
		
	}

	@Override
	public void updateStudentsExam(Students students) throws Exception {
		studentsDao.updateStudentsExam(students);
		
	}

	@Override
	public void deleteStudentsExam(int examCode) throws Exception {
		// TODO Auto-generated method stub
		studentsDao.deleteStudentsExam(examCode);
		
	}

	@Override
	public Students getStudentsExam(int examCode) throws Exception {
		
		return studentsDao.getStudentsExam(examCode);
	}

	@Override
	public Map<String, Object> listStudentsExam(Search search, String searchKeyword, String studentId) throws Exception {
	
		List<Students> list = studentsDao.listStudentsExam(search, searchKeyword, studentId);
		int totalCount = studentsDao.getStudentsExamTotalCount(search, searchKeyword, studentId);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}



}
