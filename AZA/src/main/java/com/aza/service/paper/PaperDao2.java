package com.aza.service.paper;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.Paper;

public interface PaperDao2 {
	
	public Paper getPaperQiuz(int quizCode) throws Exception; 
	
	public void addPaperQiuz(Paper paper) throws Exception;
	
	public void updatePaperQuiz(Paper paper) throws Exception;
	
	public void deletePaperQuiz(int quizCode) throws Exception;
	
	public List<Paper> listPaperQuizTeacher(Search search) throws Exception;
	
	public List<Paper> listPaperQuizStudent(Search search) throws Exception;

	public int getPaperQuizTotalCountTeacher(Search serch)throws Exception;
	public int getPaperQuizTotalCountStudent(Search serch)throws Exception;
	
	
}
