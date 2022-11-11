package com.ezen.spring.polymorphism;

public class SamsungTV implements TV{
	public SamsungTV() {
		System.out.println("====> 삼성 티비 객체 생성");
	}
	
	@Override
	public void turnOn() {
		System.out.println("SamsungTV --- 전원 켜기");
	}
	@Override
	public void turnOff() {
		System.out.println("SamsungTV --- 전원 끄기");
	}
	@Override
	public void volumeUp() {
		System.out.println("SamsungTV --- 소리 증가");
	}
	@Override
	public void volumeDown() {
		System.out.println("SamsungTV --- 소리 감소");
	}
}
