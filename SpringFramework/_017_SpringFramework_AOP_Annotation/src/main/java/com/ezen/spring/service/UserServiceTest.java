package com.ezen.spring.service;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.ezen.spring.vo.UserVO;

public class UserServiceTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. 스프링 컨테이너 구동
		AbstractApplicationContext applicationContext =
				new GenericXmlApplicationContext("root-context.xml");
		
		//2. 빈 객체 Lookup
		UserService userService = (UserService)applicationContext.getBean("userService");
		
		//3. 회원가입 기능 테스트
		/*
		 * UserVO joinUser = new UserVO(); joinUser.setId("ezen2");
		 * joinUser.setPassword("12345"); joinUser.setName("고기천1");
		 * 
		 * userService.join(joinUser);
		 */
		
		//4. 회원 상세정보 조회
		//Id 세팅하기 위한 UserVO 객체
		UserVO infoUser = new UserVO();
		infoUser.setId("ezen");
		
		UserVO user = userService.getUser(infoUser);
		System.out.println(user.toString());
		
		//5. 스프링 컨테이너 종료
		applicationContext.close();
	}

}
