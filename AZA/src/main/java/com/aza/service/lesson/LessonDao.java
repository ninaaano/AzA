package com.aza.service.lesson;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;

public interface LessonDao {
	//lesson : insert
	public void addLesson(Lesson lesson) throws Exception;
	
	//lesson : select
	public Lesson getLesson(String lessonCode) throws Exception;
	
	//lesson : update
	public void updateLesson(Lesson lesson) throws Exception;
	
	//lesson : delete
	public void deleteLesson(String lessonCode) throws Exception;
	
	//lesson : list
	public List<Lesson> listLessonTeacher(Search search, String userID) throws Exception;
	
	public List<Lesson> listLessonStudent(Search search, String userID) throws Exception;
	
	public int getLessonTotalCount(Search search, String searchKeyword) throws Exception;
	
//=======================================================
	
	//lessonBook : insert
	public void addLessonBook(Lesson lesson) throws Exception;
	
	//lessonBook : list
	public List<Lesson> listLessonBook(Search search, String lessonCode) throws Exception;
	
	//lessonBook : delete
	public void deleteLessonBook(String isbn) throws Exception;
	
	public int getLeesonBookTotalCount(Search serach, String searchKeyword) throws Exception;
	//=======================================================	
	
	//schedule : add
	public void addLessonSchedule(Schedule schedule) throws Exception;
	
	//schedule : select
	public Schedule getLessonSchedule(int scheduleCode) throws Exception;
	
	//schedule : update
	public void updateLessonSchedule(Schedule schedule) throws Exception;
	
	//schedule : delete
	public void deleteLessonSchedule(int scheudleCode) throws Exception;
	
	//schedule : list
	public List<Schedule> listLessonSchedule(Search search, String teacherId) throws Exception;
	
	public int getLessonScheduleTotalCount(Search search, String searchKeyword) throws Exception;

}

