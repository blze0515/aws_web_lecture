package com.ezen.spring.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//3.애즈펙트 설정
//@Aspect
public class BeforeAdvice {
	//1. 포인트컷 설정
//	@Pointcut("execution(* com.ezen.spring.service..*Impl.*(..))")
//	public void allPointcut() {}
//		
//	@Pointcut("execution(* com.ezen.spring.service..*Impl.get*(..))")
//	public void getPointcut() {}
	
	//2. 어드바이스 설정
	//@Before("PointcutCommon.allPointcut()")
	public void beforeMethod(JoinPoint jp) {
		String methodName = jp.getSignature().getName();
		Object[] methodArgs = jp.getArgs();
		
		System.out.println("[사전 처리]" + methodName + "() 메소드 ARGS 정보: " + methodArgs[0].toString());
	}
}
