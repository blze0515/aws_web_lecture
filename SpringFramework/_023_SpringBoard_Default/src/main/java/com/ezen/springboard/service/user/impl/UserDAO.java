package com.ezen.springboard.service.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springboard.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int idCheck(String userId) {
		return mybatis.selectOne("UserDAO.idCheck", userId);
	}
	
	public int join(UserVO userVO) {
		return mybatis.insert("UserDAO.join", userVO);
	}
	
	public UserVO login(UserVO userVO) {
		return mybatis.selectOne("UserDAO.login", userVO);
	}
}
