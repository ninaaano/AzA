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
import com.aza.service.students.StudentsDao3;


@Component
@PropertySource("classpath:/application.properties")
@Repository("studentsDaoImpl3")
public class StudentsDaoImpl3 implements StudentsDao3 {

	// field
	@Autowired
	@Lazy
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	
	// ctor
	public StudentsDaoImpl3() {
		System.out.println("[ "+this.getClass()+" ] :: start");
	}
	
	
	// method
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSessionTemplate = sqlSession;
	}


	@Override
	public void addStudentsNote(Students students) throws Exception {
		sqlSessionTemplate.insert("StudentsNoteMapper.addStudentsNote", students);
	}


	@Override
	public Students getStudentsNote(int noteCode) throws Exception {
		return sqlSessionTemplate.selectOne("StudentsNoteMapper.getStudentsNote", noteCode);
	}


	@Override
	public void updateStudentsNote(Students students) throws Exception {
		sqlSessionTemplate.update("StudentsNoteMapper.updateStudentsNote", students);
	}


	@Override
	public void deleteStudentsNote(int noteCode) throws Exception {
		sqlSessionTemplate.delete("StudentsNoteMapper.deleteStudentsNote", noteCode);
	}


	@Override
	public List<Students> listStudentsNote(Search search, String studentId) throws Exception {
		search.setSearchId(studentId);
		return sqlSessionTemplate.selectList("StudentsNoteMapper.listStudentsNote", search);
	}


	@Override
	public int getStudentsNoteTotalCount(Search search, String studentId) throws Exception {
		search.setSearchId(studentId);
		return sqlSessionTemplate.selectOne("StudentsNoteMapper.getStudentsNoteTotalCount", search);
	}
	


}
