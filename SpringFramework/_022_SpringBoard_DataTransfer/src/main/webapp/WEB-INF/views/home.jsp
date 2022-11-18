<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="insertName.do" method="post">
	<input name="firstName">
	<input name="lastName">
	<input name="job">
	<input name="age">
	<button>db저장</button>
</form>
<p>${hello }</p>
<c:forEach var="num" items="${list }" varStatus="status">
	<p>${num}, ${status.index }, ${status.count }</p>
</c:forEach>
<a href="getNameList.do">이름목록으로 이동</a>
</body>
</html>
