package com.ezen.spring.common;

import org.aspectj.lang.ProceedingJoinPoint;

public class AroundAdvice {
	/*
	 * ProceedingJoinPoint: 현재 진행중인 포인트컷 메소드
	 * */
	public Object aroundMethod(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[사전 처리] 비즈니스 로직 전 동작");
		Object returnObj = pjp.proceed();
		System.out.println("[사후 처리] 비즈니스 로직 후 동작");
		return returnObj;
	}
}
