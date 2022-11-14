package com.ezen.spring.polymorphism;

import org.springframework.stereotype.Component;

@Component("lTv")
public class LgTV implements TV {
	//소니 스피커에 의존함
	SonySpeaker speaker;
	
	public LgTV() {
		System.out.println("====> LgTV 객체 생성");
	}
	@Override
	public void turnOn() {
		System.out.println("LgTV --- 전원 켜기");
	}
	@Override
	public void turnOff() {
		System.out.println("LgTV --- 전원 끄기");
	}
	@Override
	public void volumeUp() {
//		System.out.println("LgTV --- 소리 증가");
		//의존성 주입
		speaker = new SonySpeaker();
		speaker.volumeUp();
	}
	@Override
	public void volumeDown() {
//		System.out.println("LgTV --- 소리 감소");
		//의존성 주입
		speaker = new SonySpeaker();
		speaker.volumeDown();
	}
}
