package com.ezen.spring.polymorphism;

public class LgTV implements TV {
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
		System.out.println("LgTV --- 소리 증가");
	}
	@Override
	public void volumeDown() {
		System.out.println("LgTV --- 소리 감소");
	}
}
