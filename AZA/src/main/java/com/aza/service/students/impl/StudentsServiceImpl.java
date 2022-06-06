package com.aza.service.students.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.alert.AlertDao;
import com.aza.service.domain.Alert;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao;
import com.aza.service.students.StudentsService;

@Service("studentsServiceImpl")
public class StudentsServiceImpl implements StudentsService {

	@Autowired
	@Qualifier("studentsDaoImpl")
	private StudentsDao studentsDao;

	@Autowired
	@Qualifier("alertDaoImpl")
	private AlertDao alertDao;

	public StudentsServiceImpl() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}

	public void setStudentsDao(StudentsDao studentsDao) {
		this.studentsDao = studentsDao;
	}

	public void setAlertDao(AlertDao alertDao) {
		this.alertDao = alertDao;
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
		studentsDao.deleteStudentsRecord(recordCode);
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
		int totalCount = studentsDao.getStudentsRecordTotalCount(search, teacherId);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void addAttendance(Students students) throws Exception {
		studentsDao.addStudentsAttendance(students);

		String attendanceState = students.getAttendanceState();

		if(attendanceState.equals("출석")) {
			
			//User user = userService.getUser("student11");
			
			
			
			
			Alert alert = new Alert();
			alert.setReceiverId(students.getStudentId());
			alert.setLessonCode(students.getLessonCode());
			alert.setAlertContent(students.getAttendanceState());

			alertDao.addAlert(alert);				
		}
	}

	@Override
	public Students getStudentsAttendance(int attendanceCode) throws Exception {
		return studentsDao.getStudentsAttendance(attendanceCode);
	}

	@Override
	public void updateStudentsAttendance(Students students) throws Exception {
		studentsDao.updateStudentsAttendance(students);

		String attendanceState = students.getAttendanceState();

		if(attendanceState.equals("도망") || attendanceState.equals("조퇴")) {
			Alert alert = new Alert();
			alert.setReceiverId(students.getStudentId());
			alert.setLessonCode(students.getLessonCode());
			alert.setAlertContent(students.getAttendanceState());

			alertDao.addAlert(alert);				
		}
	}

	@Override
	public void deleteStudentsAttendance(int attendanceCode) throws Exception {
		studentsDao.deleteStudentsAttendance(attendanceCode);

	}

	@Override
	public Map<String, Object> listStudentsAttendance(Search search, String studentId, String lessonCode, String startMonth, String endMonth) throws Exception {
		List<Students> list = studentsDao.listStudentsAttendance(search, studentId, lessonCode, startMonth, endMonth);
		int totalCount = studentsDao.getStudentsAttendanceTotalCount(search, studentId, lessonCode, startMonth, endMonth);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));

		return map;
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
	
	@Override
	public void addStudentsNote(Students students) throws Exception {
		studentsDao.addStudentsNote(students);
	}

	@Override
	public Students getStudentsNote(int noteCode) throws Exception {
		return studentsDao.getStudentsNote(noteCode);
	}

	@Override
	public void updateStudentsNote(Students students) throws Exception {
		studentsDao.updateStudentsNote(students);
	}

	@Override
	public void deleteStudentsNote(int noteCode) throws Exception {
		studentsDao.deleteStudentsNote(noteCode);
	}

	@Override
	public Map<String, Object> listStudentsNote(Search search, String studentId) throws Exception {
		List<Students> list = studentsDao.listStudentsNote(search, studentId);
		int totalCount = studentsDao.getStudentsNoteTotalCount(search, studentId);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
}
