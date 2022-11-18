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
			<input type="hidden" name="nameNo" id="nameNo" value="${name.nameNo }">
			<a href="getName.do?nameNo=${name.nameNo }">firstName: ${name.firstName }</a><br>
			lastName: ${name.lastName }<br>
			job: ${name.job }<br>
			age: ${name.age }<br>
			<a href="deleteName.do?nameNo=${name.nameNo }">삭제</a><br><hr>
		</c:forEach>
	</div>
</body>
</html>