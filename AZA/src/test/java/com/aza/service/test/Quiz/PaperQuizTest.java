package com.aza.service.test.Quiz;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.Paper;
import com.aza.service.paper.PaperService2;



@SpringBootTest
public class PaperQuizTest {
	@Autowired
	@Qualifier("paperServiceImpl2")
	private PaperService2 paperService;

	//@Test // add test OK
	void testAddQuiz() throws Exception{
		Paper paper = new Paper();
		paper.setLessonCode("ABCD1234");
		paper.setStudentId("student21");
		paper.setQuizTitle("C//쪽지시험 title");
		
		
		System.out.println("==>> "+paper);
		paperService.addPaperQuiz(paper);
		
	}
	//@Test // get test OK
	void testGetQuiz() throws Exception{
		Paper paper = paperService.getPaperQuiz(1000);
		System.out.println(paper);
	}
	
	//@Test // update test OK
	void testUpdateQuiz() throws Exception{
		Paper paper = paperService.getPaperQuiz(1001);
		
		paper.setQuizSubmitDate("2022/06/10");
		//paper.setQuizScore(50);
		
		paperService.updatePaperQuiz(paper);
		// 제출일, 점수
		
	}
	//@Test // delete test OK
	void testDeleteQuiz() throws Exception{
		paperService.deletePaperQuiz(1006);
		
	}
	
	@Test // list Test OK
	void testListPaperQuiz() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		search.setSearchKeyword("ABCD1234");
		
		System.out.println("search ==> " + search);
		
		Map<String, Object> map = paperService.listPaperQuiz(search);
		List<Object> list = (List<Object>)map.get("list");
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("Quiz TotalCount ====>> " + totalCount);
		System.out.println("Quiz List ==>> " + list); // OK
		
	}
}
