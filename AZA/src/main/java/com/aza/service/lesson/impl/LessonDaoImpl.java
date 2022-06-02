package com.aza.service.lesson.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;


@Component
@PropertySource("classpath:/application.properties")
@Repository("LessonDaoImpl")
public class LessonDaoImpl implements LessonDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	public void seqSqlSession(SqlSession sqlSession) {
		System.out.println("Test");
		this.sqlSessionTemplate = sqlSession;
		// TODO Auto-generated constructor stub
	}
	
	public LessonDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addLesson(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("LessonMapper.addLesson", lesson);
	}

	@Override
	public Lesson getLesson(String lessonCode) throws Exception {
		return sqlSessionTemplate.selectOne("LessonMapper.getLesson",lessonCode);
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
	public List<Lesson> listLesson(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addLessonBook(Book book) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Book> listLessonBook(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public LessonBook deleteLessonBook(String isbn) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
	public List<Schedule> listLessonSchedule(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
