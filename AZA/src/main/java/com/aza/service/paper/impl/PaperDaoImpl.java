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
		sqlSession.insert("PaperHomeworkMapper.addPaperHomework",paper);
	}

	@Override
	public Paper getPaperHomework(int homeworkCode) throws Exception {
		return sqlSession.selectOne("PaperHomeworkMapper.getPaperHomework", homeworkCode);
	}

	@Override
	public void updatePaperHomework(Paper paper) throws Exception {
		sqlSession.update("PaperHomeworkMapper.updatePaperHomework", paper);
	}

	@Override
	public void deletePaperHomework(int homeworkCode) throws Exception {
		sqlSession.delete("PaperHomeworkMapper.deletePaperHomework", homeworkCode);
	}

	@Override
	public List<Paper> listPaperHomework(Search search, String lessonCode, String studentId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lessonCode", search.getLessonCode());
		map.put("studentId", studentId);
		
		return sqlSession.selectList("PaperHomeworkMapper.listPaperHomework", map);
	}

	@Override
	public int getPaperHomeworkTotalCount(Search search, String studentId) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updatePaperHomeworkCheck(int homeworkCode) throws Exception {
		sqlSession.update("PaperHomeworkMapper.updatePaperHomework",homeworkCode);
		
	}
}
