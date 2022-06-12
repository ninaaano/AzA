package com.aza.web.alert;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.alert.AlertService;
import com.aza.service.domain.Alert;
import com.aza.service.domain.User;

@Controller
@RequestMapping("/alert/*")
public class AlertController {
	
	@Autowired
	@Qualifier("alertServiceImpl")
	private AlertService alertService;

	public AlertController() {
		// TODO Auto-generated constructor stub
	}

	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	@RequestMapping("getAlertPayment")
	public ModelAndView getAlertPayment(@ModelAttribute("search") Search search,HttpSession session) throws Exception{
		System.out.println("수납알람가져와");
		String receiverId = ((User) session.getAttribute("user")).getUserId();
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		List<Alert> listMap = alertService.getAlertPayment(search, receiverId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.size()).intValue(), pageSize, pageSize);
		System.out.println(resultPage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alert/getAlertPayment");
		mv.addObject("list", listMap);
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);		
		
		return mv;	
	}
	
	// 날짜 기준으로 최근 7일분을 가져오는거임
	@RequestMapping("getAlertByDate")
	public ModelAndView getAlertByDate(@ModelAttribute("search") Search search,HttpSession session) throws Exception {
		System.out.println("수납날짜가져와");
		
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		List<Alert> listMap = alertService.getAlertByDate(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)listMap.size()).intValue(), pageSize, pageSize);
		System.out.println(resultPage);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alert/getAlertByDate");
		mv.addObject("list", listMap);
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);		
		
		return mv;	
		
	}

}
