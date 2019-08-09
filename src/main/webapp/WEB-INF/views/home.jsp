<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<style type="text/css">
#videobg>video {
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	overflow: hidden;
	z-index: -1000;
}

.edit {
	color: white;
}

.edit:hover {
	color: gray;
}

.nav>li>a:hover {
	background: rgba(0, 0, 0, 0);
}

.nav>li>a:active {
	background-color: rgba(0, 0, 0, 0);
}

.icon-bar {
	background: white;
}

#box {
	height: 100%;
}

.carousel-inner img {
	width: 100%;
}
</style>
<title>T singer</title>
</head>
<body>
	<div id="videobg">
		<video id="video" preload="auto" autoplay="autoplay" loop="loop"
			muted="muted">
			<source src="video/main.mp4" type="video/mp4">
		</video>
	</div>
	<%
		String root = request.getContextPath();
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">

				<nav class="navbar navbar-fixed-top">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand edit" href="<%=root%>">T signer</a>
						</div>

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a class="edit" href="<%=root%>/pay">HOME</a></li>
								<li><a class="edit" href="#">NOTICE</a></li>
								<li><a class="edit" href="#">PLANER</a></li>
								<li><a class="edit" href="<%=root%>/booking">BOOKING</a></li>
								<li><a class="edit" href="#">COMMUNITY</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li><a class="edit" href="#">로그인/회원가입</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>

			</div>
		</div>
		<div id="box"></div>
		<div class="row">

			<div class="col-md-4">
				<div id="carousel-example-generic1" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="imgs/b01.jpg" alt="...">
						</div>
						<div class="item">
							<img src="imgs/b02.jpg" alt="...">
						</div>
						<div class="item">
							<img src="imgs/b03.jpg" alt="...">
						</div>
					</div>

				</div>
			</div>
			<div class="col-md-4">
				<div id="carousel-example-generic2" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic2" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic2" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic2" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="imgs/b01.jpg" alt="...">
						</div>
						<div class="item">
							<img src="imgs/b02.jpg" alt="...">
						</div>
						<div class="item">
							<img src="imgs/b03.jpg" alt="...">
						</div>
					</div>

				</div>
			</div>
			<div class="col-md-4">
				<div class="jumbotron">
					<div class="container">공지사항</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>