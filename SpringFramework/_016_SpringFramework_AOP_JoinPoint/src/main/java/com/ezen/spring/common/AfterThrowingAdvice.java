package com.ezen.spring.common;

import org.aspectj.lang.JoinPoint;

public class AfterThrowingAdvice {
	public void afterThrowingMethod(JoinPoint jp, Exception exceptObj) {
		String methodName = jp.getSignature().getName();
		
		System.out.println("[예외 처리] " + methodName + "() 실행 중 발생한 예외 메시지: " + exceptObj.getMessage());
	}
}
