<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#attZone {
		width: 660px;
		min-height: 150px;
		padding: 10px;
		border: 1px dotted #00f;
	}
	
	#attZone:empty:before {
		content: attr(data-placeholder);
		color: #999;
		font-size: 0.9em;
	}
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
		<h3>새 글 등록</h3>
		<form id="insertForm" action="/board/insertBoard.do" method="post" enctype="multipart/form-data">
			<table border="1" style="border-collapse: collapse">
				<tr>
					<td style="background: skyblue; width: 70px;">
						제목
					</td>
					<td style="text-align: left;">
						<input type="text" name="boardTitle">
					</td>
				</tr>
				<tr>
					<td style="background: skyblue;">
						작성자
					</td>
					<td style="text-align: left;">
						<input type="text" name="boardWriter" value="${loginUser.userId }" readonly>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue; width: 70px;">
						내용
					</td>
					<td style="text-align: left;">
						<textarea name="boardContent" cols="40" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td style="background: skyblue; width: 70px;">
						파일첨부
					</td>
					<td>
						<div id="image_preview">
							<input type="file" id="btnAtt" name="uploadFiles" multiple="multiple">
							<div id="attZone"
								 data-placeholder="파일을 첨부하려면 파일선택 버튼을 누르세요."></div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">새 글 등록</button>
					</td>
				</tr>
			</table>
		</form>
		<hr/>
		<a href="/board/getBoardList.do">글 목록</a>
	</div>
	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
	<script>
		//추가된 파일들을 담아줄 배열. File객체로 하나씩 담음
		let uploadFiles = [];
	
		$(function() {
			//input type=file이 변경되면 미리보기 동작
			$("#btnAtt").on("change", function(e) {
				//input type=file에 추가된 파일들을 변수로 받아옴
				const files = e.target.files;

				//변수로 받아온 파일들을 배열 형태로 변환
				const fileArr = Array.prototype.slice.call(files);
				
				//배열에 있는 파일들을 하나씩 꺼내서 처리
				for(f of fileArr) {
					imageLoader(f);
				}
			});
			
			$("#insertForm").on("submit", function() {
				//마지막으로 btnAtt에 uploadFiles에 있는 파일들을 담아준다.
				dt = new DataTransfer();
				
				for(f in uploadFiles) {
					const file = uploadFiles[f];
					dt.items.add(file);
				}
				
				$("#btnAtt")[0].files = dt.files;
			});
		});
		
		//미리보기 영역에 들어갈 img태그 생성 및 선택된 파일을 Base64 인코딩된 문자열 형태로 변환하여
		//미리보기가 가능하게 해줌
		function imageLoader(file) {
			uploadFiles.push(file);
			
			let reader = new FileReader();
			
			reader.onload = function(e) {
				//이미지를 표출해줄 img태그 선언
				let img = document.createElement("img");
				img.setAttribute("style", "width: 100%; height: 100%; z-index: none;");
				
				//이미지 파일인지 아닌지 체크
				if(file.name.toLowerCase().match(/(.*?)\.(jpg|jpeg|png|gif|svg|bmp)$/)) {
					//이미지 파일 미리보기 처리
					img.src = e.target.result;
				} else {
					//일반 파일 미리보기 처리
					img.src = "/images/defaultFileImg.png";
				}
				
				//미리보기 영역에 추가
				//미리보기 이미지 태그와 삭제 버튼 그리고 파일명을 표출하는 p태그를 묶어주는 div 만들어서
				//미리보기 영역에 추가
				$("#attZone").append(makeDiv(img, file));
			};
			
			//파일을 Base64 인코딩된 문자열로 변경
			reader.readAsDataURL(file);
		}
		
		//미리보기 영역에 들어가 div(img+button+p)를 생성하고 리턴
		function makeDiv(img, file) {
			//div 생성
			let div = document.createElement("div");
			div.setAttribute("style", "display: inline-block; position: relative;"
			+ " width: 150px; height: 120px; margin: 5px; border: 1px solid #00f; z-index: 1;");
			
			//button 생성
			let btn = document.createElement("input");
			btn.setAttribute("type", "button");
			btn.setAttribute("value", "x");
			btn.setAttribute("delFile", file.name);
			btn.setAttribute("style", "width: 30px; height: 30px; position: absolute;"
			+ " right: 0px; bottom: 0px; z-index: 999; background-color: rgba(255, 255, 255, 0.1);"
			+ " color: #f00;");
			
			//버튼 클릭 이벤트
			//버튼 클릭 시 해당 파일이 삭제되도록 설정
			btn.onclick = function(e) {
				//클릭된 버튼
				const ele = e.srcElement;
				//delFile(파일이름) 속성 꺼내오기: 삭제될 파일명
				const delFile = ele.getAttribute("delFile");
				
				for(let i = 0; i < uploadFiles.length; i++) {
					//배열에 담아놓은 파일들중에 해당 파일 삭제
					if(delFile == uploadFiles[i].name) {
						//배열에서 i번째 한개만 제거
						uploadFiles.splice(i, 1);
					}
				}
				
				//버튼 클릭 시 btnAtt에 첨부된 파일도 삭제
				//input type=file은 첨부된 파일들을 fileList 형태로 관리
				//fileList에 일반적인 File객체를 넣을 수 없고
				//DataTransfer라는 클래스를 이용하여 완전한 fileList 형태로 만들어서
				//input.files에 넣어줘야 된다.
				dt = new DataTransfer();
				
				for(f in uploadFiles) {
					const file = uploadFiles[f];
					dt.items.add(file);
				}
				
				$("#btnAtt")[0].files = dt.files;
				
				//해당 img를 담고있는 부모태그인 div 삭제
				const parentDiv = ele.parentNode;
				$(parentDiv).remove();
			}
			
			//파일명 표출할 p태그 생성
			const fName = document.createElement("p");
			fName.setAttribute("style", "display: inline-block; font-size: 8px;");
			fName.textContent = file.name;
			
			//div에 하나씩 추가
			div.appendChild(img);
			div.appendChild(btn);
			div.appendChild(fName);
			
			//완성된 div 리턴
			return div;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>