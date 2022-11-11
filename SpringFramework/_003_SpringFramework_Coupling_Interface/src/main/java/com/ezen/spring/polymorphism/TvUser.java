package com.ezen.spring.polymorphism;

public class TvUser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//TV 인터페이스를 이용하여 결합도와 의존성을 낮춤
		//_02_ 프로젝트와 비교했을 때 생성되는 객체가 하나로
		//줄어서 의존성과 결합도가 낮아진다.
		TV tv;
		
		//티비를 변경하고 싶을 때 인스턴스화 하는 부분의 소스코드를
		//지속적으로 변경해야 한다.
		//스프링에서는 설정파일(스프링 컨테이너)에 미리 객체를 생성한 뒤
		//DI(의존성 주입)해주는 것을 지원한다.(팩토리 패턴)
		tv = new SamsungTV();
		tv.turnOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.turnOff();
		
//		tv = new LgTV();
//		tv.turnOn();
//		tv.volumeUp();
//		tv.volumeDown();
//		tv.turnOff();
	}

}
