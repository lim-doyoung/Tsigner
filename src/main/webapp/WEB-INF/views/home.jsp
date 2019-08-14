<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<link rel="stylesheet" type="text/css" href="css/tsigner.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">


<!-- kakaotalk library -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="http://vjs.zencdn.net/5.4.4/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/5.4.4/video.js"></script>

<!-- 회원가입 / 로그인 모달 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#signT').click(function() {
			$('#myModal').modal("hide");
		});
	});

	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').focus();
	})

	$('#signUp').on('shown.bs.modal', function() {
		$('#myInput').focus();
	})
</script>
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

.hr1 {
	height: 4px;
}

#hrText {
	line-height: 50px;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}

#btn-detail {
	margin-left: 18%;
	margin-right: 60%;
}

</style>
<title>T singer</title>
</head>
<body>

	<!--Login Modal 111111111111111111111111-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Login</h4>
				</div>
				<!--login content -->
				<form class="form-horizontal">
					<div class="modal-body">
					
					<!-- 카카오톡 로그인 -->
						<div class="form-group">
				   		
					   		<a id="kakao-login-btn"></a>
					   		<a href="http://developers.kakao.com/logout"></a>
					   		<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('5a7696cd70ea487363a3ddebcb028ae1');
							    // 카카오 로그인 버튼을 생성합니다.
							    Kakao.Auth.createLoginButton({
							      container: '#kakao-login-btn',
							      success: function(authObj) {
							        // 로그인 성공시, API를 호출합니다.
							        Kakao.API.request({
							          url: '/v2/user/me',
							          success: function(res) {
							            console.log(JSON.stringify(res));
							          },
							          fail: function(error) {
							            alert(JSON.stringify(error));
							          }
							        });
							      },
							      fail: function(err) {
							        alert(JSON.stringify(err));
							      }
							    });
							  //]]>
	
							    function kout(){
							    	alert("script");
							    	Kakao.Auth.logout(function(data){
							                alert(data);
							            });
							    }
							</script>
					   		<a href = "https://kauth.kakao.com/oauth/authorize?client_id=cf59d8cf164537ca58f158a8dcd3c7f4&redirect_uri=http://192.168.1.8:8080/tsigner/oauth&response_type=code">
						        로그인
						    </a>
					  </div>
					
						<!-- 페이스북 -->
						<div class="form-group">
							<div id="fb-root"></div>
							<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v4.0&appId=417177695583034&autoLogAppEvents=1"></script>
							<div class="fb-login-button" data-width="" data-size="large" data-button-type="continue_with" data-auto-logout-link="false" data-use-continue-as="false"></div>
							<script>
							  window.fbAsyncInit = function() {
							    FB.init({
							      appId      : '{your-app-id}',
							      cookie     : true,
							      xfbml      : true,
							      version    : '{api-version}'
							    });
							      
							    FB.AppEvents.logPageView();   
							      
							  };
							
							  (function(d, s, id){
							     var js, fjs = d.getElementsByTagName(s)[0];
							     if (d.getElementById(id)) {return;}
							     js = d.createElement(s); js.id = id;
							     js.src = "https://connect.facebook.net/en_US/sdk.js";
							     fjs.parentNode.insertBefore(js, fjs);
							   }(document, 'script', 'facebook-jssdk'));
							</script>
							
						</div>
					
						<div class="form-group">
							<c:choose>
								<c:when test="${sessionId != null}">
								</c:when>
									<c:otherwise>
										<!-- 네이버 로그인 창으로 이동 -->
										<div id="naver_id_login" style="text-align:center"><a href="${url}">
											<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
									</c:otherwise>
								</c:choose>

						</div>
					
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">ID</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="id" id="id"
									placeholder="Enter ID">
							</div>
						</div>
						<label></label>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">PW</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" name="pw" id="pw"
									placeholder="Enter PassWord">
							</div>
						</div>
						<label></label>
					</div>
				</form>
				<!--login footer -->
				<div class="modal-footer">
					<div class="col-sm-6 text-left">
						<a href="#" class="">아이디 찾기</a> <a href="#" class="">비밀번호 찾기</a>
					</div>
					<div class="col-sm-6 text-right">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="Login();">Sign In</button>
						<button id="signT" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#signUp">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--Sign UP Modal 22222222222222222222222222-->
	<div class="modal fade" id="signUp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Sign Up</h4>
				</div>
				<!-- sign up content -->
				<form class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name" id="name"
									placeholder="Enter Name">
							</div>
						</div>
						<label></label>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">ID</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="id" id="id"
									placeholder="Enter ID">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default">ID확인</button>
							</div>
						</div>
						<label></label>

						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">PW</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="pw" id="pw"
									placeholder="Enter PassWord">
							</div>
						</div>
						<label></label>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">PW 확인</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="pwck"
									id="pwck" placeholder="Check PassWord">
							</div>
						</div>
						<label></label>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-7">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="example@naver.com">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default">메일인증</button>
							</div>
						</div>
						<label></label>
					</div>
				</form>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"">Cancle</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="signUp();">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<div id="videobg" weight="100%">
		<video id="video" class="video-js vjs-default-skin"
			controls="controls" preload="auto" autoplay="autoplay" loop="loop"
			muted="muted" data-setup='{"fluid": true}'>
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
							<a id="fontTitle" class="navbar-brand edit" href="<%=root%>">T
								signer</a>
						</div>

						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a class="edit" href="<%=root%>/notice">NOTICE</a></li>
								<li><a class="edit" href="<%=root%>/planner">PLANER</a></li>
								<li><a class="edit" href="<%=root%>/booking">BOOKING</a></li>
								<li><a class="edit" href="<%=root%>/community">COMMUNITY</a></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li><a id="login" class="edit" href="#" data-toggle="modal"
									data-target="#myModal">로그인</a></li>
								<li><a id="join" class="edit" href="#" data-toggle="modal"
									data-target="#myModal">로그인</a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>

			</div>
		</div>
		<div id="box"></div>

		<!--추천 container -->
		<div class="container">
			<div class="jumbotron1">
				<h1 align="center">Hello, world!</h1>
				<p align="center">Seattle is an exciting urban city surrounded
					by unmatched natural beauty. Adventure awaits you.</p>
				<br>
				<div class="row">
					<div class="col-md-8">
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
									<img src="imgs/a1.jpg" alt="...">
								</div>
								<div class="item">
									<img src="imgs/a2.jpg" alt="...">
								</div>
								<div class="item">
									<img src="imgs/a3.jpg" alt="...">
								</div>
							</div>
							<b>hello java</b> "you can see the landScape"
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
									<img src="imgs/a1.jpg" alt="...">
								</div>
								<div class="item">
									<img src="imgs/a2.jpg" alt="...">
								</div>
								<div class="item">
									<img src="imgs/a3.jpg" alt="...">
								</div>
							</div>

						</div>
						<b>hello java</b> "you can see the landScape"
					</div>
					<div class="col-md-4">
						<div id="carousel-example-generic3" class="carousel slide"
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
									<a href="#" class="thumbnail"><img src="imgs/a1.jpg"
										alt="..."></a>
								</div>
								<div class="item">
									<a href="#" class="thumbnail"><img src="imgs/a2.jpg"
										alt="..."></a>
								</div>
								<div class="item">
									<a href="#" class="thumbnail"><img src="imgs/a3.jpg"
										alt="..."></a>
								</div>
							</div>
							<b>hello java</b> "you can see the landScape"
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 추천 container end -->

		<!-- extra container -->
		<div class="container">
			<div class="jumbotron1">
				<div class="row">
					<h3>Another Plan!</h3>
					<br> <br>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail1"> <img src="imgs/b1.jpg"
							alt="..."></a>
						<h4>Food</h4>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail1"> <img src="imgs/b2.jpg"
							alt="..."></a>
						<h4>Transportation</h4>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail1"> <img src="imgs/b3.jpg"
							alt="..."></a>
						<h4>Hotels</h4>
					</div>
					<div class="col-xs-6 col-md-3">

						<a href="#" class="thumbnail1"> <img src="imgs/b4.jpg"
							alt="..."></a>
						<h4>Festival</h4>
					</div>
				</div>
				<br> <br> <br>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h2 align="center">Variety of Plans</h2>
						<p align="center">Find a variety of lodgings, festivals, and
							food.</p>
						<button id="btn-detail"
							class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
							data-text="details →">
							<span>details →</span>
						</button>
					</div>
					<div class="col-md-4"></div>
				</div>

			</div>
		</div>

		<!-- 할것 container -->
		<div class="container">
			<div class="jumbotron1">
				<!-- 축제 수평선 -->
				<div class="row">
					<div class="row">
						<div class="col-md-5">
							<hr color="darkgray" class="hr1">
						</div>
						<div class="col-md-2">
							<p id="hrText">Upcoming Spotlight</p>
						</div>
						<div class="col-md-5">
							<hr color="darkgray" class="hr1">
						</div>
					</div>
				</div>
				<h3>Thing to Do</h3>
				<h1></h1>
				<div class="row">
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a4.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a5.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a6.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<a href="#" class="thumbnail"> <img src="imgs/a7.jpg"
							alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-primary" role="button">Button</a> <a
									href="#" class="btn btn-default" role="button">Button</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 할것 container end -->
	</div>

	<div class="jumbotron2">
		<%@ include file="template/footer.jsp"%>
		
	</div>

</body>
</html>