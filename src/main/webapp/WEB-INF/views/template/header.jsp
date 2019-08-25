<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	function login(){
		var id = $('#id').val();
		var pw = $('#pw').val();
		var page = window.location.pathname;

		$.ajax({
			type:"post",
			url:"loginUser",
			data: "id="+id+"&pw="+pw,
			dataType:"text",
			success:function(data, textStatus, xhr){
				
				if(data=='logFail'){
					alert('로그인에 실패하셨습니다.');
				}else{
					window.location.href=page;
				}
				
			},

			error : function(request, status, error){
				console.log("code:"+request.status + "\n" + "error"+error);
			}
			
		})		
	}

	function logout(){
		var page = window.location.pathname;
		
		$.ajax({
			type:'post',
			url:'logoutUser',
			success:function(data){
				if(data=='logoutSuccess'){
					alert('정상적으로 로그아웃 되셨습니다');	
					window.location.href=page;
				}else{
					alert('로그아웃 실패');
				}
			},
			error : function(request, status, error){
				console.log("code:"+request.status + "\n" + "error"+error);
			}
		})
	}

	function join(){
		var id = $('#joinId').val();
		var pw = $('#joinPw').val();
		var name = $('#joinName').val();
		var nickName = $('#joinNickName').val();
		var tel = $('#joinTel').val();
		var birth = $('#joinBirth').val();
		var email = $('#joinEmail').val();
		var gender = $('.joinGender:checked').val();

		$.ajax({
			type:'post',
			url:'joinUser',
			data:"id="+id+"&pw="+pw+"&userName="+name+"&nickName="+nickName+"&tel="+tel+"&birth="+birth+"&email="+email+"&gender="+gender,
			datatype:"text",
			success:function(data){
					
			}
		})	
	}

	function passwordCheck(){
		$('#pwCheckResult').remove();
		var pw1 = $('#joinPw').val();
		var pw2 = $('#joinPwCheck').val();

		if(pw1!=pw2){
			$('#joinPwCheck').after('<label id="pwCheckResult" style="color: red">비밀번호가 다릅니다</label>');
		}
	}

	function idCheck(){

		$('#idCheckResult').remove();
		var idCheck = $('#joinId').val();
		
		$.ajax({
			type:'post',
			url:'idCheck',
			data:"id="+idCheck,
			datatype:"text",
			success:function(data){
				if(data=='fail'){
					$('#joinId').after('<label id="idCheckResult" style="color: red">아이디 중복!</label>');
					
				}else{
					$('#joinId').after('<label id="idCheckResult" style="color: blue">생성가능</label>');
				}
			}
		})
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
					<div class="modal-body">
					
					<!-- 카카오톡 로그인 -->
						<div class="form-group">
				   		
					   		<a id="kakao-login-btn"></a>
					   		<a href="http://developers.kakao.com/logout"></a>
					   		<script type='text/javascript'>
							  //<![CDATA[
							    // 사용할 앱의 JavaScript 키를 설정해 주세요.
							    Kakao.init('5f5f158f6a04f8c297bf6844e97ae3cf');
							    // 카카오 로그인 버튼을 생성합니다.
							    Kakao.Auth.createLoginButton({
							      container: '#kakao-login-btn',
							      success: function(authObj) {
							        // 로그인 성공시, API를 호출합니다.
							        Kakao.API.request({
							          url: 'oauth',
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
				
				<!--login footer -->
				<div class="modal-footer">
					<div class="col-sm-6 text-left">
						<a href="#" class="">아이디 찾기</a> <a href="#" class="">비밀번호 찾기</a>
					</div>
					<div class="col-sm-6 text-right">
						<button id="signT" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#signUp">회원가입</button>
						<button id="login" type="button" class="btn btn-default" onclick="login();" >로그인</button>
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
					<h4 class="modal-title" id="myModalLabel">회원가입</h4>
				</div>
				<!-- sign up content -->
				<form class="form-horizontal">
					<div class="modal-body">
					
					
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">ID</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="id" id="joinId"
									placeholder="Enter ID" onblur="idCheck();">
							</div>
						</div>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">PW</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="pw" id="joinPw"
									placeholder="Enter PassWord">
							</div>
						</div>
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">PW 확인</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" 
									id="joinPwCheck" placeholder="Check PassWord" onblur="passwordCheck();" />
							</div>
						</div>
					
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">이름</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name" id="joinName"
									placeholder="Enter Name">
							</div>
						</div>
						
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">닉네임</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="nickName" id="joinNickName"
									placeholder="닉네임을 입력하세요">
							</div>
						</div>
						
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">전화번호</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="tel" id="joinTel"
									placeholder="01012345678">
							</div>
						</div>
						
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">성별</label>
							<div class="col-sm-7">
								남
								<input type="radio" name="gender" class="joinGender" value="1">
								여
								<input type="radio" name="gender" class="joinGender" value="2">
							</div>
						</div>
						
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">생년월일</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="birth" id="joinBirth"
									placeholder="19990101-1">
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="sub" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-7">
								<input type="email" class="form-control" name="email" id="joinEmail"
									placeholder="example@naver.com">
							</div>
							<div class="col-sm-2">
								<button class="btn btn-default">메일인증</button>
							</div>
						</div>
					</div>
				</form>
				<!--sign up footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"">Cancle</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="join();">Submit</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 위에는 로그인 모달 -->
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
										<li><a href="<%=root%>/community" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-haspopup="true"
											aria-expanded="false">BOOKING <span class="caret"></span></a>
											<ul class="dropdown-menu">
												<li><a href="<%=root%>/booking">투어 정보</a></li>
												<li role="separator" class="divider"></li>
												<li><a href="<%=root%>/hotel">호텔 예약</a></li>
											</ul></li>
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
									<c:choose>
										<c:when test="${empty sessionScope.id }">
											<li><a id="login" class="edit" href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
										</c:when>
										<c:otherwise>
											<li><a>${sessionScope.id }</a></li>
											<li><a class="edit" onclick="logout();">로그아웃</a></li>
										</c:otherwise>
									</c:choose>
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