package com.aza.service.paper;

import java.util.List;
import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Paper;

public interface PaperService2 {
	
	public void addPaperQuiz(Paper paper) throws Exception;
	
	public Paper getPaperQuiz(int quizCode) throws Exception;
	
	public void updatePaperQuiz(Paper paper) throws Exception;
	
	public void deletePaperQuiz(int quizCode) throws Exception;
	
	public Map<String, Object> listPaperQuizTeacher(Search search) throws Exception;
	public Map<String, Object> listPaperQuizStudent(Search search) throws Exception;
}
