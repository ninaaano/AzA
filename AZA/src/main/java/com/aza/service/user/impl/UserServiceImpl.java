package com.aza.service.user.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

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
	public void updateAlertState(char alertState) throws Exception {
		userDao.updateAlertState(alertState);
	}

	@Override
	public void updateStopAlertStartTime(String stopAlertStartTime) throws Exception {
		userDao.updateStopAlertStartTime(stopAlertStartTime);
	}

	@Override
	public void updateStopAlertEndTime(String stopAlertEndTime) throws Exception {
		userDao.updateStopAlertEndTime(stopAlertEndTime);
	}

	@Override
	public void addRelation(User user) throws Exception {
		userDao.addRelation(user);
	}

	@Override
	public void deleteRelation(int relationCode) throws Exception {
		userDao.deleteRelation(relationCode);
	}

	@Override
	public User getRelation(String firstStudentId, String parentId) throws Exception {
		return userDao.getRelation(firstStudentId, parentId);
	}

	@Override
	public void updateRelation(User user) throws Exception {
		userDao.updateRelation(user);
	}

	@Override
	public Map<String, Object> listRelation(String parentId) throws Exception {
		return userDao.listRelation(parentId);
	}
	
}
