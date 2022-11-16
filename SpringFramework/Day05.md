# 1. 트랜잭션 처리
1. 트랜잭션(Transaction)이란
- 트랜잭션은 DB에서 일어나는 작업의 단위
- DDL(insert, delete, update)을 실행할 때 항상 commit이나 rollback이 실행돼야 트랜잭션이 완료됨.
- 스프링에서는 aop기능을 이용해서 트랜잭션 처리를 설정할 수 있다.
2. 스프링에서의 트랜잭션
- 트랜잭션을 설정할 때는 애즈펙트대신 어드바이저를 사용한다.
- 개발자가 쿼리가 실패인지 성공인지를 결정할 수 없기 때문에 commit이나 rollback이 발생하는 순간을 알지 못함.
  따라서 어드바이저에게 commit, rollback 처리를 맡긴다. 어드바이저는 쿼리가 성공하면 commit을 실패하면 rollback을
  자동으로 호출한다.
- <b>예제 프로젝트: _019_SpringFramework_Transaction</b>

# 2. MyBatis
1. MyBatis란
- Sql Mapper Framework의 한 종류.
- iBatis가 apache에서 개발되어 주류를 이루고 있었는데 2010년에 구글이 iBatis를 인수하면서 이름을 MyBatis로 변경.
- 2010년부터 MyBatis가 성행했다. 요즘은 Sql Mapper Framework보다는 ORMFramework(JPA, Hibernate 등)가 유행하고 있다.
2. MyBatis의 구조
- DAO에서 쿼리문을 분리하여 따로 xml파일로 관리
- sql-map-config.xml과 같은 MyBatis 설정 파일이 존재. 조회쿼리에서 결과값의 표출방식(카멜케이스 등), 결과을 담아주거나
  쿼리의 매개변수를 담아줄 객체들의 alias를 설정할 수 있고 DAO에서 분리된 쿼리문 xml 파일이 어디에 위치하는지 설정
- 분리된 쿼리문 파일을 매퍼(Mapper)라고 부르는데 namespace는 DAO의 이름을 따라간다.(쿼리문이 DAO에서 분리됐기 때문)
- <xml 설정>
  <doctype 지정>
  <mapper 설정(namespace)>
    <select id="select"></select>
    <insert></insert>
    <update></update>
    <delete></delete>
  </mapper>
  DAO에서 쿼리 호출 시 "namespace.select"
  - <b>예제 프로젝트: _020_SpringFramework_Mybatis</b>
3. 동적쿼리(Dynamic Query)
- 조건에 따라 쿼리를 선택하여 실행
- <if>, <foreach>, <choose><when></when><otherwise></otherwise></choose>