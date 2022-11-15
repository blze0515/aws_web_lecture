package com.ezen.spring.service;

import com.ezen.spring.vo.UserVO;

public interface UserService {
	void join(UserVO userVO);
	
	UserVO getUser(UserVO userVO);
}
