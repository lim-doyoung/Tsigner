<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../template/header.jsp"></jsp:include>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/summernote.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

<!-- ekeditor -->
<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>

<script type="text/javascript" src="js/summernote.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>



<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>





<script type="text/javascript">
	$(document).ready(function() {
		//editor
		/* 		CKEDITOR.replace( 'cmnt_content' ); */
		$(document).ready(function() {
			$('#summernote').summernote({
				 height: 300
			});
		});
		//시작 페이지 실행
		pageList();

		var checkid = $('#checkid').val();
		//login check
		$('#submitbtn').click(function() {
			if (checkid == null || checkid == "") {
				alert('로그인이 필요합니다');
			} else {
				$('.togetherInsert').show();
				$('.togetherList').hide();
			}
			;
		});
		//hash tag 출력
		$('#plusHashTag').click(function(e) {
			e.preventDefault();
			hashTag();
		});

	});
	//투게더 insert
	function pageInsert() {
		$('.togetherInsert').show();
		$('.togetherList').hide();
	};
	//list 출력
	function pageList() {
		$('.togetherList').show();
		$('.togetherInsert').hide();
	};
	//hashtag 출력
	$(document).on('click','#plusHashTag',function(e) {
						if ($('.plusHash div').length < 3) {
							$('.plusHash').append(
											'<div class="col-sm-2"><input type="text" class="form-control" name="hash_tag" style="float: left;"></div>');
						} else {
							alert('3개 까지만 가능합니다.');
						}
					});
	//동의사항
/* 	$(document).on('click', '#agree', function(e) {
		if (confirm("동의하시겠습니까?") == true) {
			location.href = "redirect:/";
		} else { //취소
			alert('동의 하셔야 등록하실 수 있습니다.');
		}
	}); */
	//동의 체크
	function checkForm(){
		var check=$('input:checkbox[name="check"]').is(":checked");
		if(check==false){
			alert('동의에 체크해 주세요');
			return false;
		}
	}

	
	
</script>
<style type="text/css">
span.date {
	font-size: 10px;
}

/* 1 */

/*css 초기화*/
.card {
	height: 320px;
	width: 100%;
	border-radius: 5px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
	-moz-transition: 0.5s; /*파이어폭스*/
	-ms-transition: 0.5s; /*인터넷 익스플로러*/
	-o-transition: 0.5s; /*오페라*/
	transition: 0.5s;
	width: 100%;
	height: 200px;
	border-radius: 4px 4px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;
}

.card:hover .card-header {
	opacity: 0.8;
	height: 100px;
}

/*모집중  */
.card-header-is_closed {
	background-color: #EF5A31;
	color: #FFF;
	font-weight: bold;
	text-align: center;
	float: right;
	margin: 15px 15px 0 0;
	border-radius: 50%;
	font-weight: bold;
	padding: 10px 10px;
	line-height: 20px;
}

h1 {
	font-size: 22px;
	font-weight: bold;
}

/* 타이틀 해더 */
.card-body-header {
	margin: 10px 20px 0px 20px;
}

.card-body-description {
	opacity: 0;
	color: #757B82;
	line-height: 25px;
	-webkit-transition: .2s ease-in-out; /*사파리&크롬*/
	-moz-transition: .2s ease-in-out; /*파이어폭스*/
	-ms-transition: .2s ease-in-out; /*익스플로러*/
	-o-transition: .2s ease-in-out; /*오페라*/
	transition: .2s ease-in-out;
	overflow: hidden;
	height: 180px;
	margin: 5px 20px;
	/* ...처리하기 */
	white-stext-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2; /* 라인수 */
	-webkit-box-orient: vertical;
	word-wrap: break-word;
	line-height: 1.2em;
	height: 2.4em;
	00
	px; /* 위에서부터 보여주는 높이 */
}

.card:hover .card-body-description {
	opacity: 1;
	-webkit-transition: .5s ease-in-out;
	-moz-transition: .5s ease-in-out;
	-ms-transition: .5s ease-in-out;
	-o-transition: .5s ease-in-out;
	transition: .5s ease-in-out;
	overflow: scroll;
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
	width: 314px;
	font-size: 14px;
	color: #9FA5A8;
	padding: 0 15px;
}

.reg_date {
	float: right;
}

#hashbtn {
	border-radius: 30px;
}

#submitbtn {
	display: inline-block;
	margin-top: 110p;
	float: right;
}

.hashtag {
	text-align: center;
}

.togetherInsert {
	width: 60%;
	margin: auto;
}

