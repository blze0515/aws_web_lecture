package com.ezen.spring.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

//@Service
//3. 애즈펙트 설정
//@Aspect 사용 시 클래스 안의 포인트컷과 어드바이스가 결합하여 애즈펙트로 인식
//@Aspect
public class LogAdvice {
	//1. 포인트컷 설정
	//@Pointcut("execution(* com.ezen.spring.service..*Impl.*(..))")
	public void allPointcut() {}
	
	//@Pointcut("execution(* com.ezen.spring.service..*Impl.get*(..))")
	public void getPointcut() {}
	
	//2. 어드바이스 설정: aop의 시점을 어노테이션으로 매개변수로 포인트컷 메소드명을 넣어준다.
	//@Before, @AfterReturning, @AfterThrowing, @After, @Around
	//@Before("allPointcut()")
	public void printLog() {
		System.out.println("[공통 로그] 비즈니스 로직 전 실행");
	}
}
