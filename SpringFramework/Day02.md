# 1. IoC 컨테이너
1. factory 디자인 패턴: 필요한 모듈(객체 등)을 미리 factory안에 모두 생성한 뒤 알맞은 모듈을 꺼내 사용하는 방식
2. 스프링 컨테이너에는 factory 디자인 패턴이 적용되어 있다.
   - <bean>으로 등록된 객체들을 스프링 컨테이너가 구동될 때 생성한다.
   - @Component(@Controller, @Service, @Repository 등)을 가지는 객체들도 스프링 컨테이너가 구동될 때 생성한다.
   - 이렇게 생성된 객체들을 factory안에 가지고 있다가 알맞은 객체 호출이 있을 때 알아서 의존성 주입을 실행한다.
3. IoC(Inverse of Control: 제어의 역전): 기존에 개발자들이 하던 객체 생성 및 의존성 주입을 스프링 컨테이너에서 알아서 
                                        처리한다.
   - <b>예제: 프로젝트 _04_SpringFramework_SpringContainer</b>

# 2. 스프링 XML 파일 설정
1. \<beans\> 루트 엘리먼트: 원격 저장소에 있는 설정 파일을 참조하여 \<bean\>의 생명주기 관리, \<bean\>외의 다른
                           엘리먼트 사용가능 하도록 만듬, 그리고 다른 여러가지 서비스를 제공
                           스프링 설정 파일은 항상 루트 엘리먼트로 \<beans\>를 사용해야 한다.
                           namespace 탭을 이용하면 사용할 엘리먼트의 설정 파일 참조가 쉬워진다.
2. \<import\> 엘리먼트: 스프링 설정 파일에서 사용할 외부 파일을 참조할 때 사용.
                        모든 설정들이 하나의 스프링 설정 파일에 작성되면 스프링 설정 파일의 길이가 길어지고 수정도 쉽지
                        않은 문제가 발생한다. 그래서 외부 파일로 설정파일을 분리하고 \<import\> 엘리먼트로 참조하여 사용한다.
                        대표적으로 DataBase 설정이나 Transaction 설정 등을 외부 파일로 분리하여 참조한다.
                        참조할 파일은 resource 속성으로 지정
                        \<import resource="context-database.xml"\>
                        \<import resource="context-transaction.xml"\>
3. \<bean\> 엘리먼트: 스프링 설정 파일에 클래스를 등록하고 그 클래스에 대한 객체가 자동적으로 생성돼야 할 때 \<bean\> 
                      엘리먼트 사용. \<bean\> 엘리먼트로 등록된 클래스는 스프링 컨테이너가 구동될 때 자동으로 객체 생성.

4. \<bean\> 엘리먼트의 속성
1. init-method
- init-method 속성을 사용하면 객체가 생성될 때 호출할 메소드를 지정할 수 있다. \<bean\> 엘리먼트로 생성되는 객체는 항상 기본 생성자를 호출하기 때문에 멤버변수의 초기화가 필요한 객체에는 init-method 속성으로 초기화 메소드를 등록해야 한다.
- \<bean id="sTv" class="....SamsungTV" init-method="메소드명"\>
- <b>예제 프로젝트: _005_SpringFramework_InitMethod</b>
2. destroy-method
- 스프링 컨테이너가 객체를 삭제하기 전에 객체에서 처리할 동작을 메소드로 만들어서 지정한다.
- \<bean id="sTv" class="....SamsungTV" destroy-method="메소드명"\>