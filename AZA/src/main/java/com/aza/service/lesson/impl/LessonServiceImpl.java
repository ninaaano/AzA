package com.aza.service.lesson.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;
import com.aza.service.lesson.LessonDao;
import com.aza.service.lesson.LessonService;


@Service("lessonServiceImpl")
public class LessonServiceImpl implements LessonService {

	@Autowired
	@Qualifier("lessonDaoImpl")
	private LessonDao lessonDao;
	public void setLessonDao(LessonDao lessonDao) {
		this.lessonDao = lessonDao;
	}
	
	public LessonServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("====lessonServiceImpl=====");
		System.out.println(this.getClass());
	}

	@Override
	public void addLesson(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.addLesson(lesson);
	}

	@Override
	public Lesson getLesson(String lessonCode) throws Exception {
		// TODO Auto-generated method stub
		return lessonDao.getLesson(lessonCode);
	}

	@Override
	public void updateLesson(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.updateLesson(lesson);
	}

	public void deleteLesson(String lessonCode) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.deleteLesson(lessonCode);
	}

	@Override
	public Map<String, Object> listLessonTeacher(Search search,String userID) throws Exception {
		// TODO Auto-generated method stub 
		
		List<Lesson> list = lessonDao.listLessonTeacher(search, userID);
		int totalCount = lessonDao.getLessonTotalCount(search, userID);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public Map<String, Object> listLessonStudent(Search search, String userId) throws Exception{
		List<Lesson> list = lessonDao.listLessonStudent(search, userId);
		int totalCount = lessonDao.getLessonTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	//=================================================
	
	@Override
	public void addLessonBook(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.addLessonBook(lesson);
	}

	@Override
	public Map<String, Object> listLessonBook(Search search, String teacherId) throws Exception {
		// TODO Auto-generated method stub
		List<Lesson> list =  lessonDao.listLessonBook(search,teacherId);
		int totalCount = lessonDao.getLeesonBookTotalCount(search,teacherId);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void deleteLessonBook(String isbn) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.deleteLessonBook(isbn);
	}

	//=================================================	
	
	@Override
	public void addLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.addLessonSchedule(schedule);
	}

	@Override
	public Schedule getLessonSchedule(int scheduleCode) throws Exception {
		// TODO Auto-generated method stub
		return lessonDao.getLessonSchedule(scheduleCode);
	}

	@Override
	public void updateLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.updateLessonSchedule(schedule);
	}

	@Override
	public void deleteLessonSchedule(int scheduleCode) throws Exception {
		// TODO Auto-generated method stub
		lessonDao.deleteLessonSchedule(scheduleCode);
	}

	@Override
	public Map<String, Object> listLessonSchedule(Search search, String teacherId) throws Exception {
		// TODO Auto-generated method stub
		List<Schedule> list = lessonDao.listLessonSchedule(search, teacherId);
		int totalCount = lessonDao.getLessonScheduleTotalCount(search,teacherId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}



}
