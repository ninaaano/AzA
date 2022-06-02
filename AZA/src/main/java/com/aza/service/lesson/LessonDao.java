package com.aza.service.lesson;

import java.util.List;

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
	public List<Lesson> listLesson(Search search) throws Exception;
	
	//lessonBook : insert
	public void addLessonBook(Book book) throws Exception;
	
	//lessonBook : list
	public List<Book> listLessonBook(Search search) throws Exception;
	
	//lessonBook : delete
	public void deleteLessonBook(String isbn) throws Exception;
	
	
	public int getTotalCount(Search search) throws Exception;
	
	//schedule : add
	public void addLessonSchedule(Schedule schedule) throws Exception;
	
	//schedule : select
	public Schedule getLessonSchedule(int scheduleCode) throws Exception;
	
	//schedule : update
	public void updateLessonSchedule(Schedule schedule) throws Exception;
	
	//schedule : delete
	public Schedule deleteLessonSchedule(int scheudleCode) throws Exception;
	
	//schedule : list
	public List<Schedule> listLessonSchedule(Search search) throws Exception;
}
