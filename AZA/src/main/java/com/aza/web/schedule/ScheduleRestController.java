package com.aza.web.schedule;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.Schedule;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;

@CrossOrigin(origins="*", allowedHeaders="*")
@RestController
@RequestMapping("/schedule/rest/*")
public class ScheduleRestController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	public ScheduleRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@RequestMapping("manageLessonSchedule")
	public Map<String, Object> manageLessonSchedule(HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		String teacherId = user.getUserId();
		Search search = new Search();
		int totalCount= (int) lessonService.listLessonSchedule(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		return lessonService.listLessonSchedule(search, teacherId);
	}

	@RequestMapping(value="addSchedule", method=RequestMethod.POST)
	public Schedule addSchedule(@RequestBody Schedule schedule) throws Exception{
		lessonService.addLessonSchedule(schedule);
		return schedule;
	}
	
	@RequestMapping(value="deleteSchedule/{scheduleCode}",method=RequestMethod.POST)
	public Schedule deleteSchedule(@RequestBody Schedule schedule, @PathVariable int scheduleCode) throws Exception{
		lessonService.deleteLessonSchedule(scheduleCode);
		
		return schedule;
	}
}
