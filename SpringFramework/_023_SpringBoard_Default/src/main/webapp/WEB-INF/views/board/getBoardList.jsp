<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h3>게시글 목록</h3>
		<table border="1" style="width: 700px; border-collapse: collapse;">
			<tr>
				<th style="backgrond: skyblue; width: 100px;">번호</th>
				<th style="backgrond: skyblue; width: 200px;">제목</th>
				<th style="backgrond: skyblue; width: 150px;">작성자</th>
				<th style="backgrond: skyblue; width: 150px;">등록일</th>
				<th style="backgrond: skyblue; width: 100px;">조회수</th> 
			</tr>
			<tr>
				<td>1</td>
				<td>
					<a href="/board/getBoard.do?boardSeq=1">제목1</a>
				</td>
				<td>작성자1</td>
				<td>2022.07.13</td>
				<td>1</td>
			</tr>
		</table>
		<br/>
		<a href="/board/insertBoard.do">새 글 등록</a>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>