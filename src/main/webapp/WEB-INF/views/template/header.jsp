<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/tsigner.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function myModal() {
		//		$('#myModal .modal-header h4').text("입력페이지");
		//		$('#myModal form input').eq(0).val('');
		//		$('#myModal form input').eq(1).val('');
		//		$('#myModal form input').eq(2).val('');
		//		$('#myModal form textarea').val('');

		var options = {
			show : true
		};
		$('#myModal').modal(options);
		$('.modal-footer button').hide().eq(0).show();
	}

	//입력페이지
	function getAdd() {
		alert('getAdd');
		myModal();
		$('.modal-footer button').eq(1).show();

	}
</script>
<style type="text/css">
	#header {
		margin-bottom: -20px;
	}
	
	.intro-2 {
		background:
			url("https://mdbootstrap.com/img/Photos/Others/img (50).jpg")
			no-repeat center center;
		background-size: cover;
	}
	
	html, body, header, .view {
		height: 350px;
		padding-top: -10px;
	}
	
	.textLocation1 {
		top: 100%;
		margin-top: 100px;
	}
	
	#navi{
		height: 50px;
		background-color: white;
	}
</style>

<title>T singer</title>
</head>
<body>
	<%
		String root = request.getContextPath();
	%>
	<div id="header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div id="outNav">
						<nav class="navbar navbar-fixed-top" id="navi">
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
									<a id="fontTitle" class="navbar-brand" href="<%=root%>/">T
										Signer</a>
								</div>
	
								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse"
									id="bs-example-navbar-collapse-1">
	
									<ul class="nav navbar-nav">
										<li><a class="edit" href="<%=root%>/planner">PLANNER</a></li>
										<li><a class="edit" href="<%=root%>/booking">BOOKING</a></li>
										<li><a href="<%=root%>/community" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">COMMUNITY <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="<%=root%>/community_planner">플래너</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="<%=root%>/community_bbs">자유게시판</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="<%=root%>/community_together">투게더</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="<%=root%>/community">여행후기</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="<%=root%>/community_question">질문</a></li>
											</ul></li>
										<li><a href="<%=root%>/notice" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">NOTICE <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a id="customercenterBtn" href="">공지사항</a></li>
												<li role="separator" class="divider"></li>
												<li><a id="customercenterBtn" href="">업데이트</a></li>
												<li role="separator" class="divider"></li>
												<li><a id="customercenterBtn" href="">이벤트</a></li>
												<li role="separator" class="divider"></li>
												<li><a id="customercenterBtn" href="">고객센터</a></li>
												<li role="separator" class="divider"></li>
												<li><a id="methodBtn" href="#">이용방법</a></li>
												<li role="separator" class="divider"></li>
												
												<!-- 고객센터의 하위메뉴로 이동시켜야함 -->
												<li><a id="questBtn" href="#">문의하기</a></li>
												<li><a id="faqBtn" href="#">F A Q</a></li>
												<li><a id="tacBtn" href="#">이용약관</a></li>
	
												
											</ul></li>
									</ul>
									<ul class="nav navbar-nav navbar-right">
										<li><a class="edit" href="#" onclick="getAdd()">로그인</a></li>
									</ul>
	
	
								</div>
								<!-- /.navbar-collapse -->
							</div>
							<!-- /.container-fluid -->
						</nav>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="view intro-2">
		<div class="full-bg-img">
			<div class="mask rgba-black-light flex-center">
				<div class="container text-center white-text">
					<div class="white-text text-center wow fadeInUp">
						<h2 class="textLocation1">This Navbar is fixed</h2>
						<p class="textLocation2">
							It will always stay visible on the top, even when you scroll down<br>
							Full page intro with background image will be always displayed in
							full screen mode, regardless of device
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form method="POST" class="form-horizontal">
							<input type="hidden" name="num" id="num" />
							<div class="form-group">
								<label for="sub" class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="sub"
										placeholder="sub" name="sub">
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-sm-2 control-label">글쓴이</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name"
										placeholder="name" name="name">
								</div>
							</div>
							<div class="form-group">
								<label for="ctnt" class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="ctnt" name="content"
										placeholder="content"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="insertOne()">입력</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="updateOne()">수정</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>