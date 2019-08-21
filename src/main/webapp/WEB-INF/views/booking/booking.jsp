<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="org.springframework.ui.Model"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#siSeoul').click(function(){
			$('#siBtn').html('<form action="reCourseList"> <button name="region" value="서울시전체" class="btn btn-primary btn-lg" type="submit" >전체</button> <button name="region" value="서울시강남" id="gun1" class="btn btn-primary btn-lg" type="submit">강남</button> <button name="region" value="서울시종로" id="gun2" class="btn btn-primary btn-lg" type="submit">종로</button> <button name="region" value="서울시중구" id="gun3" class="btn btn-primary btn-lg" type="submit">중구</button></form>');
		});
		$('#siBusan').click(function(){
			$('#siBtn').html('<form action="reCourseList"> <button name="region" value="부산시전체" class="btn btn-primary btn-lg" type="submit" >전체</button> <button name="region" value="부산시해운대" id="gun1" class="btn btn-primary btn-lg" type="submit">해운대</button> <button name="region" value="부산시부산진구" id="gun2" class="btn btn-primary btn-lg" type="submit">부산진구</button> <button name="region" value="부산시부산중구" id="gun3" class="btn btn-primary btn-lg" type="submit">중구</button></form>');
		});
		$('#siJeju').click(function(){
			$('#siBtn').html('<form action="reCourseList"> <button name="region" value="제주시전체" class="btn btn-primary btn-lg" type="submit" >전체</button> <button name="region" value="제주시서귀포" id="gun1" class="btn btn-primary btn-lg" type="submit">서귀포</button> <button name="region" value="제주시제주" id="gun2" class="btn btn-primary btn-lg" type="submit">제주시</button></form>');
		});
	});

</script>
<style type="text/css">
#imgs {
	width: 171px;
	height: 180px;
}

#pageNum{
	text-align: center;
}
#selectV a{
	display: block;
	height: 180px;
}
#siBtn{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Tsigner - 숙박예약</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
			<div class="col-md-12">
			<div class="row">
			<div class="col-md-6">
				<a role="button" class="btn btn-info btn-lg" >버어튼</a>
			</div>
			</div>
			<div class="col-md-6"></div>
			<br>
			<div class="jumbotron" id="siBtn">
				<button id="siSeoul" class="btn btn-info btn-lg" type="submit">서울</button>
				<button id="siBusan" class="btn btn-info btn-lg" type="submit">부산</button>
				<button id="siJeju" class="btn btn-info btn-lg" type="submit">제주</button>
				</div>
				<br>
				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-12">
				
						<%
							String jsonRoom = (String) request.getAttribute("data");
							//System.out.println(jsonRoom);
							JsonParser jsonParser = new JsonParser();
							JsonObject jsonObject = (JsonObject) jsonParser.parse(jsonRoom);
							JsonObject dataObject = (JsonObject) jsonObject.get("response");
							//System.out.println(dataObject);
							JsonObject dataObject2 = (JsonObject) dataObject.get("body");
							String totalPage=dataObject2.get("totalCount").toString();
							String paperNumber=dataObject2.get("numOfRows").toString();
							//페이지 넘버링을 위한 total
							int paperNum=Integer.parseInt(paperNumber);
							int total=Integer.parseInt(totalPage);
							//System.out.println(paperNum);
							
							JsonObject dataObject3 = (JsonObject) dataObject2.get("items");
							String source = dataObject3.toString();
							//System.out.println(source);
							JsonParser parser = new JsonParser();
							JsonObject item = (JsonObject) parser.parse(source);
							JsonArray arr = (JsonArray) item.get("item");
							//System.out.println(item);							
							for (int i = 0; i < arr.size(); i++) {
								int val=(i+1)*100;
								JsonObject tmp = (JsonObject) arr.get(i);
								String title = (tmp.get("title")).toString();
								String id = (tmp.get("contentid")).toString();
								String type = (tmp.get("contenttypeid")).toString();
								String img = "imgs/no_img.gif";
								if (tmp.has("firstimage2")) {
									img = (tmp.get("firstimage2")).toString();
									img = img.replace("\"", "");
								}
								// 								System.out.println("tmp="+addr);
								// 								System.out.println(tmp);
								title = title.replace("\"", "");
								title = title.replace("[한국관광 품질인증/Korea Quality]", "");
						%>
						
						  <div class="col-xs-6 col-md-3">
						    <a href="courseDetail?id=<%=id%>&type=<%=type%>&val=<%=val%>" class="thumbnail">
						      <img id="imgs" src="<%=img%>" alt="이미지">
							 <br> <%=title %>
						    </a>
						  </div>
						
						
						<%
						if((i+1)%4==0){
							%>
							<div class="row"></div>
							<%
						}
							}
						%>
					
					
					
				</div>
				<div class="row">
				<div id="pageNum">
						<nav>
							<ul class="pagination">
							<%
								//total = 리스트의 총 갯수
								//pageNum = 한개의 페이지에서 출력할 리스트의 개수
								//totalPageN= 페이징 넘버
								//start=pageN의 처음 번호
								//endN=pageN왼쪽으로 넘어가는 갯수
								//end2N=pageN오른쪽으로 넘어가는 갯수
							int totalPageN = total/paperNum;
							String param=request.getParameter("idx");
							if(param==null)param="1";
							int pageN=Integer.parseInt(param);
							//System.out.println(pageN);
							
							int start=((pageN-1)/5)*5;
							if(pageN%5==0){
								start=start+5;
							}
							if(pageN%5==1){
								start=start-5;
							}
							if(start<1){
								start=0;
							}
							int end=total/paperNum;
							if(total%paperNum!=0){
								end++;
							}
							int end2=end;
							if(start+5<end){
								end=start+5;
							}
							int endPage=pageN+1;
							
							int endN=pageN-5;
							if(endN<=0){
								endN=1;
							}
							
							int end2N=pageN+5;
							if(end2N>=totalPageN){
								end2N=totalPageN+1;
							}
							
							
							%>
							
							<%
							String sigun=request.getParameter("region");
							if(sigun==null){
								sigun="서울시전체";
							}
							%>
							
								<li><a href="bookingCourse?idx=<%=endN%>&region=<%=sigun %>" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<%
								for(int i=start; i<end; i++){
								%>
								<li><a href="bookingCourse?idx=<%=i+1%>&region=<%=sigun %>"><%=i+1 %></a></li>
								<%}%>
								<li><a href="bookingCourse?idx=<%=end2N%>&region=<%=sigun %>" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
					</div>
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

	<jsp:include page="../template/footer.jsp"></jsp:include>


</body>
</html>