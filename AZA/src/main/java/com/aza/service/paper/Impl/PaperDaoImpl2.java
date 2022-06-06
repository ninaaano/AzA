package com.aza.service.paper.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.paper.PaperDao2;

@Component
@PropertySource("classpath:/application.properties")
@Repository("paperDaoImpl2")
public class PaperDaoImpl2 implements PaperDao2 {

	@Autowired
	@Lazy
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	 public void setSqlSession(SqlSession sqlSession) {
		    this.sqlSession = sqlSession;
	}	
	
	public PaperDaoImpl2() {
		System.out.println(this.getClass());
	}

	@Override
	public Paper getPaperQiuz(int quizCode) throws Exception {
		
		return sqlSession.selectOne("QuizMapper.getPaperQuiz",quizCode);
	}

	@Override
	public void addPaperQiuz(Paper paper) throws Exception {
		sqlSession.insert("QuizMapper.addPaperQuiz", paper);

	}

	@Override
	public void updatePaperQuiz(Paper paper) throws Exception {
		sqlSession.update("QuizMapper.updatePaperQuiz", paper);

	}

	@Override
	public void deletePaperQuiz(int quizCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("QuizMapper.deletePaperQuiz",quizCode);

	}
//====================================================================
	@Override
	public List<Paper> listPaperQuiz(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("QuizMapper.listPaperQuiz", search);
	}

	@Override
	public int getPaperQuizTotalCount(Search serch) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QuizMapper.getPaperQuizTotalCount",serch);
	}

}
