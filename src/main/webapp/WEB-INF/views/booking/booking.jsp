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
	$(document).ready(function() {

		
	});
</script>
<style type="text/css">
#imgs {
	width: 150px;
	height: 150px;
}

td>a {
	height: 150px;
	line-height: 150px;
}
#pageNum{
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../template/header.jsp"></jsp:include>

	<!-- 여기서부터 컨텐츠입니다 -->
	<div id="content">
		<div class="row">
		<div class="jumbtron1">
		
		</div>
			<div class="col-md-12">

				<!-- 컨텐츠의 내용을 입력하세요 -->
				<div class="col-md-offset-2 col-md-8">
					<table class="table">
						<tr>
							<th>이미지</th>
							<th>정보</th>
							<th>가격</th>
						</tr>
						<%
							String jsonRoom = (String) request.getAttribute("data");
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
							JsonParser parser = new JsonParser();
							JsonObject item = (JsonObject) parser.parse(source);
							JsonArray arr = (JsonArray) item.get("item");

							for (int i = 0; i < arr.size(); i++) {
								int val=(i+1)*100;
								JsonObject tmp = (JsonObject) arr.get(i);
								String addr = (tmp.get("addr1")).toString();
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
								addr = addr.replace("\"", "");
								title = title.replace("\"", "");
						%>
						<tr>
							<td><a href="roomDetail?id=<%=id%>&type=<%=type%>&val=<%=val%>"><img id="imgs" src="<%=img%>" alt="이미지 없음"></a></td>
							<td><a href="roomDetail?id=<%=id%>&type=<%=type%>&val=<%=val%>"><%=addr%> <%=title%></a></td>
							<td><a href="roomDetail?id=<%=id%>&type=<%=type%>&val=<%=val%>"></a></td>
						</tr>
						<%
							}
						%>
					</table>
					
					
					<!-- 페이징 고장난거임 나중에 꼭 고쳐서 써야함!!! -->
					<div id="pageNum">
						<nav>
							<ul class="pagination">
							<%
								//total = 리스트의 총 갯수
								//pageNum = 한개의 페이지에서 출력할 리스트의 개수
								//totalPageN= 페이징 넘버
							int totalPageN = total/paperNum;
							String param=request.getParameter("idx");
							if(param==null)param="1";
							int pageN=Integer.parseInt(param);
							//System.out.println(pageN);
							int start=((pageN-1)/5)*5;							
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
							%>
							
								<li><a href="bookingRoom?idx=<%=endN%>" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<%
								for(int i=start; i<end; i++){
								%>
								<li><a href="bookingRoom?idx=<%=i+1%>"><%=i+1 %></a></li>
								<%}%>
								<li><a href="bookingRoom?idx=<%=pageN+1%>" aria-label="Next"> <span
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