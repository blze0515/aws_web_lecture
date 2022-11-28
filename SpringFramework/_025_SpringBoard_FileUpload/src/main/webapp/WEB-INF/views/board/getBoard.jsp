<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h3>게시글 상세</h3>
		<form id="updateForm" action="/board/updateBoard.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo }">
			<input type="hidden" name="originFiles" id="originFiles">
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
				<tr>
					<td style="background: skyblue; width: 70px;">
						파일첨부
					</td>
					<td style="text-align: left;">
						<div id="image_preview">
							<input type="file" id="btnAtt" name="uploadFiles" multiple="multiple">
							<input type="file" id="changedFiles" name="changedFiles"
							style="display: none;" multiple="multiple">
							<div id="attZone">
								<c:forEach items="${boardFileList }" var="boardFile"
								varStatus="status">
									<div style="display: inline-block; position: relative; 
									width: 150px; height: 120px; margin: 5px; border: 1px solid #00f; z-index: 1;">
										<input type="hidden" id="boardFileNo${status.index }" name="boardFileNo${status.index }" 
												value="${boardFile.boardFileNo }">
										<input type="hidden" id="boardFileNm${status.index }" name="boardFileNm${status.index }" 
												value="${boardFile.boardFileNm }">
										<input type="file" id="changedFile${boardFile.boardFileNo }" name="changedFile${boardFile.boardFileNo }"
										style="display: none;" onchange="fnGetChangedFileInfo(${boardFile.boardFileNo }, event)">
										<c:if test="${status.last }">
											<input type="hidden" id="boardFileCnt" name="boardFileCnt" value="${status.count }">
										</c:if>
										<c:choose>
											<c:when test="${boardFile.boardFileCate eq 'img' }">
												<img id="img${boardFile.boardFileNo }" src="/upload/${boardFile.boardFileNm }"
												style="width: 100%; height: 100%; z-index: none; cursor: pointer;" 
												class="fileImg" onclick="fnImgChange(${boardFile.boardFileNo})">
											</c:when>
											<c:otherwise>
												<img id="img${boardFile.boardFileNo }" src="/images/defaultFileImg.png"
												style="width: 100%; height: 100%; z-index: none; cursor: pointer;" 
												class="fileImg" onclick="fnImgChange(${boardFile.boardFileNo})">
											</c:otherwise>					
										</c:choose>
										<input type="button" class="btnDel" value="x" delFile="${boardFile.boardFileNo }"
										style="width: 30px; height: 30px; position: absolute; right: 0px; bottom: 0px; 
										z-index: 999; background-color: rgba(255, 255, 255, 0.1); color: #f00;"
										onclick="fnImgDel(event)">
										<p id="fileNm${boardFile.boardFileNo }" style="display: inline-block; font-size: 8px;">
											${boardFile.boardOriginFileNm }
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
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
		//추가된 파일들을 담아줄 배열. File객체로 하나씩 담음
		let uploadFiles = [];
		//기존 첨부파일 배열
		let originFiles = [];
		//변경된 첨부파일 배열
		let changedFiles = [];
	
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
			
			$("#updateForm").on("submit", function(e) {
				dt = new DataTransfer();
				
				for(f in uploadFiles) {
					let file = uploadFiles[f];
					dt.items.add(file);
				}
				
				$("#btnAtt")[0].files = dt.files;
				
				//changedFiles배열에 담겨있는 파일들을 input 옮겨담기
				//위에서 사용한 DataTransfer객체 비워주기
				dt.clearData();
				
				for(f in changedFiles) {
					let file = changedFiles[f];
					dt.items.add(file);
				}
				
				$("#changedFiles")[0].files = dt.files;
				
				//변경된 파일정보와 삭제된 파일정보를 담고있는 배열 전송
				//배열 형태로 전송 시 백단(Java)에서 처리불가
				//JSON String 형태로 변환하여 전송한다.
				$("#originFiles").val(JSON.stringify(originFiles));
			});
			
			for(let i = 0; i < $("#boardFileCnt").val(); i++) {
				const originFileObj = {
					boardNo: $("#boardNo").val(),
					boardFileNo: $("#boardFileNo" + i).val(),
					boardFileNm: $("#boardFileNm" + i).val(),
					//업로드 파일 경로가 각각 다를때는 boardFilePath 속성도 추가
					//파일 상태값(수정되거나 삭제된 파일은 변경)
					boardFileStatus: "N"
				};
				
				originFiles.push(originFileObj);
			}
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
		
		function fnImgChange(boardFileNo) {
			//기존 파일의 이미지를 클릭했을 때 같은 레벨의 input type="file"을 가져온다.
			let changedFile = document.getElementById("changedFile" + boardFileNo);
			//위에서 가져온 input 강제클릭 이벤트 발생시킴
			changedFile.click();
		}
		
		function fnGetChangedFileInfo(boardFileNo, e) {
			//변경된 파일 받아오기
			const files = e.target.files;
			//받아온 파일 배열 형태로 변경(싱글파일 업로드여서 파일배열 한개의 인자만 담김)
			const fileArr = Array.prototype.slice.call(files);
			
			//변경된 파일들은 변경된 파일 배열에 담아준다.
			changedFiles.push(fileArr[0]);			
			
			//미리보기 화면에서 변경된 파일의 이미지 출력
			const reader = new FileReader();
			
			reader.onload = function(ee) {
				const img = document.getElementById("img" + boardFileNo);
				const p = document.getElementById("fileNm" + boardFileNo);
				
				p.textContent = fileArr[0].name;
				
				//이미지인지 체크
				if(fileArr[0].name.match(/(.*?)\.(jpg|jpeg|png|gif|bmp|svg)$/))
					img.src = ee.target.result;
				else
					img.src = "/images/defaultFileImg.png";
			}
			
			reader.readAsDataURL(fileArr[0]);
			
			//기존 파일을 담고있는 배열에서 변경이 일어난 파일 수정
			for(let i = 0; i < originFiles.length; i++) {
				if(boardFileNo == originFiles[i].boardFileNo) {
					originFiles[i].boardFileStatus = "U";
					originFiles[i].newFileNm = fileArr[0].name;
				}
			}
		}
		
		//x버튼 클릭시 동작하는 메소드
		function fnImgDel(e) {
			//클릭된 태그 가져오기
			let ele = e.srcElement;
			//delFile속성 값 가져오기(boardFileNo)
			let delFile = ele.getAttribute("delFile");	
			
			for(let i = 0; i < originFiles.length; i++) {
				if(delFile == originFiles[i].boardFileNo) {
					originFiles[i].boardFileStatus = "D";
				}
			}
			
			//부모 요소인 div 삭제
			let div = ele.parentNode;
			$(div).remove();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>