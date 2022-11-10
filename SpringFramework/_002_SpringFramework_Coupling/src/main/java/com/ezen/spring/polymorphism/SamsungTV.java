package com.ezen.spring.polymorphism;

public class SamsungTV {
	public void powerOn() {
		System.out.println("SamsungTV --- 전원 켜기");
	}
	
	public void powerOff() {
		System.out.println("SamsungTV --- 전원 끄기");
	}
	
	public void volumeUp() {
		System.out.println("SamsungTV --- 소리 증가");
	}
	
	public void volumeDown() {
		System.out.println("SamsungTV --- 소리 감소");
	}
}
