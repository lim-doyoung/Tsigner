<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="noticedetail">	<!-- 상세 페이지 -->
			
			
				<h1>글쓰기</h1>
				<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">플래너
				</label>
				<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 자유게시판
				</label>
				<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 투게더
				</label>
				<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> 여행후기
				</label>
				<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5"> 질문
				</label>
				<div id="addFile">
					<button class="btn btn-default" type="submit">첨부파일</button>
				</div>
				
		
		
				
			<form action="update" method="post">
			
			
					<div>
						<input type="text" name="sub" class="form-control" value="${noticedetail.noti_title }" >
							
					</div>
					<div>
						<textarea class="form-control" name="content"  rows="20">${noticedetail.noti_content }
						</textarea>
					</div>
				
				
				<div id="updateBtns">
					<button class="btn btn-primary" onclick="updateOne();">수정하기</button> 
					<button class="btn btn-default" type="reset">취소</button>
					
				</div>
			
			</form>
		
			
		</div>  <!-- 상세 페이지 끝-->
</body>
</html>