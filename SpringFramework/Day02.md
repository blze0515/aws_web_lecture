# 1. IoC 컨테이너
1. factory 디자인 패턴: 필요한 모듈(객체 등)을 미리 factory안에 모두 생성한 뒤 알맞은 모듈을 꺼내 사용하는 방식
2. 스프링 컨테이너에는 factory 디자인 패턴이 적용되어 있다.
   - <bean>으로 등록된 객체들을 스프링 컨테이너가 구동될 때 생성한다.
   - @Component(@Controller, @Service, @Repository 등)을 가지는 객체들도 스프링 컨테이너가 구동될 때 생성한다.
   - 이렇게 생성된 객체들을 factory안에 가지고 있다가 알맞은 객체 호출이 있을 때 알아서 의존성 주입을 실행한다.
3. IoC(Inverse of Control: 제어의 역전): 기존에 개발자들이 하던 객체 생성 및 의존성 주입을 스프링 컨테이너에서 알아서 
                                        처리한다.
   - <b>예제: 프로젝트 _04_SpringFramework_SpringContainer</b>