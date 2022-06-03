package com.aza.Lesson.test.Lesson;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.lesson.LessonService;

//@RunWith(SpringRunner.class)
@SpringBootTest
public class LessonServiceTest {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	//@Test
	public void testAddLesson() throws Exception{
		Lesson lesson = new Lesson();
		
		lesson.setTeacherId("a");
		lesson.setTeacherId("testTeacher123");
		lesson.setLessonName("스타벅스커피");
		lesson.setLessonPlace("강남");
		lesson.setLessonDay("수");
		lesson.setLessonStartTime("10");
		lesson.setLessonEndTime("21");
		lesson.setSubject("아메리카노");
		lesson.setFees(4500);
		
		lessonService.addLesson(lesson);
		
		lesson = lessonService.getLesson("a");
		System.out.println(lesson);
		System.out.println("============");
		System.out.println("sql add 완료");
	}
	
	@Test
	public void testGetLesson() throws Exception{
		Lesson lesson = new Lesson();
		
		lesson = lessonService.getLesson("agho1216");
		
		System.out.println(lesson);
	}
	
	//@Test
	public void updateLesson() throws Exception{
		Lesson lesson = lessonService.getLesson("abcd1234");
		
		lesson.setLessonName("MongoDB");
		
		lessonService.updateLesson(lesson);
		lesson = lessonService.getLesson("abcd1234");
		System.out.println(lesson);		
	}
	
	//@Test
	public void deleteLesson() throws Exception{
		lessonService.deleteLesson("abcd1234");
	}
	
	//@Test
	public void testlistLesson() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = lessonService.listLesson(search,"비트","20220531","teacher51");
		System.out.println(map);
		
//		List<Object> list = (List<Object>)map.get("list");
//		assertEquals(4, list.size());
				
//		Integer totalCount = (Integer)map.get("totalCount");
//		System.out.println(totalCount);
//		
//		search.setCurrentPage(1);
//		search.setPageSize(2);
//		search.setSearchCondition("0");
//		search.setSearchKeyword("");
//		map = lessonService.listLesson(search,"","");
//		
//		list = (List<Object>)map.get("list");
//		assertEquals(3, list.size());
//		System.out.println(list);
//		
//		totalCount = (Integer)map.get("totalCount");
//		System.out.println(totalCount);		
	}
	
	//@Test
	public void testlistLessonBook() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = lessonService.listLessonBook(search);
		
		List<Object> list = (List<Object>)map.get("list");
		
		System.out.println("=========");
		System.out.println(list);
		
		Integer totalCount = (Integer)map.get("totalcount");
		System.out.println(totalCount);
		
		System.out.println("=====================");
		
		search.setCurrentPage(1);
		search.setPageSize(3);
		search.setSearchCondition("0");
		search.setSearchKeyword("abcd1234");
		map = lessonService.listLessonBook(search);
		
		list = (List<Object>)map.get("list");
		
		totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);
	}
	

	

	
}
