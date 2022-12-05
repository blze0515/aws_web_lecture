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
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h3>게시글 목록</h3>
		<table id="boardTable" border="1" style="width: 700px; border-collapse: collapse;">
			<tr>
				<th style="backgrond: skyblue; width: 100px;">번호</th>
				<th style="backgrond: skyblue; width: 200px;">제목</th>
				<th style="backgrond: skyblue; width: 150px;">작성자</th>
				<th style="backgrond: skyblue; width: 150px;">등록일</th>
				<th style="backgrond: skyblue; width: 100px;">조회수</th> 
			</tr>
			<tr class="dataTr">
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
	
	<script>
		$(function() {
			$.ajax({
				url: "/board/getBoardList.do",
				type: "post",
				success: function(obj) {
					console.log(obj);
					let data = JSON.parse(obj);
					
					let htmlStr = "";
					
					for(let i = 0; i < data.boardList.length; i++) {
						htmlStr += "<tr class='dataTr'>";
						htmlStr += "<td>" + data.boardList[i].boardNo + "</td>";
						htmlStr += "<td>";
						htmlStr += "	<a href='/board/getBoard.do?boardNo=" + data.boardList[i].boardNo + 
										"'>" + data.boardList[i].boardTitle + "</a>";
						htmlStr += "</td>";
						htmlStr += "<td>" + data.boardList[i].boardWriter + "</td>";
						htmlStr += "<td>" + data.boardList[i].boardRegdate + "</td>";
						htmlStr += "<td>" + data.boardList[i].boardCnt + "</td>";
						htmlStr += "</tr>";
					}
					
					$(".dataTr").remove();
					$("#boardTable").append(htmlStr);
					
					
					
					
				},
				error: function(e) {
					console.log(e);
				}
			});
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>