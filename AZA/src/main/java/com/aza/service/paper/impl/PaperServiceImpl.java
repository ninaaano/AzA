package com.aza.service.paper.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.paper.PaperDao;
import com.aza.service.paper.PaperService;

@Service("paperServiceImpl")
public class PaperServiceImpl implements PaperService {
	
	///Field
	@Autowired
	@Qualifier("paperDaoImpl")
	private PaperDao paperDao;
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}
	
	///Constructor
	public PaperServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPaperHomework(Paper paper) throws Exception {
		paperDao.addPaperHomework(paper);
	}

	@Override
	public Paper getPaperHomework(int homeworkCode) throws Exception {
		return paperDao.getPaperHomework(homeworkCode);
	}

	@Override
	public void updatePaperHomework(Paper paper) throws Exception {
		paperDao.updatePaperHomework(paper);
	}

	@Override
	public void deletePaperHomework(int homeworkCode) throws Exception {
		paperDao.deletePaperHomework(homeworkCode);
	}

	@Override
	public Map<String, Object> listPaperHomework(Search search, String StudentId) throws Exception {
		
		List<Paper> list = paperDao.listPaperHomework(search, StudentId);
		int totalCount = paperDao.getPaperHomeworkTotalCount(search, StudentId);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updatePaperHomeworkCheck(int homeworkCode) throws Exception {
		paperDao.updatePaperHomeworkCheck(homeworkCode);
	}
	
	
}
