package com.ezen.spring.common;

public class AfterAdvice {
	public void afterMethod() {
		System.out.println("[사후 처리] 비즈니스 로직 종료 후 무조건 동작");
	}
}
