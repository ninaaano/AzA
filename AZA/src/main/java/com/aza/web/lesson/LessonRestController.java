package com.aza.web.lesson;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.book.BookService;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;

@RestController
@RequestMapping("/lesson/rest/")
public class LessonRestController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;
	
	@Value("${pageSize}")
	int pageSize;
	
	public LessonRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="checkLessonCode/{lessonCode}")
	public boolean checkLessonCode(@PathVariable("lessonCode") String lessonCode) throws Exception {
		
		Lesson lesson = lessonService.getLesson(lessonCode);
		
		if (lesson == null) {
			return false;
		}
		return true;
	}
	
	@RequestMapping(value="addLessonBook")
	public ModelAndView addLessonBook(@RequestBody  Lesson lesson) throws Exception{
		ModelAndView model = new ModelAndView();
		try {
			BookService crawler = new BookService();
			String url = URLEncoder.encode("9788994492032", "UTF-8");
			String response = crawler.search(url);
			
			String[] fields = {"title","link","description","image","author","price","isbn"};
			Map<String, Object> result = crawler.getResult(response, fields);
			
			if(result.size() >0)
				System.out.println("total->"+result.get("total"));
			
			List<Map<String,Object>> items = (List<Map<String, Object>>) result.get("result");
			
			for(Map<String,Object> item : items) {
				System.out.println("===============================");
				for(String field : fields) {
					System.out.println(field+"->"+item.get(field));
					if(field.equals("title")) {
						lesson.setBookTitle(item.get(field));
					}
					if(field.equals("author")) {
						lesson.setAuthor(item.get(field));
					}
					if(field.equals("price")) {
						lesson.setBookPrice(item.get(field));
					}
					if(field.equals("isbn")) {
						lesson.setIsbn(item.get(field));
					}
					if(field.equals("pubdate")) {
						lesson.setBookYear(item.get(field));
					}
					if(field.equals("image")) {
						lesson.setBookImg(item.get(field));
	 				}
				}
			}			
//			System.out.println(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		lessonService.addLessonBook(lesson);
		model.setViewName("redirect:/lesson/manageLessonBook");
		return model;
	}
	
	@RequestMapping("/manageLessonBook")
	public Map<String, Object> manageLessonBook(HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		String teacherId = user.getUserId();
		Search search = new Search();
		
		int totalCount = (int)lessonService.listLessonBook(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		return lessonService.listLessonBook(search, teacherId);
	}
	
	@RequestMapping("/deleteLessonBook")
	public void deleteLessonBook(@PathVariable String isbn) throws Exception{
		lessonService.deleteLessonBook(isbn);
	}

//	1.선생님 이름 넣었을때 오늘 듣는 수업 요일 넣었을때 
//	2.해당 시간에 맞는 수업을 찾아내야함 
//	3.시간  /  수업명
	@RequestMapping("/listLessonTime")
	public List listLessonTime(HttpSession session, @RequestParam(required = false) String lessonDay) throws Exception{
		String teacherId = ((User) session.getAttribute("user")).getUserId();
		
		String day ="";
		switch(lessonDay){
			case "0": day = "일";
				break;
			case "1": day = "월";
				break;
			case "2": day = "화";
				break;
			case "3": day = "수";
				break;
			case "4": day = "목";
				break;
			case "5": day = "금";
				break;
			case "6": day = "토";
				break;
		}
		
		Map<String, Object> map = lessonService.listLessonTime(teacherId, day);
	
		return (List) map.get("list");
	}
}

		
		
		
		