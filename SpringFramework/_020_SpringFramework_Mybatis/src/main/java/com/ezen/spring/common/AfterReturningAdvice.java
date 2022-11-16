package com.ezen.spring.common;

import org.aspectj.lang.JoinPoint;

import com.ezen.spring.vo.UserVO;

public class AfterReturningAdvice {
	//returnObj: 포인트컷 메소드가 종료될 때 반환해주는 반환 값
	//두 번째 인자인 Object를 바인드 변수라고 하고 메소드의 리턴 값을 자동으로 매핑
	public void afterReturningMethod(JoinPoint jp, Object returnObj) {
		String methodName = jp.getSignature().getName();
		if(returnObj instanceof UserVO) {
			UserVO user = (UserVO)returnObj;
			if(user.getId().equals("admin")) {
				System.out.println(user.getName() + " 로그인(admin)");
			}
		}
		
		System.out.println("[사후 처리] " + methodName + "() 리턴 값: " + returnObj.toString());
	}
}
