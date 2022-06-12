package com.aza.service.lesson.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;
import com.aza.service.lesson.LessonDao;

@Component
@PropertySource("classpath:/application.properties")
@Repository("lessonDaoImpl")
public class LessonDaoImpl implements LessonDao {

	@Autowired
	@Lazy
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	public void seqSqlSession(SqlSession sqlSession) {
		System.out.println("Test");
		this.sqlSessionTemplate = sqlSession;
		// TODO Auto-generated constructor stub
	}
	
	public LessonDaoImpl() {
		System.out.println(this.getClass()+"] pleas start !!!!!!!");
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
		sqlSessionTemplate.update("LessonMapper.updateLesson",lesson);
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteLesson(String lessonCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("LessonMapper.deleteLesson", lessonCode);
//		sqlSessionTemplate.delete("BookMapper.deleteLessonBook", isbn);
	}

	@Override
	public List<Lesson> listLessonTeacher(Search search, String userID) throws Exception {
		// TODO Auto-generated method stub
		search.setSearchId(userID);
		
		return sqlSessionTemplate.selectList("LessonMapper.listLessonTeacher",search);

//		if usre.role = teacher
//		if(search.getSearchId().equals("teacher52") ) {
//			return sqlSessionTemplate.selectList("LessonMapper.listLessonTeacher",search);
//		}else {
//			return sqlSessionTemplate.selectList("LessonMapper.listLessonStuents",search);
//		}		
//		return sqlSessionTemplate.selectList("LessonMapper.listLessonStuents",map);
//		else user.role = students
//				
	}
	@Override
	public List<Lesson> listLessonStudent(Search search, String userID) throws Exception {
		// TODO Auto-generated method stub
		search.setSearchId(userID);
		
		return sqlSessionTemplate.selectList("LessonMapper.listLessonStuents",search);
	}
	
//	==================================

	@Override
	public void addLessonBook(Lesson lesson) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("LessonMapper.addLessonBook",lesson);
	}

	@Override
	public List<Lesson> listLessonBook(Search search, String teacherId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacherId", teacherId);
		map.put("endRowNum", search.getEndRowNum()+"");
		map.put("startRowNum", search.getStartRowNum()+"");
		return sqlSessionTemplate.selectList("LessonMapper.listLessonBook",map);
	}
	
	@Override
	public void deleteLessonBook(String isbn) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("LessonMapper.deleteLessonBook", isbn);
	}
	
//	==================================


	@Override
	public void addLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("ScheduleMapper.addLessonSchedule",schedule);
	}

	@Override
	public Schedule getLessonSchedule(int scheduleCode) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("ScheduleMapper.getLessonSchedule",scheduleCode);

 	}

	@Override
	public void updateLessonSchedule(Schedule schedule) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("ScheduleMapper.updateLessonSchedule", schedule);
	}

	@Override
	public void deleteLessonSchedule(int scheduleCode) throws Exception {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("ScheduleMapper.deleteLessonSchedule",scheduleCode);
	}

	@Override
	public List<Schedule> listLessonSchedule(Search search, String teacherId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("teacherId", teacherId);
		map.put("endRowNum", search.getEndRowNum()+"");
		map.put("startRowNum", search.getStartRowNum()+"");
		return sqlSessionTemplate.selectList("ScheduleMapper.listLessonSchedule",map);	
	}
	
	@Override
	public List<Schedule> getCalendar() throws Exception{
		List<Schedule> calendar = null;
		
		calendar = sqlSessionTemplate.selectList("ScheduleMapper.listLessonSchedule");
		return calendar;
	}
	
//	==================================	

	@Override
	public int getLessonTotalCount(Search search, String searchKeyword) throws Exception {
		// TODO Auto-generated method stub
		
		search.setSearchKeyword(searchKeyword);
		return sqlSessionTemplate.selectOne("LessonMapper.getLessonTotalCount",search);
	}
	
	public int getLeesonBookTotalCount(Search search, String searchKeyword) throws Exception{
		search.setSearchKeyword(searchKeyword);
		return sqlSessionTemplate.selectOne("LessonMapper.getLessonBookTotalCount",search);
	}
	
	@Override
	public int getLessonScheduleTotalCount(Search search, String searchKeyword) throws Exception {
		// TODO Auto-generated method stub
		search.setSearchKeyword(searchKeyword);
		return sqlSessionTemplate.selectOne("ScheduleMapper.getLessonTotalCount",search);
	}
	

}
