package com.aza.common;

import java.sql.Timestamp;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data 
// data 지우고 getter/setter 설정해주기
@Service 
@Getter 
@AllArgsConstructor
@NoArgsConstructor
public class NaverSmsResponseDTO{
	private String statusCode; 
	private String statusName; 
	private String requestId; 
	private Timestamp requestTime;


}