package com.ezen.spring.polymorphism;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TvUser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//1. 스프링 컨테이너 구동
		//스프링 컨테이너 객체 생성					 
		AbstractApplicationContext factory = 
				//어떤 파일을 읽어서 스프링 컨테이너를 구동할지
				new GenericXmlApplicationContext("root-context.xml");
		
		//2. DL과 DI
		//DL(Dependency Lookup): sTv라는 id를 가진 bean객체를 찾음
		//DI(Dependency Injection): DL에서 찾은 bean객체를 tv에 의존성 주입
		//lazy-init속성이 true일 때는 getBean으로 해당 객체를 요청하면 객체 생성.
//		TV tv = (TV)factory.getBean("sTv");
//		tv.turnOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.turnOff();
		TV tv1 = (TV)factory.getBean("lTv");
		tv1.turnOn();
		tv1.volumeUp();
		tv1.volumeDown();
		tv1.turnOff();
		
		//3. 스프링 컨테이너 종료
		factory.close();
	}

}
