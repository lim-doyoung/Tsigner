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
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	
	});
</script>
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
							
							String tel="번호없음";
							
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
							
							if(tmp.has("tel")){
								tel = (tmp.get("tel").toString());
								tel = tel.replace("\"", "");
							}
							
							
							
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
						<td><img src="<%=img %>" alt="이미지없음"></td>
						<tr>
						<tr>
							<th><%=title %></th>
						</tr>
						
					
						<tr>
							<th>tel : <%=tel %></th>
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
			</div>
		</div>
	</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

	<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>