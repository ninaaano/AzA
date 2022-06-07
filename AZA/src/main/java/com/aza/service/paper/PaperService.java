package com.aza.service.paper;

import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Paper;

public interface PaperService {
	
	//PaperQuiz :: INSERT
	
	
	//PaperQuiz :: SELECT
	
	
	//PaperQuiz :: UPDATE
	
	
	//PaperQuiz :: DELETE
	
	
	//PaperQuiz :: LIST 
	
	
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
	public Map<String, Object> listPaperHomeworkByStudent(Search search, String LessonCode, String StudentId) throws Exception;
	
	//PaperHomework :: LIST
	public Map<String, Object> listPaperHomeworkByTeacher(Search search, String LessonCode) throws Exception;
	
	//PaperHomeworkCheck :: UPDATE
	public void updatePaperHomeworkCheck(int homeworkCode) throws Exception;
	
}
