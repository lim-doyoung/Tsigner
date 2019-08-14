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
	$(document).ready(function() {
		pageMethod();
		
		$('#customercenterBtn').click(function() {
			pageCustmerCenter();
		});
		$('#methodBtn').click(function() {
			pageMethod();
		});
		
	});

	function pageCustmerCenter() {
		$('#customerImg').show();
		$('#method').hide();
		$('#subject').html('고객센터');
	}

	function pageMethod(){
		$('#method').show();
		$('#customerImg').hide();
		$('#subject').html('이용방법');
		}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>
	<button id="customercenterBtn">customer center</button>
	<button id="methodBtn">이용방법</button>
	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<!-- 컨텐츠의 내용을 입력하세요 -->
					<div class="col-md-offset-2 col-md-8">
						<h1 id="subject">커뮤니티</h1>
					</div>
					<div>
						<img id="customerImg" alt="" src="imgs/b01.jpg">
						<img id="method" alt="" src="imgs/method.png">
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