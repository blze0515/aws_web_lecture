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
		
		
		
		//2. 스프링 컨테이너 종료
		factory.close();
	}

}
