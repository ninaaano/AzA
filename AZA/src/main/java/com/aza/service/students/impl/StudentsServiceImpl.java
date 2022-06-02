package com.aza.service.students.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao;
import com.aza.service.students.StudentsService;

public class StudentsServiceImpl implements StudentsService {

	@Autowired
	@Qualifier("studentsDaoImpl")
	private StudentsDao studentsDao;
	
	
	public StudentsServiceImpl() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}

	@Override
	public void addStudentsRecord(Students students) throws Exception {
		studentsDao.addStudentsRecord(students);
	}

	@Override
	public Students getStudentsRecord(int recordCode) throws Exception {
		return studentsDao.getStudentsRecord(recordCode);
	}

	@Override
	public void updateStudentsRecord(Students students) throws Exception {
		studentsDao.updateStudentsRecord(students);
	}

	@Override
	public void proposalStudents(int recordCode, char proposal) throws Exception {
		studentsDao.proposalStudents(recordCode, proposal);
	}

	@Override
	public void deleteStudentsRecord(int recordCode) throws Exception {
		studentsDao.deleteStudentsAttendance(recordCode);
	}

	@Override
	public Map<String, Object> listProposalStudents(Search search, String teacherId) throws Exception {
		List<Students> list = studentsDao.listProposalStudents(search, teacherId);
		int totalCount = studentsDao.getProposalStudentsTotalCount(search, teacherId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> listStudentsRecord(Search search, String teacherId) throws Exception {
		List<Students> list = studentsDao.listStudentsRecord(search, teacherId);
		int totalCount = studentsDao.getProposalStudentsTotalCount(search, teacherId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void addAttendance(Students students) throws Exception {
		studentsDao.addStudentsAttendance(students);
	}

	@Override
	public Students getStudentsAttendance(int attendanceCode) throws Exception {
		return studentsDao.getStudentsAttendance(attendanceCode);
	}

	@Override
	public void updateStudentsAttendance(Students students) throws Exception {
		studentsDao.updateStudentsAttendance(students);
	}

	@Override
	public void deleteStudentsAttendance(int attendanceCode) throws Exception {
		studentsDao.deleteStudentsAttendance(attendanceCode);

	}
	
	@Override
	public Map<String, Object> listStudentsAttendance(Search search, String startMonth, String endMonth) throws Exception {
		List<Students> list = studentsDao.listStudentsAttendance(search, startMonth, endMonth);
		int totalCount = studentsDao.getStudentsAttendanceTotalCount(search, startMonth, endMonth);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
}
