package com.ezen.spring.polymorphism;

public class TvUser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//각 티비를 사용하기 위해 객체를 각각 생성해야 됨
		//의존성이 증가하고 결합도가 높아진다.
		//같은 기능을 하는 메소드들의 이름이 다르다.
		SamsungTV sTv = new SamsungTV();
		sTv.powerOn();
		sTv.volumeUp();
		sTv.volumeDown();
		sTv.powerOff();
		
		LgTV lTv = new LgTV();
		lTv.turnOn();
		lTv.soundUp();
		lTv.soundDown();
		lTv.turnOff();
	}

}
