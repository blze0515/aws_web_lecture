package com.ezen.spring.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.ezen.spring.service..*Impl.*(..))")
	public void allPointcut() {}
		
	@Pointcut("execution(* com.ezen.spring.service..*Impl.get*(..))")
	public void getPointcut() {}
}
