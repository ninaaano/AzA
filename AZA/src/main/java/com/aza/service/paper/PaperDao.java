package com.aza.service.paper;

import java.util.List;
import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Paper;

public interface PaperDao {
		//PaperQuiz :: INSERT
	
	
		//PaperQuiz :: SELECT
		
	
		//PaperQuiz :: UPDATE
	
	
		//PaperQuiz :: DELETE
	
	
		//PaperQuiz :: LIST
	
	
		//PaperQuiz :: TOTAL COUNT
	
	
		//PaperQuestion :: INSERT
		public void addPaperQuestion(Paper paper) throws Exception;
		
		//PaperQuestion :: SELECT
		public Paper getPaperQuestion(int questionCode) throws Exception;
		
		//PaperQuestion :: UPDATE
		public void updatePaperQuestion(Paper paper) throws Exception;
		
		//PaperQuestion :: DELETE
		public void deletePaperQuestion(int questionCode) throws Exception;
		
		//PaperQuestion :: LIST
		public List<Paper> listPaperQuestion(int quizCode) throws Exception;
	
		//PaperFeedBack :: INSERT
	
	
		//PaperFeedBack :: DELETE
	
	
		//PaperFeedBack :: UPDATE
	
	
		//PaperSubmitAnswer :: UPDATE
	
	
		//PaperAnswerCheck :: UPDATE
	
		//Choice :: INSERT
		public void addPaperChoice(Paper paper) throws Exception;
		//Choice :: SELECT
		public Paper getPaperChoice(int choiceCode) throws Exception;
		//Choice :: UPDATE
		public void updatePaperChoice(Paper paper) throws Exception;
		//Choice :: DELETE
		public void deletePaperChoice(int choiceCode) throws Exception;
		//Choice :: LIST
		public List<Paper> listPaperChoice(int questionCode) throws Exception;
	
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
		public List<Paper> listPaperHomeworkByStudent(Search search, String lessonCode, String studentId) throws Exception;
		
		//PaperHomework :: LIST
		public List<Paper> listPaperHomeworkByTeacher(Search search, String lessonCode) throws Exception;
	
		//PaperHomework :: TOTAL COUNT
		public int getListPaperHomeworkByStudentTotalCount(Search search, String lessonCode, String studentId) throws Exception;

		//PaperHomework :: TOTAL COUNT
		public int getListPaperHomeworkByTeacherTotalCount(Search search, String studentId) throws Exception;
		
		//PaperHomeworkCheck :: UPDATE
		public void updatePaperHomeworkCheck(int homeworkCode) throws Exception;
}

