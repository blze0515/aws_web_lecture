package com.ezen.spring.common;

public class AfterReturningAdvice {
	public void afterReturningMethod() {
		System.out.println("[사후 처리] 비즈니스 로직 정상 종료 시 동작");
	}
}
