# 1. AOP(Aspect Oriented Programming: 관점 지향 프로그래밍)
1. <b>예제 프로젝트: _013_SpringFramework_Log</b>
- 공통 관심인 로그찍기나 트랜잭션 등을 모든 비즈니스 메소드에 포함시키는 일은 매우 귀찮은 작업이다.
  중간에 모듈이 바뀌면 모든 비즈니스 메소드를 변경해야된다는 점도 단점이다.
2. 스프링 설정파일의 AOP
- 위의 문제점을 해결하고자 스프링은 설정파일로 공통관심들을 묶어서 관리한다.
- <b>예제 프로젝트: _014_SpringFramework_AOP</b>
  pom.xml에 aspectjweaver 의존성 추가 -> 스프링 컨테이너에 AOP 설정(namespace로 AOP추가)

# 2. AOP 용어 정리
1. 포인트컷(pointcut): 공통관심 메소드가 실행될 비즈니스 로직 메소드. expression으로 필터링된 메소드들.
                       만약 트랙잭션을 aop만들 경우 insert, delete, update 비즈니스 로직에만 호출.
                       select 비즈니스 로직에는 트랜잭션이 필요없다. 위와 같은 경우도 expression으로 필터링한다.
2. 조인포인트(joinpoint): 포인트컷 후보. 모든 비즈니스 로직 메소드가 조인포인트(포인트컷 후보)가 된다.
- <b>예제 프로젝트: _014_SpringFramework_AOP</b>
3. 포인트컷 expression: 포인트컷을 지정하는 조건. execution을 명시하고 매개변수로 포인트컷 조건을 넣어준다.
- execution(*, void, !void:포인트컷 대상이 되는 함수의 리턴타입 
            com.ezen.spring.service..: 패키지 지정. ..은 하위에 있는 모든 패키지 선택
            com.ezen.spring.service..impl: service 하위 패키지중에 impl로 끝나는 패키지 선택
            com.ezen.spring.service: com.ezen.spring.service 패키지만 선택
            *Impl: 클래스 선택. Impl로 끝나는 모든 클래스 선택
            BoardServiceImpl: BoardServiceImpl 클래스만 선택
            BoardService+: 해당 클래스에서 파생된 모든 자식클래스 선택.
                           인터페이스뒤에 +가 붙으면 인터페이스를 구현한 모든 클래스 선택
            .
            *: 메소드 이름 선택. 이름 상관없이 모든 메소드 선택
            get*: 메소드 이름이 get으로 시작하는 모든 메소드 선택
            (..): 메소드의 매개변수 선택. 매개변수의 타입과 개수 모두 제약이 없다.
            (*): 매개변수가 반드시 하나만 존재하는 메소드를 선택
            (com.ezen.spring.vo.BoardVO): 매개변수로 BoardVO만 가지고 있는 메소드 선택
            (!com.ezen.spring.vo.BoardVO): 매개변수로 BoardVO를 가지고 있지않은 메소드 선택
            (Integer, ..): 매개변수 개수와 타입 제약이 없지만 첫 번째 매개변수는 무조건 int형인 메소드를 선택
            (Integer, *): 매개변수가 2개이면서 첫 번째 매개변수는 무조건 int형인 메소드 선택)
4. 어드바이스(advice)
- 공통관심에 해당되는 공통 기능 코드(printLog, printLogging)
- 어드바이스를 설정할 때는 공통 기능 코드가 실행될 시점과 함께 설정한다.
5. 위빙(Weaving)
- 공통 기능 코드가 포인트컷에 주입되는 행위
- 위빙 기능이 있기 때문에 비즈니스 로직에 공통 기능 코드를 추가하지 않고도 공통 기능 코드가 실행된다.
6. 애즈펙트(aspect), 어드바이저(advisor)
- 애즈팩트: 어드바이스 + 포인트컷
- 포인트컷에 위빙이 이뤄져서 공통 기능 코드가 주입된 상태를 애즈팩트라고 한다.
- 공통 기능 코드의 메소드 명을 모르거나 공통 기능이 들어있는 클래스명을 모를 때는 애즈펙트대신 어드바이저를 사용한다.
- 트랜잭션 설정에서 commit, rollback 시점을 개발자가 정할 수 없기 때문에 어드바이저를 통해 commit, rollback이 알아서 
  처리되도록 설정한다.

# 3. AOP의 동작 시점
1. before: 비즈니스 메소드 실행 전에 aop를 동작시킴
2. after-returning: 비즈니스 메소드가 정상적으로 완료된 후에 동작
3. after-throwing: 비즈니스 메소드가 에러가 발생했을 때 동작
4. after: 비즈니스 메소드가 정상적으로 종료되거나 에러가 발생하거나 상관없이 메소드가 끝나면 무조건 동작
5. around: 비즈니스 메소드 실행 전후에 한 번씩 동작
- <b>예제 프로젝트: _015_SpringFramework_AOP_Timing</b>

