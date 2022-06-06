package com.aza.service.user;

import java.util.List;
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
	public void updateAlertState(User user) throws Exception;
	
	//User :: updateStopAlertStartTime
	public void updateStopAlertStartTime(User user) throws Exception;
	
	//User :: updateStopAlertEndTime
	public void updateStopAlertEndTime(User user) throws Exception;
	
	//User :: updateCheck
	public void updateCheck(User user) throws Exception;
	
	//Relation :: INSERT 회원가입, 관계추가
	public void addRelation(User user) throws Exception;
	
	//Relation :: SELECT
//	public User getRelation(String firstStudentId, String parentId) throws Exception;
	public User getRelation(int relationCode) throws Exception;
	
	//Relation :: UPDATE
	public void updateRelation(User user) throws Exception;
	
	//Relation :: DELETE
//	public void deleteRelation(int relationCode) throws Exception;
	public void deleteRelation(String userId) throws Exception;
	
	//Relation :: LIST
	public List<User> listRelation(String userId) throws Exception;
}
