package com.aza.web.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentService;


@Controller
@RequestMapping("/payment/*")

public class PaymentController {
	
	//Field
	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	

	public PaymentController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	//== TEST
	//mapping Test OK
	@RequestMapping("1")
	public @ResponseBody ModelAndView paymentControllerTest() {
		
		try {

			String token = paymentService.getToken();
			System.out.println("토큰 ==> " + token);

			} catch (IOException e) {

			 System.out.println ("exception");

			}
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/payment/payment");
		
		return mv;
	}
	
	@RequestMapping(value = "listPayment")
	public ModelAndView listPayment
	(HttpServletRequest request, @ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("listPayment Start...");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);	
		
		Map<String, Object> map =paymentService.listPayment(search);
		
		Page resultPage =  new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", map.get("list"));
		mv.addObject("resultPage", resultPage);
		mv.addObject("search", search);
		mv.setViewName("/payment/listPayment");
		
		return mv;
	}
	
	@RequestMapping("complete")
	public ResponseEntity<String> realPayment
	(@RequestParam("payCode") int payCode,HttpSession session, Payment payment)throws Exception{
		String token = paymentService.getToken();
		System.out.println("토큰 ==> " + token);
		
		payment = paymentService.getPayment(payCode);
		int amount = paymentService.paymentInfo(payment.getImpUid(), token);
		
		//실결제 금액과 일치하는지 확인.
		int checkAmount = payment.getAmount();
		//일치하지 않을 때 결제 취소
		try {
			if(checkAmount != amount) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "결제 금액 오류");
			 return new ResponseEntity<String>("결제 금액 오류, 결제 취소", HttpStatus.BAD_REQUEST);
		}else {
			//결제 성공시 수납완료로 상태 변경
			payment.setCheckPay('Y');
			paymentService.updatePayment(payment);
		}
			
		}catch (Exception e) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "결제 오류");
			 return new ResponseEntity<String>("결제 에러", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
	}	
	//== TEST
	
//	@RequestMapping(value = "/updatePayment", method = RequestMethod.POST)
//	public ModelAndView updatePayment (@ModelAttribute("payment") Payment payment ,@RequestParam("payCode")int payCode)throws Exception{
//		paymentService.updatePayment(payment);
//		return new ModelAndView(); // 값 넣어야함
//	}
//	
//	@RequestMapping(value = "/addPayment", method = RequestMethod.POST)
//	public ModelAndView addPayment (@ModelAttribute("payment") Payment payment,HttpSession session, @RequestParam("payCode")int payCode)throws Exception{
//	//	payment.setBuyer((User)session.getAttribute("user"));
//	//	payment.setPurchaseProd(productService.getProduct(prodNo));
//	//	payment.setpayCode("1");
//		
//		paymentService.addPayment(payment);
//		
//		return new ModelAndView(); // 값 넣어야함
//	}
//	
//	@RequestMapping(value = "/deletePayment", method = RequestMethod.GET)
//	public ModelAndView deletePayment (@RequestParam("payCode")int payCode)throws Exception{
//		paymentService.deletePayment(payCode);
//		return new ModelAndView(); // 값 넣어야함
//	}
//	
//	@RequestMapping(value = "/listPayment")
//	public ModelAndView listPayment (@ModelAttribute("search") Search search)throws Exception{
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		//String buyerId = ((User)session.getAttribute("user")).getUserId();
//		Map<String, Object> map = paymentService.listPayment(search);
//
//		Page resultPage = new Page( search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
//
//		System.out.println("listPayment ::" + resultPage);
//		System.out.println("listPayment ::" + search);
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("list",map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
//		modelAndView.addObject("search", search);
//		
//		return new ModelAndView(); // 값 넣어야함
//	}
//	
//	public ModelAndView requestPay() throws Exception{
//		return null;
//		
//	}
//	
//	
	

}
