package com.aza.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.User;
import com.aza.service.user.UserDao;
import com.aza.service.user.UserService;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
		userDao.addRelation(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		userDao.deleteUser(userId);

	}

	@Override
	public int checkDuplication(String userId) throws Exception {
		return userDao.checkDuplication(userId);
	}

	@Override
	public void updateAlertState(User user) throws Exception {
		userDao.updateAlertState(user);
	}

	@Override
	public void updateStopAlertStartTime(User user) throws Exception {
		userDao.updateStopAlertStartTime(user);
	}

	@Override
	public void updateStopAlertEndTime(User user) throws Exception {
		userDao.updateStopAlertEndTime(user);
	}

	@Override
	public void addRelation(User user) throws Exception {
		userDao.addRelation(user);
	}

//	@Override
//	public void deleteRelation(String userId) throws Exception {
//		userDao.deleteRelation(userId);
//	}
	public void deleteRelation(int relationCode) throws Exception {
		userDao.deleteRelation(relationCode);
	}

//	@Override
//	public User getRelation(String firstStudentId, String parentId) throws Exception {
//		return userDao.getRelation(firstStudentId, parentId);
//	}
	
	@Override
	public User getRelation(int relationCode) throws Exception {
		return userDao.getRelation(relationCode);
	}

	@Override
	public void updateRelation(User user) throws Exception {
		userDao.updateRelation(user);
	}

	@Override
	public Map<String, Object> listRelationByStudent(Search search, String studentId) throws Exception {
		List<User> list = userDao.listRelationByStudent(search, studentId);
		int totalCount = userDao.getListRelationByStudentTotalCount(search, studentId);


		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	@Override
	public Map<String, Object> listRelationByParent(Search search, String parentId) throws Exception {
		List<User> list = userDao.listRelationByParent(search, parentId);
		int totalCount = userDao.getListRelationByParentTotalCount(search, parentId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	


	@Override
	public void updateCheck(User user) throws Exception {
		userDao.updateCheck(user);
	}

	
	@Override
	public int phoneAuth() throws Exception {
		Random num  = new Random();
    	num.setSeed(System.currentTimeMillis());  	
    	int num1 = (num.nextInt(1000000) % 1000000);
    	return num1;
		
	}
	
}