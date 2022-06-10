package com.aza.web.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.aza.service.domain.Greeting;
import com.aza.service.domain.HelloMessage;
import com.aza.service.domain.Message;
import com.aza.service.message.impl.MessageServiceImpl;

@Controller
public class GreetingController {

	private SimpMessageSendingOperations messagingTemplate;

	@Autowired
	@Qualifier("messageServiceImpl")
	private MessageServiceImpl messageServiceImpl;


	@MessageMapping("/hello")
	@SendTo("/topic/greetings")
	public Greeting greeting(HelloMessage message) throws Exception {
		Thread.sleep(1000); // simulated delay
		return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
	}

	@MessageMapping("/getMessage/{userId}/{otherId}")
	@SendTo("/topic/getMessage")
	public List getMessage(@DestinationVariable("userId") String userId,@DestinationVariable("otherId") String otherId) throws Exception {
		Thread.sleep(500);

		List list = messageServiceImpl.getMessage(userId, otherId);
		  
		System.out.println(list);
		 		
		return list;
	}
	
	@MessageMapping("/addMessage")
	public void addMessage(Message message) throws Exception {
		Thread.sleep(300);
		
		messageServiceImpl.addMessage(message.getSenderId(), message.getReceiverId(), message.getMessageContent(), message.getMessageCreateAt());
		
		System.out.println("addㅡㄷㅁ좋ㄷㅈ");
		messagingTemplate.convertAndSend("/getMessage/"+message.getSenderId()+"/"+message.getReceiverId());
	}
	
	
	
	
	
	
	
	
	
	

}