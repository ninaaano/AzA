package com.aza.service.students.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao;

@Component
@PropertySource("classpath:/application.properties")
@Repository("studentsDaoImpl")
public class StudentsDaoImpl implements StudentsDao {

	// field
	@Autowired
	@Lazy
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	
	// ctor
	public StudentsDaoImpl() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}
	
	
	// method
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSessionTemplate = sqlSession;
	}
	

	@Override
	public void addStudentsRecord(Students students) throws Exception {
		sqlSessionTemplate.insert("StudentsRecordMapper.addStudentsRecord", students);
	}

	@Override
	public Students getStudentsRecord(int recordCode) throws Exception {
		return sqlSessionTemplate.selectOne("StudentsRecordMapper.getStudentsRecord", recordCode);
	}

	@Override
	public void updateStudentsRecord(Students students) throws Exception {
		sqlSessionTemplate.update("StudentsRecordMapper.updateStudentsRecord", students);
	}

	@Override
	public void proposalStudents(int recordCode, char proposal) throws Exception {
		
		Students students = new Students();
		students.setRecordCode(recordCode);
		students.setProposal(proposal);
		
		sqlSessionTemplate.update("StudentsRecordMapper.proposalStudents", students);
	}

	@Override
	public void deleteStudentsRecord(int recordCode) throws Exception {
		sqlSessionTemplate.delete("StudentsRecordMapper.deleteStudentsRecord", recordCode);
	}

	@Override
	public List<Students> listProposalStudents(Search search, String teacherId) throws Exception {		
		search.setSearchId(teacherId);		
		return sqlSessionTemplate.selectList("StudentsRecordMapper.listProposalStudents", search);
		
	}
	@Override
	public int getProposalStudentsTotalCount(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		return sqlSessionTemplate.selectOne("StudentsRecordMapper.getProposalStudentsTotalCount", search);
	}

	@Override
	public List<Students> listStudentsRecord(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		System.out.println(search);
		return sqlSessionTemplate.selectList("StudentsRecordMapper.listStudentsRecord", search);
	}

	@Override
	public int getStudentsRecordTotalCount(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		System.out.println(search);
		return sqlSessionTemplate.selectOne("StudentsRecordMapper.getStudentsRecordTotalCount", search);
	}

	@Override
	public void addStudentsAttendance(Students students) throws Exception {
		sqlSessionTemplate.insert("AttendanceMapper.addStudentsAttendance", students);
	}

	@Override
	public Students getStudentsAttendance(int attendanceCode) throws Exception {
		return sqlSessionTemplate.selectOne("AttendanceMapper.getStudentsAttendance", attendanceCode);
	}

	@Override
	public void updateStudentsAttendance(Students students) throws Exception {
		sqlSessionTemplate.update("AttendanceMapper.updateStudentsAttendance", students);
	}

	@Override
	public void deleteStudentsAttendance(int attendanceCode) throws Exception {
		sqlSessionTemplate.delete("AttendanceMapper.deleteStudentsAttendance", attendanceCode);
	}

	@Override
	public List<Students> listStudentsAttendance(Search search, String studentId, String lessonCode, String startMonth, String endMonth) throws Exception {
		search.setLessonCode(lessonCode);
		search.setSearchId(studentId);
		search.setSearchStartDate(startMonth);
		search.setSearchEndDate(endMonth);
		return sqlSessionTemplate.selectList("AttendanceMapper.listStudentsAttendance", search);
	}

	@Override
	public int getStudentsAttendanceTotalCount(Search search, String studentId, String lessonCode, String startMonth, String endMonth) throws Exception {	
		search.setLessonCode(lessonCode);
		search.setSearchId(studentId);
		search.setSearchStartDate(startMonth);
		search.setSearchEndDate(endMonth);
		return sqlSessionTemplate.selectOne("AttendanceMapper.getStudentsAttendanceTotalCount", search);
	}

}