#bgImg {
	width: 100%;
	opacity: 0.5;
	height: 100px;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
			<li role="presentation" class="active"><a
				href="community_together">투게더</a></li>
			<li role="presentation"><a href="community">여행후기</a></li>
			<li role="presentation"><a href="community_question">질문</a></li>
		</ul>
	</div>

	<!-- session id check -->
	<input type="hidden" id="checkid" name="checkid"
		value="${sessionScope.id }">

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="row">
				<br>
				<div class="hashtag">
					<button id="hashbtn" type="button" class="btn btn-default btn-sm"
						value="Title1">#여행</button>
					<button id="hashbtn" type="button" class="btn btn-default btn-sm"
						value="tester1">#제주</button>
					<button id="hashbtn" type="button" class="btn btn-default btn-sm"
						value="Title3">#서울</button>
				</div>
				<button id="submitbtn" class="btn btn-default btn-sm">글쓰기</button>
				<br>
				<!-- best 등급 의 동행 리스트 -->
				<div class="togetherList">
					<h3 style="font-weight: bold;">마감 임박</h3>
					<hr>
					
					<hr>
					<div style="text-align: center; align-content: center; margin: 0px,auto;">
					<c:forEach items="${togetherAlist}" var="bean">
						<div class="col-md-3">
							<!-- 클릭 시 링크 설정 -->
							<a href="community_togetherDetail/${bean.cmnt_seq}">
								<div class="card">
									<!-- 카드 헤더 -->
									<div class="card-header"
										style="background-image: url('upload/${bean.cmnt_filename}');">

										<div class="card-header-is_closed">
											<div class="card-header-text">모집중</div>
											<div class="card-header-number">${bean.recru_per}/
												${bean.total_per}</div>
										</div>
									</div>
									<!--  카드 바디 -->
									<div class="card-body">
										<!--  카드 바디 헤더 -->
										<div class="card-body-header">
											<!-- title 글자수 조정-->
											<h4>${bean.cmnt_title }</h4>
											<c:set var="tel" value="${bean.hash_tag }" />
											<c:forEach var="telNum" items="${tel}" varStatus=",">
												<span class="card-body-hashtag"># ${telNum } &nbsp;</span>
											</c:forEach>
											<br>
											<p class="card-body-nickname">작성자: ${bean.cmnt_writer_id }</p>
										</div>
										<p class="card-body-description" style="overflow: hidden;">${bean.cmnt_content }</p>
										<!--  카드 바디 본문 -->
										<!--  카드 바디 푸터 -->
										<div class="card-body-footer">
											<table border="0" style="width: 85%;">
												<tr>

													<c:set var="dateForm" value="${bean.modi_date }" />
													<%-- 															<span>${fn:substring(dateForm,5,7) },</span>
															<span>${fn:substring(dateForm,8,10) },</span>
															<span>${fn:substring(dateForm,0,4) }</span> --%>
													<td style="text-align: left;"><span class="date">${fn:substring(dateForm,0,10) }</span></td>
													<td style="text-align: right;"><span class="date">조회
															${bean.cmnt_hits } </span></td>
													<td style="text-align: right;"><span class="date">댓글
															${bean.reqly_total } 개</span></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				</div>
				<!-- 리스트 끝 -->
				<div class="togetherInsert">
					<h1 style="font-size: 25px; font-weight: bold; text-align: center;">Together</h1>
<!-- 					<img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br> -->
<!-- 					<p style="text-align: center;">T signer</p>
					<p style="text-align: center;">여행 숙박 공연 정보를 공유 하고</p>
					<p style="text-align: center;">함께 여행하자</p> -->
					<form action="community_together/add" method="post"
						enctype="multipart/form-data" style="margin-top: 50px;" onsubmit="return checkForm();" >
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="title">Title</label> <input type="text"
										class="form-control" placeholder="write title"
										name="cmnt_title">
								</div>
							</div>
							<input type="hidden" class="form-control"
								placeholder="write name" name="cmnt_writer_id"
								value="${sessionScope.id }" readonly="readonly">
							<!-- 							<div class="form-group">
								<div class="row">
								<div class="col-sm-1"><label for="name">Name</label></div>
								<div class="col-sm-11"> 
								</div>
								</div> 
							</div>-->
							<div class="col-sm-2">
								<div class="form-group">
									<label for="title">Total Member</label> <select
										class="form-control" name="total_per"></br>
										<%
											for (int i = 2; i <= 8; i++) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
											}
										%>
									</select>
								</div>
							</div>
							<div class="col-sm-10">
								<label for="title">Together Date</label> <input type="date"
									class="form-control" placeholder="write title"
									name="together_date">
							</div>
						</div>
						<div class="form-group">
							<textarea id="summernote" name="cmnt_content" class="summernote"
								rows="" cols="" style="height: 500px;">
								
							</textarea>
						</div>
						<div class="row">
						<div class="col-sm-12">
							<label for="title">HashTag</label>
							<div class="plusHash">
								<div id="hashtagForm" class="col-sm-2">
									<input type="text" class="form-control" name="hash_tag"
										style="float: left;">
								</div>
							</div>
							<button id="plusHashTag" class="btn btn-default btn-xs"
								style="float: left;">+</button>
						</div>
						</div>



						<div class="form-group">
							<label for="title">메인 화면 사진선택</label> <input
								type="file" id="exampleInputFile" name="file2">
						</div>
						<div class="checkbox">
						    <label>
						      <input id="check" name="check" type="checkbox" value="0"> Check me out
						    </label>
						  </div>
						<button type="submit" class="btn btn-default"
							style="float: right;">Submit</button>
					</form>
				</div>
				<div class="jumbotron1"></div>
				<!-- together insert 끝 -->
			</div>
			<!-- paging -->
			<div id="pageNum" style="text-align: center;">
				<ul class="pagination" style="text-align: center;">
					<li><a>&laquo;</a></li>
					<li class="goPage" data-page="1"><a>1</a></li>
					<li class="goPage" data-page="2"><a>2</a></li>
					<li class="goPage" data-page="3"><a>3</a></li>
					<li><a>&raquo;</a></li>
				</ul>
			</div>
		</div>
	</div>



	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
		<%@ include file="../template/footer.jsp"%>
	</div>


</body>
</html>