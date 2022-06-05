package com.aza.service.paper;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.Paper;

public interface PaperDao {
		//PaperQuiz :: INSERT
	
	
		//PaperQuiz :: SELECT
		
	
		//PaperQuiz :: UPDATE
	
	
		//PaperQuiz :: DELETE
	
	
		//PaperQuiz :: LIST
	
	
		//PaperQuiz :: TOTAL COUNT
	
	
		//PaperQuestion :: SELECT
	
	
		//PaperQuestion :: UPDATE
	
	
		//PaperQuestion :: DELETE
	
	
		//PaperFeedBack :: INSERT
	
	
		//PaperFeedBack :: DELETE
	
	
		//PaperFeedBack :: UPDATE
	
	
		//PaperSubmitAnswer :: UPDATE
	
	
		//PaperAnswerCheck :: UPDATE
	
	
	
		//========================================
		
		//PaperHomework :: INSERT
		public void addPaperHomework(Paper paper) throws Exception;
	
		//PaperHomework :: SELECT
		public Paper getPaperHomework(int homeworkCode) throws Exception;
	
		//PaperHomework :: UPDATE
		public void updatePaperHomework(Paper paper) throws Exception;
	
		//PaperHomework :: DELETE
		public void deletePaperHomework(int homeworkCode) throws Exception;
	
		//PaperHomework :: LIST
		public List<Paper> listPaperHomework(Search search, String studentId) throws Exception;
	
		//PaperHomework :: TOTAL COUNT
		public int getPaperHomeworkTotalCount(Search search, String studentId) throws Exception;
	
		//PaperHomeworkCheck :: UPDATE
		public void updatePaperHomeworkCheck(int homeworkCode) throws Exception;
}

