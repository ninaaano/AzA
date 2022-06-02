package com.aza.service.user;

import java.util.Map;

import com.aza.service.domain.User;

public interface UserDao {

	//User :: INSERT 회원가입
	public void addUser(User user) throws Exception;
	
	//User :: SELECT
	public User getUser(String userId) throws Exception;
	
	//User :: UPDATE
	public void updateUser(User user) throws Exception;
	
	//User :: DELETE
	public void deleteUser(String userId) throws Exception;
	
	//User :: CheckDuplication
	public int checkDuplication(String userId) throws Exception;
	
	//User :: updateAlertState
	public void updateAlertState(char alertState) throws Exception;
	
	//User :: updateStopAlertStartTime
	public void updateStopAlertStartTime(String stopAlertStartTime) throws Exception;
	
	//User :: updateStopAlertEndTime
	public void updateStopAlertEndTime(String stopAlertEndTime) throws Exception;
	
	//Relation :: INSERT 회원가입, 관계추가
	public void addRelation(User user) throws Exception;
	
	//Relation :: SELECT
	public User getRelation(User user) throws Exception;
	
	//Relation :: UPDATE
	public void updateRelation(User user) throws Exception;
	
	//Relation :: DELETE
	public void deleteRelation(int relationCode) throws Exception;
	
	//Relation :: LIST
	public Map<String, Object> listRelation(String parentId) throws Exception;
}
