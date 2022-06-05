package com.aza.service.user;

import java.util.Map;

import com.aza.service.domain.User;

public interface UserService {
	
	//User :: INSERT ȸ������
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
	
	//Relation :: INSERT ȸ������, �����߰�
	public void addRelation(User user) throws Exception;
	
	//Relation :: SELECT
	public User getRelation(String firstStudentId, String parentId) throws Exception;
	
	//Relation :: UPDATE
	public void updateRelation(User user) throws Exception;
	
	//Relation :: DELETE
	public void deleteRelation(int relationCode) throws Exception;
	
	//Relation :: LIST
	public Map<String, Object> listRelation(String parentId) throws Exception;
	
	// private phoneAuth
	public int phoneAuth() throws Exception;


}
