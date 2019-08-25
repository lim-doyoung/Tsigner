<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<!-- Font Awesome -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<style type="text/css">
	#addFile {
			text-align: right;
		}
		
	.detailBtns{
	
		text-align: center;
	}
		
	
</style>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>
	<br>
	<%
		String root = request.getContextPath();
	%>
	<!-- 여기서부터 컨텐츠입니다 -->
	<div class="container">
			<!-- 컨텐츠의 내용을 입력하세요 -->
				
					<div class="page-header">
						<h1>
							Notice <small> 공지사항</small>
						</h1>
					</div>
			
					<ul class="nav nav-pills nav-justified">
						<li role="presentation" class="active"><a href="<%=root %>/notice">공지사항</a></li>
						<li role="presentation"><a href="<%=root %>">이용방법</a></li>
						<li role="presentation"><a href="<%=root %>">이벤트</a></li>
						<li role="presentation"><a href="<%=root %>">업데이트</a></li>
						
					</ul>

	<div id="noticedetail">	<!-- 상세 페이지 시작 -->
			
			
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
				
	<!-- 첨부파일 시작 -->	
	<form action="update" method="post" enctype="multipart/form-data">		
		<div id="addFile">
				<label>
					<input type="file" name="upload_files" />
				</label>	
		</div>
	<!-- 첨부파일 끝 -->
				
				<div>
					<input type="hidden" name="idx"  value="${noticedetail.noti_seq }" >
						
				</div>
					<div>
						<input type="text" name="sub" class="form-control" value="${noticedetail.noti_title }" >
					</div>
					<div>
						<textarea class="form-control" name="content"  rows="20" >${noticedetail.noti_content }
								
						</textarea>
						<!--  <img src="<c:url value='C:/java/workspace5/tsigner/src/main/webapp/upload/'/>" width="550" />
					-->
					</div>
				
				<div class="detailBtns"> 
					<button class="btn btn-primary" type="submit">수정하기</button> 
				</div>
			</form>
			
			<form action="delete" method="post">	
				<input type="hidden" name="idx"  value="${noticedetail.noti_seq }" >
				<div class="detailBtns"> 
					<button class="btn btn-danger" type="submit">삭제하기</button> 
					
				</div>
			
			</form>
		
			
		</div>  <!-- 상세 페이지 끝-->
		
	</div>
	
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>
	
</body>
</html>