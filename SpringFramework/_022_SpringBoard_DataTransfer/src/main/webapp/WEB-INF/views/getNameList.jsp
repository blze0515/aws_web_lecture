<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="divNameList">
		<c:forEach var="name" items="${nameList }">
			firstName: ${name.firstName }<br>
			lastName: ${name.lastName }<br>
			job: ${name.job }<br>
			age: ${name.age }<br><hr>
		</c:forEach>
	</div>
</body>
</html>