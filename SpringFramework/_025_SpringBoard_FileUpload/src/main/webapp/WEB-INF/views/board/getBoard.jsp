<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h3>게시글 상세</h3>
		<form action="/board/updateBoard.do" method="post">
			<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td style="background: skyblue; width: 70px">
						제목
					</td>
					<td style="text-align: left">
						<input type="text" name="boardTitle" id="boardTitle" value="${board.boardTitle }">
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						작성자
					</td>
					<td style="text-align: left">
						<input type="text" name="boardWriter" id="boardWriter" value="${board.boardWriter }" readonly>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						내용
					</td>
					<td style="text-align: left">
						<textarea name="boardContent" id="boardContent" cols="40" rows="10">${board.boardContent }</textarea>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						작성일
					</td>
					<td style="text-align: left">
						<fmt:formatDate value="${board.boardRegdate }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						조회수
					</td>
					<td style="text-align: left">
						${board.boardCnt }
					</td>
				</tr>
				<tr id="btnWrap">
					<td colspan="2" align="center">
						<button type="submit" id="btnUpdate">수정</button>
					</td>
				</tr>
			</table>
		</form>
		<hr/>
		<a href="/board/insertBoard.do">글 등록</a>
		<a href="/board/deleteBoard.do?boardNo=${board.boardNo }" id="deleteBtn">글 삭제</a>
		<a href="/board/getBoardList.do">글 목록</a>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			//세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
			const loginUserId = '${loginUser.userId}';
			const boardWriter = '${board.boardWriter}';
			
			//게시글 작성자와 로그인 유저가 다르면 게시글 수정 못하게 설정
			if(loginUserId !== boardWriter) {
				$("#btnWrap").hide();
				$("#deleteBtn").hide();
				$("#boardTitle").attr("readonly", true);
				$("#boardContent").attr("readonly", true);
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		});
	</script>
</body>
</html>