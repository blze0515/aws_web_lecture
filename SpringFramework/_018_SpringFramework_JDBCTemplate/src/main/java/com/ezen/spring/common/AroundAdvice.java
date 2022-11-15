package com.ezen.spring.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	/*
	 * ProceedingJoinPoint: 현재 진행중인 포인트컷 메소드
	 * */
	public Object aroundMethod(ProceedingJoinPoint pjp) throws Throwable {
		String methodName = pjp.getSignature().getName();
		
		//메소드 실행하는 데 걸리는 시간 계산
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object returnObj = pjp.proceed();
		
		stopWatch.stop();
		
		System.out.println(methodName + "() 실행 하는 데 걸린 시간: " + stopWatch.getTotalTimeMillis() + "(ms)초");
		return returnObj;
	}
}
