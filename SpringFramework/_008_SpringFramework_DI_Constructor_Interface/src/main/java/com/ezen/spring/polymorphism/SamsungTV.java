package com.ezen.spring.polymorphism;

public class SamsungTV implements TV{
	int ch = 0;
	//의존성 관계 생성
	//소니스피커에 의존함
	Speaker speaker;
	int price;
	
	public SamsungTV() {
		System.out.println("====> 삼성 티비 객체 생성");
	}
	
	public SamsungTV(Speaker speaker) {
		//의존성 주입
		this.speaker = speaker;
		System.out.println("====> 삼성 티비 객체 생성(매개변수 있는 생성자)");
	}
	
	public SamsungTV(Speaker speaker, int price) {
		//의존성 주입
		this.speaker = speaker;
		this.price = price;
		System.out.println("====> 삼성 티비 객체 생성(다중 매개변수 있는 생성자)");
	}
	
	//멤버변수 초기화 해주는 초기화 메소드
	//init-method 속성으로 등록하여 
	//항상 전원을 켜면 10채널부터 켜지도록 설정
	public void initMethod() {
		this.ch = 10;
	}
	
	//객체가 삭제되기 전에 실행될 메소드
	//destroy-method로 등록하여
	//항상 객체가 삭제되기 전에 채널을 20으로 변경
	public void destroyMethod() {
		this.ch = 20;
		System.out.println("객체 삭제 전 채널: " + ch);
	}
	
	@Override
	public void turnOn() {
		System.out.println("SamsungTV --- 전원 켜기");
		System.out.println("SamsungTV --- 현재 채널: " + ch);
		System.out.println("SamsungTV --- 가격: " + price);
	}
	@Override
	public void turnOff() {
		System.out.println("SamsungTV --- 전원 끄기");
	}
	@Override
	public void volumeUp() {
		//System.out.println("SamsungTV --- 소리 증가");
		
		//생성자 함수를 통해 주입 의존성을 이용
		speaker.volumeUp();
	}
	@Override
	public void volumeDown() {
		//System.out.println("SamsungTV --- 소리 감소");
		
		//생성자 함수를 통해 주입 의존성을 이용
		speaker.volumeUp();
	}
}
