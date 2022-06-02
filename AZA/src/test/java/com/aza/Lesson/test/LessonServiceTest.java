package com.aza.Lesson.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.aza.service.domain.Lesson;
import com.aza.service.lesson.impl.LessonService;

@WebAppConfiguration
@RunWith(SpringRunner.class)
//@WebMvcTest(EmployeeRESTController.class)
@ContextConfiguration(locations = {"classpath:config/context-aspect.xml",
		"classpath:config/context-common.xml",
		"classpath:config/context-mybatis.xml",
		"classpath:config/context-transaction.xml"})
@SpringBootTest
public class LessonServiceTest {

	@Autowired
	@Qualifier("LessonServiceImpl")
	private LessonService lessonService;
	
	@Test
	@Transactional
	public void testAddLesson() throws Exception{
		Lesson lesson = new Lesson();
			
		lesson.setLessonCode("test1234");
		lesson.setTeacherId("testTeacher123");
		lesson.setLessonName("스타벅스커피");
		lesson.setLessonPlace("강남");
		lesson.setLessonDay("수");
		lesson.setLessonStartTime("10");
		lesson.setLessonEndTime("21");
		lesson.setSubject("아메리카노");
		lesson.setFees(4500);
		
		lessonService.addLesson(lesson);
		System.out.println("sql add 완료");
	}

}
