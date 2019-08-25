<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
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
<style type="text/css">
#imgs {
	width: 242px;
	height: 200px;
}
#thumb{
	text-align: right;
}
</style>
<script type="text/javascript">


		function citySelect(province){
// 			alert('변경');
			$.ajax({
				url:'searchCode',
				type:'POST',
				dataType:'json',
				data : {param:province},
				success:function(result){
// 					alert(result);
					//select box 초기화
					$('#region').find('option').remove().end().append('<option value="">지역을 선택</option>');
					//option 추가
					$.each(result, function(i){
						$('#region').append('<option value="'+result[i]+'">'+result[i]+'</option>');
					});
				},
				erro:function(jqXHR, textStatus, errorThrown){
					alert('오류가 발생했습니다');
				}
			});
		}

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
				
				<div class="row">
				<div class="jumbotron">
							<form action="searchRoom" class="form-inline">
								<div class="form-group">
									<label for="checkIn">지역</label>
									<select id="province" name="province" onchange="citySelect(this.value);" class="form-control">
										<option value="">지역</option>
										<option value="seoul">서울</option>
										<option value="busan">부산</option>
										<option value="jeju">제주</option>
										<option value="gangwon">강원</option>
										<option value="geunggi">경기</option>
										<option value="incheon">인천</option>
										<option value="geungsang">경상</option>
										<option value="junla">전라</option>
										<option value="chungcheng">충청</option>
									</select>
									<select class="form-control" id="region" name="region">
										<option value="">지역을 선택하세요</option>
									</select>
									
									
								</div>
								
								<br>
								<div class="form-group">
									<label for="checkIn">체크인</label> <input name="checkIn" type="date" class="form-control" id="checkIn" placeholder="Jane Doe">
								</div>
								<div class="form-group">
									<label for="checkOut">체크아웃</label> <input name="checkOut" type="date" class="form-control" id="checkOut" placeholder="Jane Doe">
								</div>
								<br>
								<div class="form-group">
									<label for="checkOut">인원</label> <input name="persons" type="number" class="form-control" id="checkOut" placeholder="인원수(성인)" value="2">
								</div>
								<button type="submit" class="btn btn-default">검색</button>
							</form>
						</div>
					
				
				</div>
				
				
					<%
		ArrayList<String> priceList = (ArrayList)request.getAttribute("priceList");
		ArrayList<String> titleList = (ArrayList)request.getAttribute("titleList");
		ArrayList<String> imgs = (ArrayList)request.getAttribute("imgs");
		ArrayList<String> idList = (ArrayList)request.getAttribute("idList");
		ArrayList<String> idList2 = (ArrayList)request.getAttribute("idList2");
		ArrayList<String> regionList = (ArrayList)request.getAttribute("regionList");
		String checkInDate = (String)request.getAttribute("checkInDate");
		String checkOutDate = (String)request.getAttribute("checkOutDate");
		
		for(int i=0; i<priceList.size(); i++){
	%>

  <div class="col-xs-6 col-md-3">
    <a id="thumb" href="booking/hotelDetail?id1=<%=idList.get(i) %>&id2=<%=idList2.get(i) %>&date1=<%=checkInDate %>&date2=<%=checkOutDate %>" class="thumbnail">
      <img id="imgs" src="<%=imgs.get(i)%>" alt="...">
  		<span class="badge"><%=titleList.get(i)%></span>
  		<br>
  		<span class="badge"><%=regionList.get(i)%></span>
  		<br>
  		<span class=""><%=priceList.get(i)%></span>
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
			</div>
		</div>
	</div>
	<!-- 여기까지 컨텐츠입니다 -->

<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>