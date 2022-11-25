package com.ezen.springboard.service.user;

import com.ezen.springboard.vo.UserVO;

public interface UserService {
	//id중복체크
	int idCheck(String userId);
	//회원가입
	int join(UserVO userVO);
	//로그인
	UserVO login(UserVO userVO);
}
