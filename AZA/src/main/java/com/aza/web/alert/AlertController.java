package com.aza.web.alert;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aza.service.alert.AlertService;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	
	public AlertController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("readAlert/{alertCode}")
	public ModelAndView readAlert(@PathVariable("alertCode") int alertCode, ModelAndView mv, HttpServletRequest req) throws Exception {
		
		System.out.println("/alert/readAlert");
		
		alertService.readAlert(alertCode);
		
		String referer = req.getHeader("Referer");
//	    return "redirect:"+ referer;
		
		mv.setViewName("redirect:"+referer);
		
		return mv;		
	}
	
	@RequestMapping("deleteAlert/{alertCode}")
	public ModelAndView deleteAlert(@PathVariable("alertCode") int alertCode, ModelAndView mv) throws Exception {
		
		System.out.println("/alert/deleteAlert");
		
		alertService.deleteAlert(alertCode);
		
		mv.setViewName("redirect:/alert/rest/listAlert");
		
		return mv;
	}

	
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
