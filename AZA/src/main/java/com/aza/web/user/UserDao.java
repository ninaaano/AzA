package com.aza.web.user;

import java.util.List;

import com.aza.common.Search;
import com.aza.service.domain.User;

public interface UserDao {
	// INSERT
	public void addUser(User user) throws Exception ;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;

	// SELECT LIST
	public List<User> listUser(Search search) throws Exception ;

	// UPDATE
	public void updateUser(User user) throws Exception ;
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
	public User deleteUser(String userId) throws Exception;
	
	public int checkDuplication(String userId) throws Exception;

}
