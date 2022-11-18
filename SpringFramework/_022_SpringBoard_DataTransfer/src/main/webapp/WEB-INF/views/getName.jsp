<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="updateNameForm" action="updateName.do" method="post">
		<input type="hidden" name="nameNo" value="${name.nameNo }">
		<input name="firstName" value="${name.firstName }">
		<input name="lastName" value="${name.lastName }">
		<input name="job" value="${name.job }">
		<input name="age" value="${name.age }">
		<button>수정</button>
	</form>
</body>
</html>