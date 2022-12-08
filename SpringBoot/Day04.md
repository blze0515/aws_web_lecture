# 1. JPA
1. JPA(Java Persitence API)
- Persistence(영속성): 우리가 개발한 어플리케이션이 종료되도 계속적으로 저장되어 있는 데이터(DB의 테이블 및 데이터)
- Entity(엔티티): 실제 DB에 생성될 테이블 클래스. 테이블의 이름, 키, 컬럼들을 정의
- 엔티티 클래스 선언 방식
  1) 클래스 선언문 위에 @Entity을 붙여준다.
  2) 시퀀스를 만드려면 @Entity밑에 @SequenceGenerator로 시퀀스를 만든다.
  3) 테이블 컬럼들을 정의한다.
  4) 키 값으로 지정될 컬럼위에 @Id을 붙여준다.
  5) 키 값의 전략은 @GeneratedValue를 사용하여 설정(
                                                  GenerationType.IDENTITY, 
                                                  GenerationType.SEQUENCE,
                                                  GenerationType.AUTO,
                                                  GenerationType.TABLE
                                                 )
  6) 특정 컬럼에 특정 속성(nullable, unique key 등)을 지정하고 싶으면 해당 컬럼 위에 @Column을 붙여준다.
  7) 테이블에 컬럼으로 생성되지 않을 변수들에는 @Transient를 붙여준다.
  8) 엔티티 클래스 작성 완료 후 서버를 부팅하면 JPA가 자동으로 테이블을 생성함.
- 엔티티 매니저(Entity Manager): 실제 쿼리를 구현하고 사용해주는 객체, JPA 초창기에는 직접 Entity Manager를 
                                구현하여 사용함. 현재는 Entity Manager를 내부에 가지고 있는 JpaRepository를 사용하여
                                간편하게 구현.
- JpaRepository: save, findBy, deleteBy, flush 등과 같은 Entity Manager의 메소드들을 정의해놓은 인터페이스
                 JpaRepository를 상속받은 인터페이스를 구현하므로써 Entity Manager의 메소드들을 사용할 수 있다.
- 인터페이스로 만들어도 사용할 수 있는 이유는 스프링내부에서 해당 Repository에 대한 Proxy 객체를 만들어서 컨테이너에 
  등록해준다. 따라서 결국 Jpa를 동작하게 하는 클래스는 스프링에 의해 생성된 Proxy객체이다.
- Repository 작성방식
  1) Repository 인터페이스 선언
  2) extends JpaRepository<해당 엔티티클래스, 해당 엔티티클래스의 키의 형태(Integer, String, IdClass 등)>
  3) Repository 등록 후 ServiceImpl에서 해당 Repository Proxy 객체를 호출하여 Entity Manager의 메소드들을
     사용한다. ex) boardTestRepository.save(), boardTestRepository.findById() 등
- 복합키(Composite Key): 키가 되는 컬럼이 두 개이상 존재하는 엔티티에는 복합키를 설정해야 한다.
- 복합키 설정방식
  1) 키가 될 변수에 @Id을 붙여준다.
  2) 엔티티 클래스 위에 @IdClass(복합키를 가지고 있는 클래스)을 선언
  3) 복합키를 가지고 있는 클래스 만들어 준다.
  4) 클래스의 이름은 엔티티명 + Id
  5) 복합키를 가지고 있는 클래스에는 엔티티 클래스에 @Id로 지정된 변수들을 선언.
     엔티티에 선언한 변수명과 동일한 변수명으로 선언.                       @조인방식(ManyToOne)
                                                                        @JoinColumn("테이블의 컬럼명")
  6) PK면서 FK인 컬럼은 FK를 가져올 해당 엔티티 객체를 만들어서 Id로 지정 => private BoardTest boardTest;
     단순 PK인 컬럼들은 객체가 아닌 값의 형태로 만들어 준다. => private int boardNo
