# 1. JNDI(JavaNaming and Directory API)
1. WAS에서 DB Connection Pool을 관리
2. JNDI 설정 순서
- tomcat의 server.xml에 DB Connection 생성(JNDI의 이름 생성)
- tomcat의 context.xml에 JNDI의 이름을 프로젝트에서 사용할 수 있도록 global로 설정
- 프로젝트의 web.xml에서 JNDI의 이름을 가져옴
- 스프링 설정파일에서 가져온 JNDI 이름을 사용하여 DB연동