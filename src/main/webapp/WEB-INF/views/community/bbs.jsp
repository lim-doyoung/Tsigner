<%@page import="org.springframework.web.bind.annotation.RequestParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<!-- font -->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link rel="stylesheet" type="text/css" href="css/buttons.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var addr = document.getElementById('downFile').value;
						pageList();
						$('#submitbtn').click(function() {
							$('.bbsInsert').show();
							$('.bbsDetail').hide();
							$('#bbsTable').hide();
						});
						$('#editBtn').hide();

						$('#keyword')
								.keyup(
										function() {
											var k = $(this).val();
											if(k!=null){
											$("#communityBbsTable > tbody > tr")
													.hide();
											}
											var temp = $("#communityBbsTable > tbody > tr > td:nth-child(5n+2):contains('"
													+ k + "')");
											$(temp).parent().show();
										});
					});

	function pageList() {
		$('#bbsTable').show();
		$('.bbsInsert').hide();
		$('.bbsDetail').hide();
	};

	function pageInsert() {
		$('.bbsInsert').show();
		$('#bbsTable').hide();
		$('.bbsDetail').hide();
	};
	function pageDetail() {
		$('.bbsDetail').show();
		$('#bbsTable').hide();
		$('.bbsInsert').hide();
	};

	function editOne() {
		$('.bbsDetail h1').text('Edit');
		$('#edit').hide();
		$('#editBtn').show();
		$('.form-control').removeAttr('readonly');
		$('#upload').append('<label for="exampleInputFile">File input</label>');
		$('#upload').append('<input type="file" id="exampleInputFile">');
		$('#upload')
				.append(
						'<p class="help-block">Example block-level help text here.</p>');
	}

	//상세&수정&삭제
	$(document).on('click', '#bbsTable table tr td>a', function(e) {
		e.preventDefault();
		$('.bbsDetail').show();
		$('#bbsTable').hide();
		$.getJSON('json/obj', $(this).attr('href'), function(data) {
			$('.bbsDetail form input').eq(0).val(data.cmnt_title);
			$('.bbsDetail form input').eq(1).val(data.cmnt_writer_id);
			$('.bbsDetail form textarea').val(data.cmnt_content);
			$('#downFile').val(data.cmnt_filename);
			$('#keyVal').val(data.cmnt_seq);
			console.log(data.cmnt_filename);
			$('#detailPage').append('<a href="upload/'+data.cmnt_filename+'" id="del" type="button" class="btn btn-default" download>download</a>');
		});
	});

	function deleteOne() {
		location.href = 'community_bbs/delete/'
				+ document.getElementById('keyVal').value;
	};

	function download() {
		location.href = 'community_bbs/download/'
			+ document.getElementById('downFile').value;
/* 		var addr = document.getElementById('downFile').value; */
/* 		$('#upload').append('<a href="upload/'+addr+'" download>'+addr+'</a>'); */
	};
</script>

<style type="text/css">
.hashtag {
	text-align: center;
}

#hashbtn {
	border-radius: 30px;
}

#submitbtn {
	text-align: right;
	margin-left: 80%;
}

.bbsInsert {
	width: 60%;
	margin: auto;
}

.bbsDetail {
	width: 60%;
	margin: auto;
}

#bgImg {
	width: 100%;
	opacity: 0.5;
	height: 100px;
}

#bottomBtn {
	text-align: right;
}

#div1 {
	width: 300px;
	height: 200px;
	border: 1px solid #ccc;
}

#btn-detail {
	border-radius: 30px;
	height: 30px;
	width: 100px;
	line-height: 5px;
	margin-left: 80%;
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
				Community Center <small>자유게시판</small>
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" id="keyword" class="form-control"
							placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
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
				<div class="jumbotron1">
					<div id="bbsTable">
						<table id="communityBbsTable" class="table table-hover"
							style="width: 80%; margin: auto;">
							<thead>
							<tr>
								<td width="5%">#</td>
								<td align="left">제목</td>
								<td width="10%">작성자</td>
								<td width="10%">작성일</td>
								<td width="10%">조회수</td>
							</tr>
							</thead>
							<tbody>
								<c:forEach items="${alist }" var="bean">
									<tr>
										<td><a href="idx=${bean.cmnt_seq }">${bean.cmnt_seq }</a></td>
										<td><a href="idx=${bean.cmnt_seq }">${bean.cmnt_title }</a></td>
										<td>${bean.cmnt_writer_id }</td>
										<!-- 문자열 자르기 -->
										<c:set var="TextValue" value="${bean.modi_date }" />
										<td>${fn:substring(TextValue,0,10) }</td>
										<td>${bean.cmnt_hits }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div id="pageNum" style="text-align: center;">
							<nav>
								<ul class="pagination">

									<li><a href="bookingRoom?idx=" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
									</a></li>
									<%
										for (int i = 0; i < 5; i++) {
									%>
									<li><a href="bookingRoom?idx=<%=i + 1%>"><%=i + 1%></a></li>
									<%
										}
									%>
									<li><a href="bookingRoom?idx=" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
						<a href="imgs/a1.jpg" download>download</a>
					</div>

					<!-- insert form -->
					<div class="bbsInsert">
						<h1>Insert</h1>
						<img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br>
						<form action="community_bbs/add" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="title">Title</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									placeholder="write title" name="cmnt_title">
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									placeholder="write name" name="cmnt_writer_id">
							</div>
							<div class="form-group">
								<label for="content">Content</label>
								<textarea class="form-control" rows="3"
									placeholder="write content" name="cmnt_content"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">File input</label> <input
									type="file" id="exampleInputFile" name="file2">
								<p class="help-block">Example block-level help text here.</p>
							</div>
							<div class="checkbox">
								<label> <input type="checkbox"> Check me out
								</label>
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
					</div>
					<!-- detail -->
					<div class="bbsDetail">
						<h1>Detail</h1>
						<img id="bgImg" alt="" src="imgs/write.jpg"> <br> <br>
						<form action="community_bbs/update" method="post" id="detailPage"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="title">Title</label> <input type="text"
									class="form-control" id="exampleInputEmail1" name="cmnt_title"
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									name="cmnt_writer_id" readonly="readonly">
							</div>
							<div class="form-group" contentEditable="true">
								<label for="content">Content</label>
								<textarea class="form-control" rows="3" name="cmnt_content"
									readonly="readonly"><div contentEditable="true"></textarea>
							</div>
							<div id="upload" class="form-group"></div>

							<input type="hidden" id="keyVal" name="cmnt_seq" /> <input
								type="text" id="downFile" name="file2" />
							<button id="btn-detail"
								class="button button--rayen button--border-thin button--text-thick button--text-upper button--size-s"
								data-text="DownLoad" onclick="download()">
								<span>DownLoad</span>
							</button>
							<br> <br>
							<div id="bottomBtn">
								<button id="editBtn" type="submit" class="btn btn-default">Edit1</button>
								<a id="edit" type="button" class="btn btn-default"
									onclick="editOne()">Edit2 </a> <a id="del" type="button"
									class="btn btn-default" onclick="deleteOne()">Delete </a>
							</div>
						</form>

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