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
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>
	<br>
	<!-- 하단 nav -->
	<div class="container">

		<div class="page-header">
			<h1>
				Community Center <small>자유게시판</small>
			</h1>
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="community_planner">플래너</a></li>
			<li role="presentation" class="active"><a href="community_bbs">자유게시판</a></li>
			<li role="presentation"><a href="community_together">투게더</a></li>
			<li role="presentation"><a href="community">여행후기</a></li>
			<li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="jumbotron1">
					<div id="bbs">
						<table class="table table-hover" style="width: 80%; margin: auto;">
							<tr>
								<td width="5%">#</td>
								<td align="left">제목</td>
								<td width="10%">작성자</td>
								<td width="10%">작성일</td>
								<td width="10%">조회수</td>
							</tr>
							<%
								for (int i = 1; i < 5; i++) {
							%>
							<tr>
								<td><%=i%></td>
								<td>Title<%=i%></td>
								<td>tester<%=i%></td>
								<td>00-00</td>
								<td><%=i%></td>
							</tr>
							<%
								}
							%>
						</table>
						<div id="pageNum" style="text-align: center;">
						<nav>
							<ul class="pagination">
							
								<li><a href="bookingRoom?idx=" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<%
								for(int i=0; i<5; i++){
								%>
								<li><a href="bookingRoom?idx=<%=i+1%>"><%=i+1 %></a></li>
								<%}%>
								<li><a href="bookingRoom?idx=" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>