# 1. 웹 개발의 역사

1. Servlet 등장 전
- 초창기 web은 html, css 파일(정적파일)만 넘겨주는 web server의 기능만 존재.
- DB에서 가져온 동적 데이터를 표출할 수 없는 문제 발생
<p style="text-align: center;"><img src="images/초창기web.PNG"></p>
- 그래서 등장한 개념이 CGI(Common Gateway Interface: 동적 데이터 처리에 대한 공통규약)이다.
- CGI 클라이언트에서 request가 오면 WebServer에서 CGI프로그램을 호출하게 되고 CGI프로그램은 요청 하나 당
  프로세스 하나씩을 생성하여 동적 데이터를 처리하게 됨.
- CGI프로그램은 처음에 문제가 없어보였지만 야후같은 대형사이트(사용자가 다수인)가 등장하면서 문제가 발생된다.
- 프로세스는 사용자의 요청이 많아지면 메모리가 계속해서 증가하고 먼저 생성된 프로세스가 처리되기 전까지는 다음
  프로세스가 진행되지 않는 문제점이 있었다.
<p style="text-align: center;"><img src="images/CGIweb.PNG"></p>
<p style="text-align: center;"><img src="images/CGIweb문제점.PNG"></p>

2. Servlet
- 위에 서술한 문제점들을 보완하기 위해 고안된 방식이 Servlet. Servlet은 요청 하나당 프로세스를 생성하지 않고
  스레드를 하나 씩 생성. 스레드를 통한 병렬 분산처리로 다중 요청에 대한 처리속도를 끌어올렸다. 그리고 Java 소스에서
  HTML 웹 문서를 만들 수 있도록 구현되어 있어 Web Server 성능을 향상시킴.
- Servlet에서 HTML 웹 문서를 만드는 작업이 매우 복잡하고 귀찮은 작업이었다.
<p style="text-align: center;"><img src="images/Servlet.PNG"></p>
<p style="text-align: center;"><img src="images/Servlet의쓰레드.PNG"></p>

3. JSP(Java Server Page)
- Servlet의 소스 코드가 너무 복잡하여 HTML에서 java소스를 사용할 수 있도록 고안된 방식
- 소스코드를 구현하기 쉽고 개발 기간 단축, 화면단과 비즈니스 로직을 모두 가지고 있다.(Model1 방식의 개발)
- 비즈니스 로직과 화면단 소스 코드가 한 파일에 존재하여 코드가 어지럽고 더러워지는 단점이 존재한다.
<p style="text-align: center;"><img src="images/JSP(Model1).PNG"></p>

4. Model2(JSP + Servlet)
- 현재 제일 많이 사용되는 MVC(Model View Controller)의 시초
- JSP는 화면단만 담당, PageController(Servlet)은 화면단과 모델을 연결, Model(비즈니스 로직, Java)
<p style="text-align: center;"><img src="images/Model2MVC.PNG"></p>

5. MVC 패턴
- Model2 방식에서 좀 진화된 형태의 패턴
- PageController 하나만 존재하던 Model2방식과 다르게 기능별 Controller로 세분화(Http 프로토콜(규약)을 따르는 
  HttpServlet을 상속받아 구현)
- Model부분도 비즈니스 로직을 담당하는 Service, ServiceImpl과 데이터를 담당하는 DAO로 세분화
<p style="text-align: center;"><img src="images/MVC.PNG"></p>
<br>

# 2. WEB/WAS
1. WEB서버: 클라이언트에서 요청이 들어올 때 제일 먼저 요청을 받아주는 서버. 요청을 WAS로 보낼 것인지 WEB 서버에서 처리가
            가능한 일인지 판단하여 처리함. WEB 서버에는 정적파일(HTML, CSS, jpg, png, JS ....)들이 저장되어 있음.
            클라이언트가 정적파일을 요청하면 WEB 서버에서 바로 정적파일을 클라이언트로 전달.
            클라이언트가 컴파일이 필요한 동적파일(JSP, Java...)나 DB연동을 요청할 시에는 이 요청을 WAS(Web Application Server)로 전달. Web 서버는 기본적으로 80포트 사용. 잘 알려진 Web 서버의 종류로는 Apache, IIS, ngix, Webtob...등이 있다.

2. WAS(Web Application Server): 실제로 개발자들이 개발한 소스코드를 동작시키는 서버. 화면단 JSP나 비즈로직인 Java, 
                                SQL 쿼리까지 모두 WAS에서 실행됨. WAS는 실행될 때 Servlet Container(서블릿의 생명주기를 관리하는 틀) 동작시킴. 대부분의 경우에 WEB-INF폴더의 web.xml을 읽어서 서블릿 컨테이너를 구동한다. WAS 기본적으로 8080포트를 사용. 잘 알려진 WAS로는 tomcat, 
                                Jeus, Web Logic, Jetty... 등이 있다.