package com.aza.service.students.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	private SqlSession sqlSession;
	
	
	// ctor
	public StudentsDaoImpl() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}
	
	
	// method
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	@Override
	public void addStudentsRecord(Students students) throws Exception {
		sqlSession.insert("StudentsRecordMapper.addStduentsRecord", students);
	}

	@Override
	public Students getStudentsRecord(int recordCode) throws Exception {
		return sqlSession.selectOne("StudentsRecordMapper.getStduentsRecord", recordCode);
	}

	@Override
	public void updateStudentsRecord(Students students) throws Exception {
		sqlSession.update("StudentsRecordMapper.updateStduentsRecord", students);
	}

	@Override
	public void proposalStudents(int recordCode, char proposal) throws Exception {
		sqlSession.update("StudentsRecordMapper.propsalStudents");
	}

	@Override
	public void deleteStudentsRecord(int recordCode) throws Exception {
		sqlSession.delete("StudentsRecordMapper.deleteStduentsRecord", recordCode);
	}

	@Override
	public List<Students> listProposalStudents(Search search, String teacherId) throws Exception {		
		search.setSearchId(teacherId);		
		return sqlSession.selectList("StudentsRecordMapper.listProposalStudents", search);
		
	}
	@Override
	public int getProposalStudentsTotalCount(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		return sqlSession.selectOne("StudentsRecordMapper.getProposalStudentsTotalCount");
	}

	@Override
	public List<Students> listStudentsRecord(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		return sqlSession.selectList("StudentsRecordMapper.listStudentsRecord", search);
	}

	@Override
	public int getStudentsRecordTotalCount(Search search, String teacherId) throws Exception {
		search.setSearchId(teacherId);
		return sqlSession.selectOne("StudentsRecordMapper.getStudentsRecordTotalCount", search);
	}

	@Override
	public void addStudentsAttendance(Students students) throws Exception {
		sqlSession.insert("AttendanceMapper.addStudentsAttendance", students);
	}

	@Override
	public Students getStudentsAttendance(int attendanceCode) throws Exception {
		return sqlSession.selectOne("AttendanceMapper.getStudentsAttendance", attendanceCode);
	}

	@Override
	public void updateStudentsAttendance(Students students) throws Exception {
		sqlSession.update("AttendanceMapper.updateStudentsAttendance", students);
	}

	@Override
	public void deleteStudentsAttendance(int attendanceCode) throws Exception {
		sqlSession.delete("AttendanceMapper.deleteStudentsAttendance", attendanceCode);
	}

	@Override
	public List<Students> listStudentsAttendance(Search search, String startMonth, String endMonth) throws Exception {
		search.setSearchStartDate(startMonth);
		search.setSearchEndDate(endMonth);
		return sqlSession.selectList("AttendanceMapper.listStudentsAttendance", search);
	}

	@Override
	public int getStudentsAttendanceTotalCount(Search search, String startMonth, String endMonth) throws Exception {
		search.setSearchStartDate(startMonth);
		search.setSearchEndDate(endMonth);
		return sqlSession.selectOne("AttendanceMapper.getStudentsAttendanceTotalCount", search);
	}

}
