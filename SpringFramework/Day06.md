# 1. JSTL(Jsp Standard Tag Library)
1. jstl
- 서버 사이드 렌더링 라이브러리
- ${value} ==> <%=value%>
- jsp에서 사용되던 자바 문법들을 빼기 위해서 개발
- <%= %> ==> ${}
- <%= if %> => <c:if>
- <%= for %> => <c:forEach>

2. el표기법(Expression Language)
- ${}
- 객체의 속성값을 꺼낼 때 주로 사용된다.
- model.addAttribute("user", userVO);
- ${user.userId}
- 자바표현식보다 간편하고 편리해서 jsp에서 많이 사용된다.