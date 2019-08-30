<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.css" />
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>


<script type="text/javascript">
	$('#assignForm').on('shown.bs.modal', function () {
		  $('#myInput').focus()
	});
	$(document).ready(function() {
		//글수정 삭제
		var list1='<c:forEach items="${replyList}" var="reply">';
		var list2='<input id="number" type="text" value="${reply.reply_id }">';
		var list3='</c:forEach>';
		
		$('.replyList').append('<p id="replyDeleteId" style="font-weight: bold;">${reply.reply_id }</p>').append('<p>${reply.reply_content}</p>')
		if($('#writerId').val()==$('#user').val()){
			//삭제
			$('#edBtn').append('<a href="delete/${bean.cmnt_seq }" class="btn btn-warning" style="float: right; margin-right: 10px;">Delete</a>');
			//수정
/* 			$('#edBtn').append('<button id="edit" class="btn btn-success" style="float: right; margin-right: 10px;">Edit</button>'); */
		}
	});

	$(document).on('click', '#incrute', function(e) {
		if (confirm("동행에 참가하시겠습니까?") == true) {
			$('#assignForm').modal('show')
		} else { //취소
			return false;
		}
	});
	//로그인 검사
	function checkForm(){
		var userId=$('#user').val();
		if(userId==''||userId==null){
				alert('로그인 해야 합니다');
				return false;
		}
		var content=$('#replyContent').val();
		if(content==''||content==null){
			alert('내용을 입력하세요');
			return false;
		}
	}
	
	//together assignment
	function assignment(){
		var assign_content = $('#assignContent').val();
		var assign_title = $('#assignTitle').val();
		var assign_id=$('#replyid').val();
		var cmnt_seq=$('#cmnt_seq').val();
		var page = window.location.pathname;
		cmnt_seq=parseInt(cmnt_seq);
		var check=$('input:checkbox[name="check"]').is(":checked");
		if(check==true&&assign_id!=null&&assign_id!=""){
			$.ajax({
				type : "get",
				url : "assignment",
				data : "assign_id=" + assign_id + "&assign_title=" + assign_title + "&assign_content=" + assign_content+"&cmnt_seq="+cmnt_seq,
				dataType : "text",
				success : function(data, textStatus, xhr) {
					if (data == 'assignFail') {
						alert('이미 신청 되었습니다...');
					} else {
						window.location.href = page;
					}
				},
			})
			
		}else if(check==false){
			//동의 할것
			alert('항목에 체크해 주세요');
			return false;
		}else if(assign_id==""){
			alert('로그인이 필요합니다');
		}		
		
	};
	
</script>
<style type="text/css">
span.date {
	font-size: 10px;
}

/* 1 */

/*css 초기화*/
.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 100%;
	border-radius: 4px 4px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

/*모집중  */
.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	position: absolute;
	margin-top: -100px;
	margin-left: 60%;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
	border-radius: 50%;
}

h1 {
	font-size: 22px;
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

/* 타이틀 해더 */
.card-body-header {
	margin: 10px 20px 0px 20px;
}

.card-body-hashtag {
	color: #2478FF;
	font-style: italic;
}

.card-body-footer {
	position: absolute;
	margin-top: 15px;
	margin-bottom: 6px;
	bottom: 0;
	width: 50%;
	font-size: 16px;
	color: #9FA5A8;
	padding: 0 15px;
}

.reg_date {
	float: right;
}

#cardImg {
	width: 80%;
	display: block;
	margin: 0px auto;
	margin-top: 50px;
	border-radius: 5px;
}

.article {
	margin: auto;
	margin-top: 10%;
	width: 50%;
	align-content: center;
}

.date {
	align-content: center;
	text-align: center;
	margin: auto;
}

.article h1 {
	margin-top: 50px;
}
/* card template */
.card {
	width: 200px;
	min-height: 200px;
	background: #ffff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 10px;
	transition: 0.5s;
	margin-top: 70px;
}

.card:hover {
	box-shadow: 0 30px 70px rgba(0, 0, 0, .2);
}

.card .box {
	top: 50%;
	left: 0;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	width: 100%;
}

.card .box .img {
	width: 100px;
	height: 100px;
	margin: 0 auto;
	margin-top: -80px;
	border-radius: 50%;
	overflow: hidden;
}

.card .box .img img {
	width: 100%;
	height: 100%;
}

.card .box h2 {
	font-size: 20px;
	color: #262626;
	margin: 20px auto;
}

