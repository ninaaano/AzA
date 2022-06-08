package com.aza.service.paper.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.paper.PaperDao;

@Component
@PropertySource("classpath:/application.properties")
@Repository("paperDaoImpl")
public class PaperDaoImpl implements PaperDao {
	
	///Field
	@Autowired
	@Lazy
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public PaperDaoImpl() {
		System.out.println(this.getClass());
	}
	

	@Override
	public void addPaperHomework(Paper paper) throws Exception {
		sqlSession.insert("HomeworkMapper.addPaperHomework",paper);
	}

	@Override
	public Paper getPaperHomework(int homeworkCode) throws Exception {
		return sqlSession.selectOne("HomeworkMapper.getPaperHomework", homeworkCode);
	}

	@Override
	public void updatePaperHomework(Paper paper) throws Exception {
		sqlSession.update("HomeworkMapper.updatePaperHomework", paper);
	}

	@Override
	public void deletePaperHomework(int homeworkCode) throws Exception {
		sqlSession.delete("HomeworkMapper.deletePaperHomework", homeworkCode);
	}

	@Override
	public List<Paper> listPaperHomeworkByStudent(Search search, String lessonCode, String studentId) throws Exception {
		search.setLessonCode(lessonCode);
		search.setSearchId(studentId);
		
		return sqlSession.selectList("HomeworkMapper.listPaperHomeworkByStudent", search);
	}



	@Override
	public void updatePaperHomeworkCheck(int homeworkCode) throws Exception {
		sqlSession.update("HomeworkMapper.updatePaperHomeworkCheck",homeworkCode);
		
	}

	@Override
	public List<Paper> listPaperHomeworkByTeacher(Search search, String lessonCode) throws Exception {
		search.setLessonCode(lessonCode);
		return sqlSession.selectList("HomeworkMapper.listPaperHomeworkByTeacher",search);
	}

	@Override
	public int getListPaperHomeworkByStudentTotalCount(Search search, String lessonCode, String studentId) throws Exception {
		search.setLessonCode(lessonCode);
		search.setSearchId(studentId);
		
		return sqlSession.selectOne("HomeworkMapper.getListPaperHomeworkByStudentTotalCount", search);
	}

	@Override
	public int getListPaperHomeworkByTeacherTotalCount(Search search, String lessonCode) throws Exception {
		search.setLessonCode(lessonCode);
		
		return sqlSession.selectOne("HomeworkMapper.getListPaperHomeworkByTeacherTotalCount", search);
	}
}
