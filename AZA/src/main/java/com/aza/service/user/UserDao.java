package com.aza.service.user;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.User;

public interface UserDao {

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
	public void updateAlertState(User user) throws Exception;
	
	//User :: updateStopAlertStartTime
	public void updateStopAlertStartTime(User user) throws Exception;
	
	//User :: updateStopAlertEndTime
	public void updateStopAlertEndTime(User user) throws Exception;
	
	//User :: updateCheck
	public void updateCheck(User user) throws Exception;
	
	//Relation :: INSERT ȸ������, �����߰�
	public void addRelation(User user) throws Exception;
	
	//Relation :: SELECT
	//public User getRelation(String firstStudentId, String parentId) throws Exception;
	public User getRelation(String parentId) throws Exception; // MJ
	
	//Relation :: UPDATE
	public void updateRelation(User user) throws Exception;
	
	//Relation :: DELETE
//	public void deleteRelation(int relationCode) throws Exception;
	public void deleteRelation(String userId) throws Exception;
	
	//Relation :: LIST
//	public List<User> listRelation(String userId) throws Exception;
	public List<User> listRelation(Search search, String parentId) throws Exception; // MJ
	
	public int getRelationTotalCount(Search search, String searchKeyword) throws Exception;
}
