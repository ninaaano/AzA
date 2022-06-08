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
import com.aza.service.domain.User;
import com.aza.service.paper.PaperService;
import com.aza.service.user.UserService;



@SpringBootTest
public class PaperQuizTest {
	@Autowired
	@Qualifier("paperServiceImpl")
	private PaperService paperService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//@Test // add test OK
	void testAddQuiz() throws Exception{
		Paper paper = new Paper();
		paper.setLessonCode("ABCD1234");
		paper.setStudentId("student21");
		paper.setQuizTitle("합친 것 Test 용");
		
		
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
		Paper paper = paperService.getPaperQuiz(1008);
		
		paper.setQuizSubmitDate("2022/06/08");
		paper.setQuizScore(50);
		
		paperService.updatePaperQuiz(paper);
		// 제출일, 점수
		
	}
	//@Test // delete test OK
	void testDeleteQuiz() throws Exception{
		paperService.deletePaperQuiz(1008);
		
	}
	
	// 선생님 list
	//@Test // list Test OK // totalCount OK
	void testListPaperQuizT() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		search.setSearchKeyword("ABCD1234");
		search.setSearchId("student22");
		
//		User user = userService.getUser("teacher2");
//		System.out.println("role!! ==>> " + user.getRole());
//		if(user.getRole() != "teacher" ) {
//		search.setSearchCondition(user.getRole());
//		search.setSearchId("student22"); 
//		}else {
//			search.setSearchCondition(null);
//		}
		
		System.out.println("search ==> " + search);
		
		Map<String, Object> map = paperService.listPaperQuizTeacher(search);
		List<Object> list = (List<Object>)map.get("list");
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println("Quiz TotalCount ====>> " + totalCount);
		System.out.println("Quiz List ==>> " + list);
		
	}
	
	//학생 list
	//@Test
	void testListPaperQuizS() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		search.setSearchKeyword("ABCD1234");
		search.setSearchId("student22");
		
		Map<String, Object> map = paperService.listPaperQuizStudent(search);
		List<Object> list = (List<Object>)map.get("list");
		Integer totalCount = (Integer)map.get("totalCount");
		
		System.out.println("Quiz학생 list========== ");
		System.out.println(" SearchId====>> " + search.getSearchId());
		System.out.println("Quiz TotalCount ====>> " + totalCount);
		System.out.println("Quiz List ==>> " + list);
	}
	
	//=== 용승===================================================================
	//@Test
	public void testAddQuestion() throws Exception{
		Paper paper = new Paper();
		paper.setQuizCode(1000);
		paper.setQuestionNo(3);
		paper.setQuestionContent("123+321 =???");
		paper.setTeacherAnswer("list Test용");
		paper.setAnswerCheck('0');
		
		System.out.println("==>> "+paper);
		
		paperService.addPaperQuestion(paper);
	}
	
	//@Test
	public void testGetQuestion() throws Exception {
		Paper paper = new Paper();
		paper.setQuestionCode(1000);
		
		paperService.getPaperQuestion(paper.getQuestionCode());
		System.out.println();
	}
	
	//@Test
	public void testUpdateQuestion() throws Exception {
		Paper paper = new Paper();
		paper.setQuestionContent("111+111 =???");
		paper.setTeacherAnswer("Test update");
		paper.setStudentAnswer("333");
		paper.setAnswerCheck('0');
		paper.setFeedBackContent("Ʋ�Ƚ��ϴ�. �����ϼ���");
		paper.setQuestionCode(1002);
		
		paperService.updatePaperQuestion(paper);
		
	}
	
	//@Test
	public void testDeleteQuestion() throws Exception {
		Paper paper = new Paper();
		paper.setQuestionCode(1002);
		
		paperService.deletePaperQuestion(paper.getQuestionCode());
	}
	
	@Test
	public void testListPaperQuestion() throws Exception{
		Paper paper = new Paper();
		paper.setQuizCode(1000);
		
		paperService.listPaperQuestion(paper.getQuizCode());
		System.out.println(paper);
	}
	
	//@Test
	public void testAddPaperChoice() throws Exception{
		Paper paper = new Paper();
		paper.setQuestionCode(1001);
		paper.setChoiceNo(2);
		paper.setChoiceContent("2");
		
		paperService.addPaperChoice(paper);
	}
	
	//@Test
	public void testGetPaperChoice() throws Exception{
		Paper paper = new Paper();
		paper.setChoiceCode(1001);
		
		paperService.getPaperChoice(paper.getChoiceCode());
	}
	
	@Test
	public void testUpdatePaperChoice() throws Exception {
		Paper paper = new Paper();
		paper.setChoiceCode(1001);
		paper.setChoiceContent("TEST update");
		
		paperService.updatePaperChoice(paper);
	}
	
	//@Test
	public void testDeletePaperChoice() throws Exception {
		Paper paper = new Paper();
		paper.setChoiceCode(1000);
		
		paperService.deletePaperChoice(paper.getChoiceCode());
	}
	
	//@Test
	public void testListPaperChoice() throws Exception {
		Paper paper = new Paper();
		paper.setQuestionCode(1001);
		
		//Map<String, Object> map = paperService.listPaperChoice(1001);
		//List<Object> list = (List<Object>)map.get("list");
		
		paperService.listPaperChoice(paper.getQuestionCode());
	}
}
