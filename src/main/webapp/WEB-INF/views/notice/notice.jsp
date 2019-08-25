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
<script type="text/javascript">

$(document).ready(function(){
	$('#noticeadd').hide();

	$('#addBtn>button').click(function(){
		$('#noticelist').hide();
		$('#noticeadd').show();

	});
	
	
});


</script>

<style type="text/css">
		#pageNum {
			text-align: center;
		}
		
		#addBtn {
			text-align: right;
		}
		#addBtns {
			text-align: center;
		}
		
		#updateBtns {
			text-align: center;
		}
		
		
		#addFile {
			text-align: right;
		}
		.detailList{
			display: block;
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
<div id="noticelist">		<!-- 자유게시판 리스트 시작-->	
					
					<div class="row">
						<br>
						<br>
						
					</div>
					
					<div>
						<nav class="navbar navbar-default">
						  <div class="container-fluid">
						    <!-- Brand and toggle get grouped for better mobile display -->
						   
						
						    <!-- Collect the nav links, forms, and other content for toggling -->
						    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						      <ul class="nav navbar-nav">
						       
						        <li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">전체 <span class="caret"></span></a>
						          <ul class="dropdown-menu">
						            <li><a href="#">추천순</a></li>
						            <li><a href="#">조회순</a></li>
						            
						          </ul>
						        </li>
						      </ul>
						      <form class="navbar-form navbar-left">
						      
						      </form>
						      <ul class="nav navbar-nav navbar-right">
						       
						        <li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">전체 <span class="caret"></span></a>
						          <ul class="dropdown-menu">
						            <li><a href="#">제목</a></li>
						            <li><a href="#">글쓴이</a></li>
						            <li><a href="#">내용</a></li>
						           
						          </ul>
						        </li>
							        <form class="navbar-form navbar-right">
							        <div class="form-group">
							          <input type="text" class="form-control" placeholder="Search">
							        </div>
							        <button type="submit" class="btn btn-default">Submit</button>
							      </form>
						      </ul>
						    </div><!-- /.navbar-collapse -->
						  </div><!-- /.container-fluid -->
						</nav>
					</div>
					
					
					<div class="detaillist">
						<table class="table table-bordered">
		 					<tr>
		 						<th>글 번호</th>
		 						<th>제목</th>
		 						<th>작성자</th>
		 						<th>작성일</th>
		 						<th>조회수</th>
		 					</tr>
		 					<c:forEach items="${noticelist }" var="bean">
		 						<tr>
		 							<td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_seq }</a></td>
		 							<td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_title }</a></td>
		 							<td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_writer_id }</a></td>
		 							<td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.regi_date }</a></td>
		 							<td><a class="detailList" href="notice/detail?idx=${bean.noti_seq }">${bean.noti_hits }</a></td>
		 						</tr>
		 					</c:forEach>
		 					
						</table>
					</div>
					
				
						<div id="addBtn">
								<button class="btn btn-default" type="submit">글쓰기</button>
						</div>
					
					
					<div id="pageNum">
							<nav aria-label="Page navigation">
							  <ul class="pagination">
							    <li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							  </ul>
							</nav>
					
					</div>
</div>		<!-- 자유게시판 리스트 끝-->	



<div id="noticeadd">	<!-- 글쓰기 페이지 -->
			
			
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
		<form action="notice/add" method="post" enctype="multipart/form-data">
			<div id="addFile">
				<label>
					<input type="file" name="upload_files" />
				</label>	
				
			</div>
		<!-- 첨부파일 끝 -->
		
		<div>
				<input type="text" name="noti_title" class="form-control" placeholder="제목을 입력해주세요">
				
			</div>
			<div>
				<textarea class="form-control" name="noti_content" placeholder="내용을 입력해주세요" rows="20"></textarea>
			</div>
			
			<div id="addBtns">
				<button class="btn btn-primary" type="submit">등록하기</button>
				<button class="btn btn-default" type="reset">취소</button>
				
			</div>
		
		</form>
		
		</div>  <!-- 글쓰기 페이지 끝-->
		
		</div>
				
				
		
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>