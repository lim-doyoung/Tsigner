<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="template/header.jspf"%>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-md-8">

					<table class="table">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
						<c:forEach items="${alist }" var="bean">
							<tr>
									<td>${bean.num }</td>
									<td>${bean.sub }</td>
									<td>${bean.nalja }</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

	<%@ include file="template/footer.jspf"%>


</body>
</html>