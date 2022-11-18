<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.form-wrapper {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#joinForm {
		width: 250px;
		text-align: center;
	}
	
	#joinForm .label-wrapper {
		margin-top: 20px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#joinForm input {
		width: 100%;
	}
	
	#joinForm div {
		display: flex;
		align-items: center;
	}
	
	#btnIdCheck {
		width: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div class="form-wrapper">
		<form id="joinForm" action="" method="post">
			<h3>회원가입</h3>
			<div class="label-wrapper">
				<label for="userId">아이디</label>
			</div>
			<div>
				<input type="text" id="userId" name="userId" required style="width: auto;">
				<button type="button" id="btnIdCheck" style="width: 70px">중복체크</button>
			</div>
			<div class="label-wrapper">
				<label for="userPw">비밀번호</label>
			</div>
			<input type="password" id="userPw" name="userPw" required>
			<div class="label-wrapper">
				<label for="userPwCheck">비밀번호 확인</label>
			</div>
			<input type="password" id="userPwCheck" name="userPwCheck" required>
			<div class="label-wrapper">
				<label for="userNm">이름</label>
			</div>
			<input type="text" id="userNm" name="userNm" required>
			<div class="label-wrapper">
				<label for="userMail">이메일</label>
			</div>
			<input type="email" id="userMail" name="userMail" required>
			<div class="label-wrapper">
				<label for="userTel">전화번호</label>
			</div>
			<input type="text" id="userTel" name="userTel" placeholder="숫자만 입력하세요.">
			<div style="display: block; margin: 20px auto;">
				<button type="submit">회원가입</button>
			</div>
		</form>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>