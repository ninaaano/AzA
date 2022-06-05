package com.aza.service.user.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.aza.service.domain.User;
import com.aza.service.user.UserDao;

@Component
@PropertySource("classpath:/application.properties")
@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao {
	
	///Field
	@Autowired
	@Lazy
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
	public void updateAlertState(User user) throws Exception {	
		sqlSession.update("UserMapper.updateAlertState", user);	
	}

	@Override
	public void updateStopAlertStartTime(User user) throws Exception {
		sqlSession.update("UserMapper.updateStopAlertStartTime", user);
	}

	@Override
	public void updateStopAlertEndTime(User user) throws Exception {
		sqlSession.update("UserMapper.updateStopAlertEndTime", user);
	}

	@Override
	public void addRelation(User user) throws Exception {
		sqlSession.insert("RelationMapper.addRelation", user);	
	}

//	@Override
//	public void deleteRelation(int relationCode) throws Exception {
//		sqlSession.delete("RelationMapper.deleteRelation", relationCode);	
//	}
	
	@Override
	public void deleteRelation(String userId) throws Exception {
		sqlSession.delete("RelationMapper.deleteRelation", userId);	
	}

	@Override
	public User getRelation(String firstStudentId, String parentId) throws Exception {
		User user = new User();
		user.setFirstStudentId(firstStudentId);
		user.setUserId(parentId);
		return sqlSession.selectOne("RelationMapper.getRelation", user);
	}

	@Override
	public void updateRelation(User user) throws Exception {
		sqlSession.update("RelationMapper.updateRelation", user);
	}

	@Override
	public List<User> listRelation(String userId) throws Exception {
		return sqlSession.selectList(userId);
	}

	@Override
	public void updateCheck(User user) throws Exception {
		sqlSession.update("UserMapper.updateCheck", user);
	}

}