# 4. JoinPoint 인터페이스
1. JoinPoint의 유용한 메소드 
- getSignature(): 포인트컷으로 지정되어 실행되고 있는 메소드의 시그니처(이름, 리턴타입, 매개변수)를 
                  Signature 객체에 담아서 리턴
- getTarget(): 호출된 비즈니스 메소드를 포함하는 객체를 리턴(insertBoard 호출 시 BoardServiceImpl 객체를 리턴)
- getArgs(): 호출된 비즈니스 메소드의 매개변수 값들을 Object배열로 리턴
2. getSignature() 후 Signature 객체로 사용할 수 있는 메소드
- getName(): 호출된 비즈니스 메소드의 이름을 String 타입으로 리턴
- toLongString(): 호출된 비즈니스 메소드의 이름, 리턴타입, 매개변수를 패키지경로까지 포함한 String 값 리턴
- toShortString(): 호출된 비즈니스 메소드의 이름, 리턴타입, 매개변수를 축약된 String 값 리턴
3. ProceedingJoinPoint 클래스
- JoinPoint 인터페이스를 상속받아 구현하고 proceed() 메소드를 추가한 클래스
- 현재 진행중인 포인트컷 메소드를 받아옴
- proceed() 메소드로 받아온 포인트컷 메소드를 진행시킴
- aop:before, aop:after-returning, aop:after-throwing, aop:after -> JoinPoint 객체 사용
- aop:around -> ProceedingJoinPoint 객체 사용
- <b>예제 프로젝트: _016_SpringFramework_AOP_JoinPoint</b>

# 5. AOP Annotataion
- <b>예제 프로젝트: _017_SpringFramework_AOP_Annotation</b>

# 6. JDBC Template
1. JDBC Template이란
- GoF의 디자인 패턴중 템플릿 디자인 패턴이 적용된 클래스.
- 템플릿 패턴은 반복되는 작업을 캡슐화하여 재사용할 수 있는 패턴으로 정의하는 방식
- DBCP의 DataSource를 의존성으로 주입받아 커넥션 풀 방식으로 사용된다. DB커넥션을 지정한 개수만큼 만들어놓고
  대여해주고 DB 연결이 끝날때 돌려받는 방식.
- <b>예제 프로젝트: _018_SpringFramework_JDBCTemplate</b>
2. JDBC Template에서 사용가능한 메소드
- upadte(): insert, update, delete 구문 처리 시 사용
            ? 인자값을 어떻게 처리할 지에 따라서 두 가지 방식으로 사용할 수 있다.
            1번 방식: 물음표 개수만큼 인자 값을 나열해서 보냄
            update(BOARD_INSERT, boardVO.getTitle(), boardVO.getContent(), boardVO.getWriter());
            2번 방식: 물음표 개수만큼의 배열을 생성하여 배열을 인자 값으로 보냄
            Object[] args = {boardVO.getTitle(), boardVO.getContent(), boardVO.getWriter()};
            update(BOARD_INSERT, args);
- queryForInt(): select구문으로 검색된 결과 값이 정수일 경우 사용. sum이나 count등을 조회하는 통계쿼리에서 사용.
- queryForObject(): select 구문으로 검색된 결과 값을 특정 자바 객체 매핑시켜 리턴받고 싶을 때 사용.
                    select 구문의 결과가 없거나 두 행이상이면 예외를 발생시킴.
                    단 건만 조회가 되는 쿼리에서 사용.
                    RowMapper라는 인터페이스를 상속하여 구현한 객체로 리턴 값을 받아준다.
                    RowMapper를 상속받아 구현한 객체에는 항상 mapRow() 메소드를 구현해야 한다.
                    mapRow() 메소드에서 쿼리 리턴 값과 VO를 매핑시켜준다.
                    BoardRowMapper(게시판 관련 RowMapper)
- query(): select 구문으로 검색된 결과 값이 목록일 때 사용.
           기본적인 사용법은 queryForObject()와 동일.
           RowMapper를 사용해서 VO와 매핑시킴. 한 건씩 VO와 매핑한 후 List에 담아서 리턴.
3. JDBC Template 객체를 얻어서 사용하는 방법
- JdbcDaoSupport를 상속받아 구현
  public class BoardDAO extends JdbcDaoSupport {
    @Autowired
    public void setSuperDataSource(DataSource dataSource) {
      super.setDataSource(dataSource);
    }

    public void insertBoard(BoardVO boardVO) {
      getJdbcTemplate().update(BOARD_INSERT, boardVO.getTitle()....)
    }
  }
- JDBC Template을 bean 객체로 등록

