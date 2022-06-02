package com.aza.service.lesson.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.Schedule;

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
		return null;
	}

	@Override
	public void updateLesson(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Lesson deleteLesson(String lessonCode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listLesson(Search search, String lessonName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Schedule getLessonSchedule(int scheduleCode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Schedule deleteLessonSchedule(int scheudleCode) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> listLessonSchedule(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
