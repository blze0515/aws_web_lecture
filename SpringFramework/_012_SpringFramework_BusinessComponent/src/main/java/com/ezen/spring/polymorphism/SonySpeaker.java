package com.ezen.spring.polymorphism;

public class SonySpeaker implements Speaker {
	public SonySpeaker() {
		System.out.println("====> 소니 스피커 객체 생성");
	}
	
	public void volumeUp() {
		System.out.println("SonySpeaker --- 소리 증가");
	}
	
	public void volumeDown() {
		System.out.println("SonySpeaker --- 소리 감소");
	}
}
