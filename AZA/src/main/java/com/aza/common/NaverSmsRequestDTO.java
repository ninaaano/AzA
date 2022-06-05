package com.aza.common;

import java.util.List;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;

import lombok.Data;

@Data
@Qualifier("NaverSmsRequestDTO")
public class NaverSmsRequestDTO {
	
	
	private String type; 
	private String contentType; 
	private String countryCode; 
	private String from; 
	private String content; 
	private List<NaverSmsMessageRequestDTO> messages;
	
	
	public NaverSmsRequestDTO(String type, String contentType, String countryCode, String from, String content,
			List<NaverSmsMessageRequestDTO> messages) {
		this.type = type;
		this.contentType = contentType;
		this.countryCode = countryCode;
		this.from = from;
		this.content = content;
		this.messages = messages;
	}

	
	


}