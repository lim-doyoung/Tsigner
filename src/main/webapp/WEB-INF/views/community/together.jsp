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
a {
	color: currentColor;
	text-decoration: none;
}

p {
	font-size: 13px;
}

a:hover .card-outmore {
	background: #2C3E50;
	color: #fff;
}

a:hover .thecard {
	box-shadow: 0 10px 50px rgba(0, 0, 0, .6);
}

.thecard {
	width: 100%;
	margin: 5% auto;
	box-shadow: 0 1px 30px rgba(0, 0, 0, .4);
	display: block;
	background-color: #fff;
	border-radius: 4px;
	transition: 400ms ease;
}

.card-img {
	height: 225px;
}

.card-img img {
	display: block;
	margin: 0px auto;
	width: 100%;
	height: 250px;
	border-radius: 4px 4px 0px 0px;
}

.card-caption {
	position: relative;
	background: #ffffff;
	padding: 15px 25px 5px 25px;
	border-radius: 0px 0px 4px 4px;
}

.card-outmore {
	padding: 10px 25px 10px 25px;
	border-radius: 0px 0px 4px 4px;
	border-top: 1px solid #e0e0e0;
	background: #efefef;
	color: #222;
	display: inline-table;
	width: 100%;
	box-sizing: border-box;
	transition: 400ms ease;
}

.card-outmore h5 {
	float: left;
}

.card-outmore i {
	float: right;
}

span.date {
	font-size: 10px;
}

h1 {
	font-size: 22px;
}

h5 {
	margin: 0;
}

#like-btn {
	font-size: 18px;
	background: #446CB3;
	color: #fff;
	padding: 13px 15px;
	border-radius: 50em;
	position: absolute;
	right: 20px;
	box-shadow: 0 2px 1px rgba(0, 0, 0, .2);
	transition: 400ms ease;
}

#like-btn:hover {
	font-size: 18px;
	background: #3B5998;
	color: #fff;
	padding: 13px 15px;
	border-radius: 50em;
	position: absolute;
	right: 20px;
	box-shadow: 0 4px 5px rgba(0, 0, 0, .3);
}

#outmore-icon {
	border: 1px solid;
	padding: 1px 6px;
	border-radius: 50em;
}
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
				Community Center <small>Together</small>
			</h1>
		</div>

		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="community_planner">플래너</a></li>
			<li role="presentation"><a href="community_bbs">자유게시판</a></li>
			<li role="presentation"  class="active"><a href="community_together">투게더</a></li>
			<li role="presentation"><a href="community">여행후기</a></li>
			<li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
		<div class="row">
		<br>
			<%for(int i=1; i<8;i++){ %>
			
			<div class="col-md-3">
				<div class="thecard">
<%-- 					<div class="card-img">
						<img src="imgs/a<%=i %>.jpg">
					</div> --%>
					<div class="card-caption" style="background-image:url('imgs/a<%=i %>.jpg');">
	<%-- 						<img alt="" src="imgs/a<%=i %>.jpg"> --%>
						<i id="like-btn" class="fa fa-thumbs-o-up"></i> <span class="date">Thursday,
							July 16, 2015</span>
						<h1>The standard chunk of Lorem Ipsum</h1>
						<p>Sed posuere consectetur est at lobortis. Aenean eu leo
							quam.</p>
					</div>
					<div class="card-outmore">
						<h5>Read more</h5>
						<i id="outmore-icon" class="fa fa-angle-right"></i>
					</div>
				</div>
			</div>
			<%} %>
		</div>
	</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>