# 강의 자료 및 소스코드

## 1. Spring Framework  
  1) 웹 개발의 역사  
    ① 초창기 웹  
    ② CGI  
    ③ Servlet  
    ④ JSP(Model1)  
    ⑤ Model2(MVC의 시초)  
    ⑥ MVC 패턴  
  2) WEB/WAS의 개념  
    ① WEB: 정적파일 처리 및 요청에 대한 판단  
    ② WAS: 동적파일 처리 및 데이터베이스 조작  
  3) Spring Framework  
    ① 웹 개발을 수월하게 진행할 수 있게 제공되는 개발 가이드나 뼈대  
    ② 장점: 빠른 구현 시간, 유지보수의 용이성, 개발자 능력의 획일화 및 인건비 감소, 라이브러리 관리  
    ③ 특징: DL(Dependency Lookup)-의존성 주입이 발생할 때 의존성에 맞는 객체를 자동으로 찾아주는 기능  
            DI(Dependency Injection)-의존성 주입. DL로 찾은 객체를 의존성으로 주입.  
            IoC(Inverse of Controll)-제어의 역전. 기존에 개발자들이 하던 작업을 스프링에서 대신 처리한다.(객체를 생성하거나 의존성을 주입하는 작업)  
            AOP(Aspect Oriented Programming)-관점 지향 프로그래밍. 로그찍기나 트랜잭션 등 비즈니스 로직과 항상 공통적으로 실행되는 기능을 코드로 작성하지 않고 스프링 설정으로 제어.
