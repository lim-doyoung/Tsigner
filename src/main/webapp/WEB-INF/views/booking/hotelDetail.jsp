<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<style type="text/css">

#img{
width: 100%;
}

#carousel img{
	width: 100%;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>
	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-sm-6 col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-sm-6 col-md-8">
				<br>
					<div id="roomInfo">
					<%
					ArrayList<String> thumbList = (ArrayList<String>)request.getAttribute("thumbList");
					%>
					<div class="row">
					<div class="col-md-6">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <%for(int i=1; i<thumbList.size(); i++){ %>
					    <li data-target="#carousel-example-generic" data-slide-to="<%=i%>"></li>
					    <%} %>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  
					  <div id="carousel" class="carousel-inner" role="listbox">
					    <div class="item active">
					      <img src="<%=thumbList.get(0) %>" alt="이미지">
					    </div>
					    <%for(int i=1; i<thumbList.size(); i++){	 %>
					    <div class="item">
					      <img src="<%=thumbList.get(i) %>" alt="이미지">
					    </div>
					    <%} %>
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
					<div>
					<!-- 방 정보 오른쪽 부분 -->
					<%
						String hotelTitle=(String)request.getAttribute("hotelTitle");
						String hotelAdd=(String)request.getAttribute("hotelAdd");
						String hotelRate=(String)request.getAttribute("hotelRate");
					%>
					<h2><%=hotelTitle %></h2>
					<span>평점 : <%=hotelRate %></span>
					<p><%=hotelAdd %></p>
					</div>
					</div>
					</div>
					<!-- 방가격 및 정보 -->
					<div id="roomPrice">
					<%
						ArrayList<String> roomTitle = (ArrayList<String>)request.getAttribute("roomTitle");
						ArrayList<String> roomPrice = (ArrayList<String>)request.getAttribute("roomPrice");
						ArrayList<String> roomImgs = (ArrayList<String>)request.getAttribute("roomImgs");
						String root=request.getContextPath();
					%>
					<br>
						<div class="row">
						  <div class="col-sm-6 col-md-10">
						  
						  <%for(int i=0; i<roomTitle.size(); i++){ %>
						  <div class="row">
						  <div class="col-md-5">
						     <img id="img" src="<%=roomImgs.get(i) %>" alt="방 이미지">
						  </div>
						  <form action="<%=root %>/pay" method="post">
						   <div class="caption col-md-7">
						        <h3><%=roomTitle.get(i) %></h3>
<%-- 						        <%System.out.println(roomTitle.get(i)); %> --%>
						        <h4><%=roomPrice.get(i) %>
<%-- 						        <%System.out.println(roomPrice.get(i)); %> --%>
   								<br>
						        <button class="btn btn-default btn-block" role="button">결제</button>
						        </h4>
						      
						      </div>
						   
						      <input type="hidden" name="payType" value="숙박결제">
						      <input type="hidden" name="name" value="<%=roomTitle.get(i)%>">
						      <%
						      String roomVal=roomPrice.get(i);
						      roomVal=roomPrice.get(i).replace("원","");
						      roomVal=roomVal.replace(",","");
						      %>
						      <input id="amount" type="hidden" name="amount" value="<%=roomVal%>">
						  </form>
						  </div>
						  <br>
						  <%}%>
						     
						  </div>
						</div>
						
					
					</div>
					<!-- 방가격 및 정보 끝 -->

					<div id="info">
						<%
						ArrayList<String> info1List = (ArrayList<String>)request.getAttribute("info1List");
						ArrayList<String> info2List = (ArrayList<String>)request.getAttribute("info2List");
						
					%>
						<%
						for(int i=0; i<info2List.size(); i++){
						%>
						<h3><%=info1List.get(i+1) %></h3>
						<p><%=info2List.get(i) %></p>
						<%
						}
						%>


					</div>

					<div id="map">
						<%
		String mapy=(String)request.getAttribute("mapy");
		String mapx=(String)request.getAttribute("mapx");
	%>
						<input id="mapx" type="hidden" value="<%=mapx%>"> <input
							id="mapy" type="hidden" value="<%=mapy%>">
						<div id="map" style="width: 100%; height: 350px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f5f158f6a04f8c297bf6844e97ae3cf"></script>
						<script>
									var mapx=$('#mapx').val();
									var mapy=$('#mapy').val();
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												mapy, mapx), // 지도의 중심좌표
										level : 2
									// 지도의 확대 레벨
									};

									var map = new kakao.maps.Map(mapContainer,
											mapOption); // 지도를 생성합니다

									// 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(
											mapy, mapx);

									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										position : markerPosition
									});

									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);

									// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
									// marker.setMap(null);
								</script>
					</div>


				</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<jsp:include page="../template/footer.jsp"></jsp:include>



</body>
</html>