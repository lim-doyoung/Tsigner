<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	});
</script>
<style type="text/css">
#courseImgs{
	width: 100%;
}
#courseOverview{
	height: 100%;
}
</style>
</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-md-8">
				
				<%
							String jsonRoom = (String)request.getAttribute("data");
							JsonParser jsonParser = new JsonParser();
							JsonObject jsonObject = (JsonObject)jsonParser.parse(jsonRoom);
							JsonObject dataObject = (JsonObject)jsonObject.get("response");
							JsonObject dataObject2 = (JsonObject)dataObject.get("body");
							JsonObject dataObject3 = (JsonObject)dataObject2.get("items");
							//System.out.println("찍혀요"+dataObject3);
							JsonObject tmp = (JsonObject)dataObject3.get("item");
							String overview = (tmp.get("overview").toString());
							String title = (tmp.get("title").toString());
							String mapInfox = (tmp.get("mapx")).toString();
							String mapInfoy = (tmp.get("mapy")).toString();
							
							
							mapInfox=mapInfox.replace("\"", "");
							mapInfoy=mapInfoy.replace("\"", "");
							Double mapx=Double.valueOf(mapInfox);
							Double mapy=Double.valueOf(mapInfoy);
							
// 							int su1=(int)(mapx*1000000);
// 							int su2=(int)(mapy*1000000);
// 							System.out.println(su1+" "+su2);
							
// 							mapx=su1/1000000.0;
// 							mapy=su2/1000000.0;
							
							System.out.println(mapx+" "+mapy);
							
							title=title.replace("\"", "");
							title = title.replace("[한국관광 품질인증/Korea Quality]", "");
							
							
							
							
							String img = "imgs/no_img.gif";
							if (tmp.has("firstimage")) {
								img = (tmp.get("firstimage")).toString();
								img = img.replace("\"", "");
							}
							
							
							
							
							overview=overview.replace("#", " ");
							overview=overview.replace("\"", "");
							overview=overview.replace("\\n", "\n");
							
				%>
				<form action="pay" method="post">
					<table class="table">
						<tr>
							<th><h2><%=title %></h2></th>
						</tr>
						
						<tr>
						<td><img src="<%=img %>" alt="이미지없음"></td>
						<tr>
						<tr>
							<th>위치</th>
						</tr>
						<tr>
							<td>
								<input id="mapx" type="hidden" value="<%=mapx%>">
								<input id="mapy" type="hidden" value="<%=mapy%>">
								<div id="map" style="width:100%;height:350px;"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f5f158f6a04f8c297bf6844e97ae3cf"></script>
								<script>
									var mapx=$('#mapx').val();
									var mapy=$('#mapy').val();
									console.log(mapx+','+mapy);
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
							</td>
						</tr>
						<tr>
							<th>설명</th>
						</tr>
						
						<tr>
							<td><%=overview %></td>
						</tr>
						<tr>
							<td></td>
						</tr>
					</table>
				</form>
				
				<!-- 코스 -->
				<div id="course">
					<div>
					<%
					String jsonCourse = (String)request.getAttribute("data2");
					//System.out.println(jsonCourse);
					JsonObject courseObject = (JsonObject)jsonParser.parse(jsonCourse);
					JsonObject courseObject1 = (JsonObject)courseObject.get("response");
					JsonObject courseObject2 = (JsonObject)courseObject1.get("body");
					//System.out.println(courseObject2);
					JsonObject courseObject3 = (JsonObject)courseObject2.get("items");
					//System.out.println("찍혀요"+dataObject3);
					JsonArray items = (JsonArray)courseObject3.get("item");
					
					for(int i=0; i<items.size(); i++){
						JsonObject item = (JsonObject)items.get(i);
						String subTitle="이름없음";
						if(item.has("subdetailalt")){
							subTitle = (item.get("subdetailalt")).toString();
						}else if(item.has("subname")){
							subTitle = (item.get("subname")).toString();
						}
						
						String courseImg="imgs/no_img.gif";
						if(item.has("subdetailimg")){
							courseImg = (item.get("subdetailimg")).toString();
						}
						
						String courseOverview=(item.get("subdetailoverview")).toString();
						
						subTitle=subTitle.replace("\"", "");
						courseImg=courseImg.replace("\"", "");
						courseOverview=courseOverview.replace("\"", "");
						courseOverview=courseOverview.replace("\\n", "");
					%>
						<div class="row">
							<div class="col-md-12">
							</div>
							<!-- 코스 사진 -->
							<div class="col-md-6">
								<img id="courseImgs" alt="코스사진" src="<%=courseImg%>">
							</div>
							
							<!-- 코스 설명 -->
							<div class="col-md-6">
								<h4>코스 <%=i+1 %> : <%=subTitle%> </h4>
								<p><%=courseOverview %></p>
							</div>
						</div>
						<br>
						<%
						}
						%>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->
	<div class="jumbotron2">
	<jsp:include page="../template/footer.jsp"></jsp:include>
	</div>
</body>
</html>