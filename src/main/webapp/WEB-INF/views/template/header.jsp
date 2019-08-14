<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/mdb.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/tsigner.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

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
#header{
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
					<nav class="navbar">
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
								<a id="fontTitle" class="navbar-brand" href="<%=root%>/">T Signer</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">

								<ul class="nav navbar-nav">
									<li><a class="edit" href="<%=root%>/notice">NOTICE</a>
										<ul>
											<li>1</li>
											<li>2</li>
											<li>3</li>
										</ul>
									</li>
									<li><a class="edit" href="<%=root%>/planner">PLANER</a></li>
									<li><a class="edit" href="<%=root%>/booking">BOOKING</a></li>
									<li><a class="edit" href="<%=root%>/community">COMMUNITY</a></li>
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