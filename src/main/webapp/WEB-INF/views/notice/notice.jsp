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
	$(document).ready(function() {
		$('#customerImg').show();
		$('#method').hide();
		$('#qnaForm').hide();
		$('#faqForm').hide();

		pageMethod();
		$('#customercenterBtn').click(function() {
			pageCustmerCenter();
		});
		$('#methodBtn').click(function() {
			pageMethod();
		});
		$('#questBtn').click(function() {
			pageQuestion();
		});
		$('#faqBtn').click(function() {
			pageFAQ();
		});
		$('#tacBtn').click(function() {
			pageTAC();
		});

	});

	function pageCustmerCenter() {
		$('#customerImg').show();
		$('#method').hide();
		$('#subject').html('고객센터');
	}

	function pageMethod() {
		$('#method').show();
		$('#customerImg').hide();
		$('#subject').html('이용방법');
	}
	function pageQuestion() {
		$('#subject').html('문의사항');
		$('#qnaForm').show();
		$('#customerImg').hide();
		$('#method').hide();
		$('#faqForm').hide();
	}
	function pageFAQ() {
		$('#subject').html('FAQ');
		$('#faqForm').show();
		$('#customerImg').hide();
		$('#method').hide();
		$('#qnaForm').hide();
	}
	function pageTAC() {
		$('#subject').html('이용약관');
		$('#customerImg').hide();
		$('#method').hide();
		$('#content').append('<img alt="" src="imgs/tac.jpg">');
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../template/header.jsp"></jsp:include>
	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<br>
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Brand</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Link <span
									class="sr-only">(current)</span></a></li>
							<li><a href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Dropdown <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Dropdown <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
			<!-- 문의사항 -->
			<div id="qnaForm">
				<!-- Default form contact -->
				<form class="text-center border border-light p-5" action="#!">

					<p class="h4 mb-4">Contact us</p>

					<!-- Name -->
					<input type="text" id="defaultContactFormName"
						class="form-control mb-4" placeholder="Name">

					<!-- Email -->
					<input type="email" id="defaultContactFormEmail"
						class="form-control mb-4" placeholder="E-mail">

					<!-- Subject -->
					<label>Subject</label> <select
						class="browser-default custom-select mb-4">
						<option value="" disabled>Choose option</option>
						<option value="1" selected>Feedback</option>
						<option value="2">Report a bug</option>
						<option value="3">Feature request</option>
						<option value="4">Feature request</option>
					</select>

					<!-- Message -->
					<div class="form-group">
						<textarea class="form-control rounded-0"
							id="exampleFormControlTextarea2" rows="3" placeholder="Message"></textarea>
					</div>

					<p>문의하실 내용을 보내주세요. 빠른 시일내에 고객 서비스팀이 연락드리겠습니다.</p>

					<p>
						수집 항목 : 이메일 주소<br> 수집 목적 : 회원제 서비스 이용에 따른 본인 확인, 불만 처리, 오류 해결
						등 민원 처리 및 결과 회신<br> 보유 및 이용기간 : 수집된 이메일 주소는 관련 법령에 달리 명시되어 있지
						않는 한, 문의처리 후 1년간 보관<br> 그 밖에 사항은 개인정보 처리방침에 대하여 동의하셔야 합니다.<br>
						* 고객님은 동의를 거부하실 수 있으며, 거부 시 문의 등록을 하실 수 없습니다.
					</p>
					
					<!-- Copy -->
					<div class="custom-control custom-checkbox mb-4">
						<input type="checkbox" class="custom-control-input"
							id="defaultContactFormCopy"> <label
							class="custom-control-label" for="defaultContactFormCopy">개인정보 수집 이용에 대하여 동의합니다.</label>
					</div>




					<!-- Send button -->
					<button class="btn btn-info btn-block" type="submit">Send</button>

				</form>
				<!-- Default form contact -->
			</div>

			<!-- faqpage -->
			<div id="faqForm">
				<div class="jumbotron1">
					<h1 id="subject">Hello, world!</h1>
					<!-- 목록 -->
					<a href="#" class="green-text"> 숙소 </a>
					<!-- 제목 -->
					<h3>
						<strong>숙소 예약은 어떻게 하나요?</strong>
					</h3>
					<!-- 답변 -->
					<p>숙소 예약을 하려면 예약 페이지에 들어가서 해야 합니다. 플래너에서 예약하기 서비스는 추후에 추가될
						예정입니다.</p>
					<!-- 문의하기 -->
					<a class="btn btn-success btn-md">문의하기</a>
					<hr>
				</div>
				
			</div>
		</div>
	<img id="customerImg" alt="" src="imgs/b01.jpg"> <img
					id="method" alt="" src="imgs/method.png">
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>