.card .box h2 span {
	font-size: 14px;
	background: #e91e63;
	color: #fff;
	display: inline-block;
	padding: 4px 10px;
	border-radius: 15px;
}

.card .box p {
	color: #262626;
}

.card .box span {
	display: inline-flex;
}

.card .box ul {
	margin: 0;
	padding: 0;
}

.card .box ul li {
	list-style: none;
	float: left;
}

.card .box ul li a {
	display: block;
	color: #aaa;
	margin: 0 10px;
	font-size: 20px;
	transition: 0.5s;
	text-align: center;
}

.card .box ul li:hover a {
	color: #e91e63;
	transform: rotateY(360deg);
}
/* 2 */
.card2 {
	width: 150px;
	min-height: 100px;
	background: #ffff;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 10px;
	transition: 0.5s;
	margin-top: 70px;
}

.card2:hover {
	box-shadow: 0 30px 70px rgba(0, 0, 0, .2);
}

.card2 .box2 {
	top: 50%;
	left: 0;
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	width: 100%;
}

.card2 .box2 .img2 {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	margin-top: -60px;
	border-radius: 50%;
	overflow: hidden;
}

.card2 .box2 .img2 img {
	width: 100%;
	height: 100%;
}

.card2 .box2 h2 {
	margin-top: 10px;
	font-size: 15px;
	color: #262626;
}

.card2 .box2 h2 span {
	font-size: 10px;
	background: #e91e63;
	color: #fff;
	display: inline-block;
	padding: 4px 10px;
	border-radius: 15px;
}

.card2 .box2 p {
	font-size: 10px;
	color: #262626;
}

.card2 .box2 span {
	display: inline-flex;
}

.card2 .box2 ul {
	margin: 0;
	padding: 0;
}

.card2 .box2 ul li {
	list-style: none;
	float: left;
}

.card2 .box2 ul li a {
	display: block;
	color: #aaa;
	margin: 0 10px;
	font-size: 20px;
	transition: 0.5s;
	text-align: center;
}

.card2 .box2 ul li:hover a {
	color: #e91e63;
	transform: rotateY(360deg);
}
/*2  */
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 투게더 신청서 양식 -->

