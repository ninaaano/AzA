package com.aza.service.students.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.service.domain.Students;
import com.aza.service.students.StudentsDao2;

@Component
@PropertySource("classpath:/application.properties")
@Repository("studentsDaoImpl2")
public class StudentsDaoImpl2 implements StudentsDao2 {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSessionTemplate = sqlSession;
	}
	
	
	public StudentsDaoImpl2() {
		System.out.println(this.getClass());
	}

	@Override
	public void addStudentsCharacter(Students students) throws Exception {
		sqlSessionTemplate.insert("StudnetsCharacterMapper.addStudentsCharacter", students);
	}

	@Override
	public void updateStudentsCharacter(Students students) throws Exception {
		sqlSessionTemplate.update("StudetnsCharacterMapper.updateStudentsCharacter", students);

	}

	@Override
	public void deleteStudentsCharacter(int characterCode) throws Exception {
		sqlSessionTemplate.delete("StudetnsCharacterMapper.deleteStudentsCharacter", characterCode);

	}

	@Override
	public Students getStudentsCharacter(int characterCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("StudentsCharacterMapper.getStudentsCharacter", characterCode);
	}

	// exam =========================================
	@Override
	public void addStudentsExam(Students students) throws Exception {
		sqlSessionTemplate.insert("StudentsExamMapper.addStudentsExam", students);
		
	}


	@Override
	public void updateStudentsExam(Students students) throws Exception {
		sqlSessionTemplate.update("StudentsExamMapper.updateStudentsExam", students);
		
	}


	@Override
	public void deleteStudentsExam(int examCode) throws Exception {
		sqlSessionTemplate.delete("StudentsExamMapper.deleteStudentsExam", examCode);
		
	}


	@Override
	public Students getStudentsExam(int examCode) throws Exception {
		return sqlSessionTemplate.selectOne("StudentsExamMapper.getStudentsExam",examCode);
	}


}
