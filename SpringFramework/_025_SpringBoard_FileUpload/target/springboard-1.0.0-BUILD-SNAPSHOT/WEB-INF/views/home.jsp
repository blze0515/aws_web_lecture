<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="hello.do" method="get">
	<input name="firstName">
	<input name="lastName">
	<input name="job">
	<input name="age">
	<button>get</button>
</form>
<p>${hello }</p>
<c:forEach var="num" items="${list }" varStatus="status">
	<p>${num}, ${status.index }, ${status.count }</p>
</c:forEach>
</body>
</html>