<!-- Modal -->
<div class="modal fade" id="assignForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Assignment Form</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
        
         <div class="form-group">
		    <label for="exampleInputEmail1">Title</label>
		    <input type="email" id="assignTitle" name="assignTitle" class="form-control" placeholder="제목을 적어 주세요">
		    <input type="hidden" id="replyid" name="replyid" value="${sessionScope.id }">
		    <input type="hidden" id="cmnt_seq" name="cmnt_seq" value="${bean.cmnt_seq }">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Content</label>
		    <textarea class="form-control" name="assignContent" id="assignContent" placeholder="여행성향을 적어 주세요"></textarea>
		  </div>
		  <div class="checkbox">
		    <label>
		      <input id="check" name="check" type="checkbox" value="0"> Check me out
		    </label>
		  </div>
        
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="assignment();">Assignment</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	<jsp:include page="../template/header.jsp"></jsp:include>
	<br>
	<!-- 하단 nav -->
	<div class="container">

		<div class="page-header">
			<h1>
				Community Center <small>Together</small>
			</h1>
		</div>

		<%
			String root = request.getContextPath();
			String id=request.getParameter("cmnt_writer_id");
		%>
		<ul class="nav nav-pills nav-justified">
			<li role="presentation"><a href="<%=root%>/community_planner">플래너</a></li>
			<li role="presentation"><a href="<%=root%>/community_bbs">자유게시판</a></li>
			<li role="presentation" class="active"><a
				href="<%=root%>/community_together">투게더</a></li>
			<li role="presentation"><a href="<%=root%>/community">여행후기</a></li>
			<li role="presentation"><a href="<%=root%>/community_question">질문</a></li>
		</ul>
	</div>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="row" style="width: 80%; margin: 0px auto;">
				<br>
				<!-- 수정 삭제 btn -->
				<div id="edBtn">
					<input type="hidden" id="writerId" value="${bean.cmnt_writer_id }">
					<input type="hidden" id="user" value="${sessionScope.id }">
				</div>
				<!-- 동행 본문 -->
				<div class="article">
					<p class="date">Thursday,July 16, 2015</p>
					<h1 class="date">${bean.cmnt_title }</h1>
					<p class="date" style="margin-top: 50px; line-height: 30px;">${bean.cmnt_content}</p>
				</div>
				<!-- 동행 본문 -->
				<!-- 모집중 -->
				<div class="card-header">
					<div id="incrute" class="card-header-is_closed">
						<div class="card-header-text">모집중</div>
						<div class="card-header-number">${bean.recru_per} /${bean.total_per}</div>
					</div>
				</div>
				<!--  카드 바디 -->
				<br>
				<div class="card-body">
					<!--  카드 바디 헤더 -->
					<div class="card-body-header">
						<img id="cardImg" alt=""
							src="<%=root %>/upload/${bean.cmnt_filename}">
					</div>
				</div>
				<br>
				<!-- 참가중인 사람 리스트 -->

				<div class="card-body">
					<hr style="color: red; width: 100%;">
					<h1>Who's Coming With Me?</h1>
					<div class="col-sm-3">
						<!-- 글쓴이 -->
						<div class="card">
							<div class="box">
								<div class="img">
									<img src="<%=root%>/imgs/a1.jpg">
								</div>
								<h2>${bean.cmnt_writer_id }<br>
									<!-- 등급 -->
									<span>Trip Designer</span>
								</h2>
								<p>안녕 날 소개하지 이름은 lian 직업은 traveler 취미는
									taichi,meditation,독서,영화시청</p>
								<span>
									<ul>
										<li><a href="#"><i class="fa fa-facebook"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-twitter"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-google-plus"
												aria-hidden="true"></i></a></li>
										<li><a href="#"><i class="fa fa-instagram"
												aria-hidden="true"></i></a></li>
									</ul>
								</span>
							</div>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="row">
							<%
								for (int i = 0; i < 6; i++) {
							%>
							<div class="col-sm-3">
								<div class="card2">
									<div class="box2">
										<div class="img2">
											<img src="<%=root%>/imgs/a<%=i + 1%>.jpg">
										</div>
										<h2>
											Lim-Do Young<br>
											<!-- 등급 -->
											<span>Trip Designer</span>
										</h2>
										<p>안녕 날 소개하지 이름은 lian 직업은 traveler 취미는
											taichi,meditation,독서,영화시청</p>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<br> <a id="incrute" class="btn btn-primary"
						style="margin-left: 85%;">Come Together</a>
				</div>
				<!-- 댓글-->
				<div class="card-body">
					<div class="form-group">
						<hr style="color: red; width: 100%;">
						<h2>Are you curious?</h2>
						<input type="hidden" id="seq" name="seq" value="${bean.cmnt_seq }">
						<form action="reply" method="get" onsubmit="return checkForm();">
							<div class="col-sm-11">
								<input type="text" name="reply_content" id="replyContent" class="form-control">
								<input type="hidden" name="cmnt_seq" value="${bean.cmnt_seq }">
								<input type="hidden" name="reply_id" value="${sessionScope.id }">
							</div>
							<div class="col-sm-1">
								<button id="replyAdd" class="btn btn-default" style="float: right;">Reply</button>
							</div>
						</form>
						<hr>
						<br>
						<div class="replyList">
							<c:forEach items="${replyList}" var="reply">
 								<p id="replyDeleteId" style="font-weight: bold;">${reply.reply_id }</p>
								<c:set var="te2" value="${reply.reply_id }" />
								<c:set var="te1" value="${sessionScope.id }" />
									<c:if test="${te1 eq te2}">
									   <a href="replyDelete?reply_seq=${reply.reply_seq }&cmnt_seq=${reply.cmnt_seq}" class="btn btn-primary btn-sm" style="float: right;">삭제</a>
									</c:if>
								<p>${reply.reply_content}</p>
								<c:set var="dateForm" value="${bean.modi_date }" />
									<c:if test="${teq eq null }">
								</c:if>
								<c:if test="${not teq eq null }">
									<p style="font-size:12px; float: right; margin-top: -60px;">${fn:substring(dateForm,0,10) }
								</c:if>
								<hr>
							</c:forEach>
						</div>


						<br><br>
						<hr style="color: red; width: 100%;">
					</div>
				</div>
			</div>
			<!-- container 끝 -->
		</div>
		<!-- 여기까지 컨텐츠입니다 -->
		<br>

		<!-- footer -->
		<div class="jumbotron2">
			<%@ include file="../template/footer.jsp"%>
		</div>
</body>
</html>