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
							System.out.println("찍혀요"+dataObject3);
							JsonObject tmp = (JsonObject)dataObject3.get("item");
							String overview = (tmp.get("overview").toString());
							String addr1 = (tmp.get("addr1").toString());
							String title = (tmp.get("title").toString());
							String tel="번호없음";
							
							addr1=addr1.replace("\"", "");
							title=title.replace("\"", "");
							
							
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
					<table class="table">
						<tr>
						<td><img src="<%=img %>" alt="이미지없음"></td>
						<tr>
						<tr>
							<th><%=addr1 %> : <%=title %></th>
						</tr>
						<tr>
							<th>가격 : <%=request.getParameter("val") %>원</th>
						</tr>
						<tr>
							<th>tel : <%=tel %></th>
						</tr>
						<tr>
							<th>설명</th>
						</tr>
						
						<tr>
							<td><%=overview %></td>
						</tr>
					</table>
					
			</div>
		</div>
	</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

	<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>