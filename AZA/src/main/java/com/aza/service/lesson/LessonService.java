package com.aza.service.lesson;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;

public interface LessonService {
	// lesson : insert
	public void addLesson(Lesson lesson) throws Exception;

	// lesson : select
	public Lesson getLesson(String lessonCode) throws Exception;

	// lesson : update
	public void updateLesson(Lesson lesson) throws Exception;

	// lesson : delete
	public void deleteLesson(String lessonCode) throws Exception;

	// lesson : list
	public Map<String, Object> listLessonTeacher(Search search,String userID) throws Exception;
	
	public Map<String, Object> listLessonStudent(Search search, String userID) throws Exception;
	
//	==============================================
	
	// book : add
	public void addLessonBook(Lesson lesson) throws Exception;
	
	// book : list
	public Map<String, Object> listLessonBook(Search search, String teacherId) throws Exception;
	
	// book : delete
	public void deleteLessonBook(String isbn) throws Exception;	
	
//	==============================================

	// schedule : add
	public void addLessonSchedule(Schedule schedule) throws Exception;

	// schedule : select
	public Schedule getLessonSchedule(int scheduleCode) throws Exception;

	// schedule : update
	public void updateLessonSchedule(Schedule schedule) throws Exception;

	// schedule : delete
	public void deleteLessonSchedule(int scheudleCode) throws Exception;

	// schedule : list teacher
	public Map<String, Object> listLessonSchedule(String teacherId) throws Exception;
	
	//schedule : lsit students
	public Map<String, Object> listLessonScheduleStudent(String studentId, String teacherId) throws Exception;
	
	//schedule : all delete
	public void deteteLessonScheduleAll() throws Exception;

}