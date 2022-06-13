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

}
