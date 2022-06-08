package com.aza.service.paper.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.paper.PaperDao2;
import com.aza.service.paper.PaperService2;



@Service
public class PaperServiceImpl2 implements PaperService2 {

	@Autowired
	@Qualifier("paperDaoImpl2")
	private PaperDao2 paperDao ;
	public void setPaperDao(PaperDao2 paperDao) {
		this.paperDao = paperDao;
	}
	
	
	
	public PaperServiceImpl2() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPaperQuiz(Paper paper) throws Exception {
		paperDao.addPaperQiuz(paper);
		
	}

	@Override
	public Paper getPaperQuiz(int quizCode) throws Exception {
		// TODO Auto-generated method stub
		return paperDao.getPaperQiuz(quizCode);
	}

	@Override
	public void updatePaperQuiz(Paper paper) throws Exception {
		// TODO Auto-generated method stub
		paperDao.updatePaperQuiz(paper);
	}

	@Override
	public void deletePaperQuiz(int quizCode) throws Exception {
		paperDao.deletePaperQuiz(quizCode);
		
	}

//	@Override
//	public Map<String, Object> listPaperQuiz(Search search) throws Exception {
//		
//		
//		List<Paper> list = paperDao.listPaperQuizTeacher(search);
//		int totalCount = paperDao.getPaperQuizTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("list", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		
//		return map;

//		// 수정해야함 ~.~

//	}



	@Override
	public Map<String, Object> listPaperQuizTeacher(Search search) throws Exception {
		List<Paper> list = paperDao.listPaperQuizTeacher(search);
		int totalCount = paperDao.getPaperQuizTotalCountTeacher(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
	}



	@Override
	public Map<String, Object> listPaperQuizStudent(Search search) throws Exception {
		
		List<Paper> list = paperDao.listPaperQuizStudent(search);
		int totalCount = paperDao.getPaperQuizTotalCountStudent(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		
		return map;
	}

	

}
