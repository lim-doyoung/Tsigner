<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>

<style type="text/css">

	#content{
		margin:0px auto;
		width:1440px;
	}

	#carousel-example-generic{
		height: 267px;
	}
	#hotPlace,#myplan{
		width:1400px;
		height: 400px;
	}
	.imgs{
		width: 400px;
		height: 267px;
	}	
	.myplans{
		width: 350px;
		height: 267px;
	}	
	
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$('#makePlan').click(function(e){
			location.href='makeplan';
		});
	});
	
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
	
		<br/><br/>
		<!-- 내 플랜 -->
		<div id="myplan">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-1"></div>
						<div class="col-md-10">
							<table class="table table-hover">
									<thead>
										<tr>
											<th>나의 플래너</th>
										</tr>
									</thead>	
									<tbody>
										<tr>
											<td>
												<img class="myplans" alt="..." src="imgs/a1.jpg">
												<img class="myplans" alt="..." src="imgs/a2.jpg">
												<img class="myplans" alt="..." src="imgs/a3.jpg">
											</td>
										</tr>
									</tbody>	
								</table>
							</div>	
							<div class="col-md-1"></div>
							<div id="makePlanner">
								<div class="row">
									<div class="col-md-6"></div>
									<div class="col-md-2">
										<button type="button" class="btn btn-success" id="makePlan">플랜만들기</button>
									</div>
								</div>	
							</div>
							
						</div>
				</div>
			
		</div>
	
	
		<!-- 플래너 만들기 -->
	
		<!-- 핫플레이스 -->
		<div id="hotPlace">
			<br/><br/>
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<h3>인기플레이스</h3>
					</div>
				</div>
			</div>	
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						  <!-- Indicators -->
						  <ol class="carousel-indicators">
						    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
						    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>
						
						  <!-- Wrapper for slides -->
						  <div class="carousel-inner" role="listbox">
						    <div class="item active">
						    	<div>
							      	<img class="imgs" src="imgs/a1.jpg" alt="...">
							      	<img class="imgs" src="imgs/a2.jpg" alt="...">
							      	<img class="imgs" src="imgs/a3.jpg" alt="...">
						      	</div>
						      <div class="carousel-caption">
						      	
						      </div>
						    </div>
						    <div class="item">
						    	<div>
						      		<img class="imgs" src="imgs/a4.jpg" alt="...">
						      		<img class="imgs" src="imgs/a5.jpg" alt="...">
						      		<img class="imgs" src="imgs/a6.jpg" alt="...">
						      	</div>
						      <div class="carousel-caption">
						      </div>
						    </div>
						    <div class="item">
						    	<div>
						      		<img class="imgs" src="imgs/a7.jpg" alt="...">
						      		<img class="imgs" src="imgs/b1.jpg" alt="...">
						      		<img class="imgs" src="imgs/b2.jpg" alt="...">
						    	</div>
						      <div class="carousel-caption">
						      </div>
						    </div>
						  </div>
						
						  <!-- Controls -->
						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>
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