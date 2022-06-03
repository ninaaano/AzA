package com.aza.Lesson.test;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.service.domain.Lesson;
import com.aza.service.lesson.LessonService;

//@RunWith(SpringRunner.class)
@SpringBootTest
public class LessonServiceTest {

	@Autowired
	@Qualifier("LessonServiceImpl")
	private LessonService lessonService;
	
	@Test
	public void testGetLesson() throws Exception{
		Lesson lesson = new Lesson();
		
		lesson = lessonService.getLesson("abcd1234");
		
		System.out.println(lesson);
	}
	
//	@Test
//	@Transactional
//	public void testAddLesson() throws Exception{
//		Lesson lesson = new Lesson();
//			
//		lesson.setLessonCode("test1234");
//		lesson.setTeacherId("testTeacher123");
//		lesson.setLessonName("스타벅스커피");
//		lesson.setLessonPlace("강남");
//		lesson.setLessonDay("수");
//		lesson.setLessonStartTime("10");
//		lesson.setLessonEndTime("21");
//		lesson.setSubject("아메리카노");
//		lesson.setFees(4500);
//		
//		lessonService.addLesson(lesson);
//		System.out.println("sql add 완료");
//	}

}