- ORM(Object Relation Mapping): RDB의 테이블 관계들을 객체로 매핑해주는 프레임워크
- 관계생성(Foreign key)이 ORM 프레임워크의 핵심 기능
- 관계 생성(Foreign key) 방식
  1) FK로 가져온 컬럼이 PK일 때(거의 대부분 Composite Key)
     - FK로 가져올 컬럼을 소유하고 있는 엔티티 객체를 멤버 변수로 선언
     - 생성한 객체 멤버변수 위에 @Id를 붙여서 PK 지정
     - @ManyToOne or @OneToOne or @OneToMany 매핑 관계를 지정
     - @JoinColumn("테이블의 컬럼명") FK로 가져올 컬럼을 지정
     - IdClass에 조인된 컬럼 정의
     - 컬럼의 형태로 변수 생성, 변수명은 FK가 등록된 엔티티의 객체 이름을 동일하게 써줘야된다.
       ex) BoardFileTest => private BoardTest boardTest;
           BoardFileTestId => private int boardTest;
  2) FK로 가져온 컬럼이 FK 역할만 할 때
     - FK로 가져올 컬럼을 소유하고 있는 엔티티 객체를 멤버 변수로 선언
     - @ManyToOne or @OneToOne or @OneToMany 매핑 관계를 지정
     - @JoinColumn("테이블의 컬럼명") FK로 가져올 컬럼을 지정
  3) FK가 여러개일때(PK)
     - @JoinColums(
          @JoinColumn(name="테이블의 컬럼명", referenceColumnName="FK로 참조할 테이블 컬럼명"),
          @JoinColumn(name="테이블의 컬럼명", referenceColumnName="FK로 참조할 테이블 컬럼명"),
          @JoinColumn(name="테이블의 컬럼명", referenceColumnName="FK로 참조할 테이블 컬럼명")
       )
     - FK 여러개가 PK로 올 경우
       이미 원본테이블에도 IdClass가 지정되어있다.
       해당 엔티티의 IdClass를 만들 경우 멤버 변수로 원본테이블의 IdClass를 객체로 선언한다.
       ex)                     @Id 
                               @ManyToOne
                               @JoinColums(
                                  @JoinColumn(name="BOARD_NO", referenceColumnName="BOARD_NO"),
                                  @JoinColumn(name="BOARD_TITLE", referenceColumnName="BOARD_TITLE")
              BoardFileTest => )
                               private BoardTest boardTest;

                               @Id
                               private int boardFileNo;


              BoardFileTestId => private int boardFileNo;
                                 private BoardTestId boardTest; 


              BoardTestId => private int boardNo;
                             private String boardTitle;

# 2. Url 파라미터
1. Url 파라미터는 주소/전달할 파라미터
2. 유동적인 값을 넣는 형태의 파라미터 전달방식
3. Mapping("/주소/{받아올 인자값(boardNo)}")
   public void 메소드명(@PathVariable int 받아올 인자값(boardNo))
4. th:href="@{/board/board/{boardNo:변수명}} (변수명에 어떤 값이 들어가는지:boardNo=${board.boardNo})"
5. 한개의 파라미터만 전송할 수 있다.

# 3. SpringBoot와 SpringFramework
1. 화면단
- Framework: JSP, Boot:html
- Framework Template: jstl, Boot Template: thymeleaf
- Framework Controller: @Controller(return String), Boot Controller: @RestController(return ModelAndView, return ResponseEntity) ==> @ResponseBody + @Controller
- Service, ServiceImpl: 완전 동일
- DB접근 객체: Framework: DAO, Boot: Mapper Interface, Repository Interface(둘 다 혼용 가능)
- SQL Mapper: 동일
- html과 thymeleaf를 사용하기 때문에 API로는 구현이 힘들다
  html페이지로 이동하려면 controller를 거쳐야하기 때문
- 굳이 API를 개발하여 사용하려면 GetMapping은 화면으로만 이동
  화면 이동후 Ajax로 API를 호출해서 데이터만 받아가는 형식으로 진행한다.

































