package com.aza.service.user.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.aza.service.domain.User;
import com.aza.service.user.UserDao;

@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public void deleteUser(String userId) throws Exception {
		sqlSession.delete("UserMapper.deleteUser", userId);
	}

	@Override
	public int checkDuplication(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.checkDuplication", userId);
	}

	@Override
	public void updateAlertState(char alertState) throws Exception {
		sqlSession.update("UserMapper.updateAlertState", alertState);	
	}

	@Override
	public void updateStopAlertStartTime(String stopAlertStartTime) throws Exception {
		sqlSession.update("UserMapper.updateStopAlertStartTime", stopAlertStartTime);
	}

	@Override
	public void updateStopAlertEndTime(String stopAlertEndTime) throws Exception {
		sqlSession.update("UserMapper.updateStopAlertEndTime", stopAlertEndTime);
	}

	@Override
	public void addRelation(User user) throws Exception {
		sqlSession.insert("RelationMapper.addRelation", user);	
	}

	@Override
	public void deleteRelation(int relationCode) throws Exception {
		sqlSession.delete("RelationMapper.deleteRelation", relationCode);	
	}

	@Override
	public User getRelation(User user) throws Exception {
		return sqlSession.selectOne("RelationMapper.getRelation", user);
	}

	@Override
	public void updateRelation(User user) throws Exception {
		sqlSession.update("RelationMapper.updateRelation", user);
	}

	@Override
	public Map<String, Object> listRelation(String parentId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
