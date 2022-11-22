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
	
	#loginForm {
		width: 250px;
		text-align: center;
	}
	
	#loginForm .label-wrapper {
		margin-top: 20px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#loginForm input {
		width: 100%;
	}
	
	#loginForm div {
		display: flex;
		align-items: center;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	
	<div class="form-wrapper">
		<form id="loginForm">
			<input type="hidden" id="joinMsg" value="${joinMsg }">
			<h3>로그인</h3>
			<div class="label-wrapper">
				<label for="userId">아이디</label>
			</div>
			<input type="text" id="userId" name="userId" required>
			<div class="label-wrapper">
				<label for="userPw">비밀번호</label>
			</div>
			<input type="password" id="userPw" name="userPw" required>
			<div style="display: block; margin: 20px auto;">
				<button type="button" id="btnLogin">로그인</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			//회원가입 성공 시 메시지 출력
			if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
				alert($("#joinMsg").val());
			}
			
			//로그인 시 아이디나 비밀번호가 틀렸을 경우에
			//대비하여 폼 서브밋 대신 ajax로 처리
			$("#btnLogin").on("click", function() {
				$.ajax({
					url: "/user/login.do",
					type: "post",
					data: $("#loginForm").serialize(),
					success: function(obj) {
						console.log(obj);
						//id 체크
						if(obj == "idFail") {
							alert("존재하지 않는 아이디입니다.");
							$("#userId").focus();
							return;
						}
						
						//pw 체크
						if(obj =="pwFail") {
							alert("비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.");
							$("#userPw").focus();
							return;
						}
						
						//로그인 처리
						location.href="/index.jsp";
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		});
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>