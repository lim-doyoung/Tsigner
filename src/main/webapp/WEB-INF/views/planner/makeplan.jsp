<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css" />
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
    #content{
        width: 1583px;
    }
    
    #tabs li,ul{
        background-color: white;
    }
    
    #top{
        width: 100%;
        height: 70px;
        background-color: cornflowerblue;
        line-height: 70px;
    }      
    
    #buttons{
        float: right;
        margin: 0px 20px;
    }
    
    #dayDiv{
        float: left;
        width: 150px;
        height: 800px;
        background-color: dimgrey;
    }
    
    #selectLoc{
        float: left;
        width: 300px;
        height: 800px;
        background-color: aqua;
    }
    
    #category{
        position: absolute;
        left: 450px;
        z-index:5;
    }
    
    #tabsContent{
        width: 300px;
        height: 758px;
        background-color: black;
    }
    
    #mapDiv{
        float: left;
        width: 1133px;
        height: 800px;
    }
    
    #dayDiv div{
        width: 150px;
        height: 100px;
        background-color: yellow;
        border: solid 1px;
    }
    
    .form-control{
    	width: 90px;
    	display:inline-block;
    }
</style>

<script type="text/javascript">
    $(document).ready(function(){

		$('#tabs a').eq(0).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(0).parent().addClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');
		});
	
		$('#tabs a').eq(1).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(1).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');
		});
	
		$('#tabs a').eq(2).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(2).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');
		});
        
        $('#tabs a').eq(3).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(3).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
		});
        
        $('#a').click(function(){
            $('#category').removeClass('hide');
        });
        
        $('#tabs button').click(function(){
            $('#category').addClass('hide');
        });
        
        $('#dayDiv div').eq(0).click(function(){
            
        });

     /*   $('#selectLoc button').eq(1).click(function(){
            console.log('aasd');
            
            var data;
            alert('2');
            var sKey='RMXuxrglF4aN0k%2F8zj3aNWSC%2BhYdYfArk9DBnC%2BRWYkbnnM3Nh0CEyEI6CzQx%2F5hKHDPOTWDmBqMMPCnoIO%2Fpg%3D%3D';
            alert('3');
            $.get('http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey='+sKey+'&contentTypeId=12&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1', function (response) {
                data = response;
            });
            alert(data);
            return data;
        });*/
        //검색버튼 클릭 이벤트
        $('#searchPlace').click(function(){
			
			if(document.getElementById('contentTypeId').value==null || document.getElementById('contentTypeId').value==''){
				alert('선택안했음');
				return false;
			}
            
	        var sKey='RMXuxrglF4aN0k%2F8zj3aNWSC%2BhYdYfArk9DBnC%2BRWYkbnnM3Nh0CEyEI6CzQx%2F5hKHDPOTWDmBqMMPCnoIO%2Fpg%3D%3D';
	        var contentTypeId=document.getElementById('contentTypeId').value;
	        var areaCode=document.getElementById('areaCode').value;
	        var sigunguCode=document.getElementById('sigunguCode').value;
	        var keyword=document.getElementById('keyword').value;
	        var reqUrl;

	        if(keyword==null || keyword==''){
	        	reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey='+sKey+'&contentTypeId='+contentTypeId+'&areaCode='+areaCode+'&sigunguCode='+sigunguCode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=10&pageNo=1&_type=json';
	        }else{
	        	var encKeyword = encodeURI(keyword);
	        	reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey='+sKey+'&keyword='+encKeyword+'&contentTypeId='+contentTypeId+'&areaCode='+areaCode+'&sigunguCode='+sigunguCode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=10&pageNo=1&_type=json';
		    }
		    
	        $.ajax({
				url:reqUrl,
				type:'get',
				data:'idx=1',
				//dataType:
				success:function(data){
					console.log(data);
					if(data.response.body.totalCount!=0){

						if(data.response.body.totalCount<2){
							
							var input='<table border="1" width="280">';
							var img;
							if(data.response.body.items.item.firstimage2==null){
								img='imgs/a1.jpg';
							}else{
								img=data.response.body.items.item.firstimage2;
							}
							input+='<tr><td><img width="150" height="150" alt="..." src="'+img+'"/></td><td>'+data.response.body.items.item.title+'</td></tr>';
							input+='<tr><td>'+data.response.body.items.item.addr1+'</td></tr>';
							input+='</table>';
							$('#locResult').html(input);
							
						}else{
						
					//		console.log(data.response.body.items.item);
					//		alert(data.response.body.items.item.length);
							
							var dataArray=data.response.body.items.item;
							console.log(data.response.body.items.item.addr1);
								var input='<table border="1" width="280">';
								for(var i=0;i<dataArray.length;i++){
									var img;
									if(dataArray[i].firstimage2==null){
										img='imgs/a1.jpg';
									}else{
										img=dataArray[i].firstimage2;
									}
									input+='<tr><td><img width="150" height="150" alt="..." src="'+img+'"/></td><td>'+dataArray[i].title+'</td></tr>';
									input+='<tr><td>'+dataArray[i].addr1+'</td></tr>';
								}
								
									input+='</table>';
									$('#locResult').html(input);
									
				
								//지도 다시불러옴
								
								//중심좌표설정
								var xPosition,yPosition;
								if(document.getElementById('areaCode').value==1){
									xPosition=37.5611283;
									yPosition=126.9795475;
								}
								
								
								
		
				                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				                    mapOption = { 
				                        center: new kakao.maps.LatLng(xPosition, yPosition), // 지도의 중심좌표
				                        level: 9 // 지도의 확대 레벨
				                    };
		
				                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				                var map = new kakao.maps.Map(mapContainer, mapOption); 

								// 지도에 표시된 마커 객체를 가지고 있을 배열입니다							
								var markers = [];

		
								// 마커를 생성하고 지도위에 표시하는 함수입니다
								function addMarker(position) {
    
								    // 마커를 생성합니다
								    var marker = new kakao.maps.Marker({
								        position: position
								    });
								
								    // 마커가 지도 위에 표시되도록 설정합니다
								    marker.setMap(map);
								    
								    // 생성된 마커를 배열에 추가합니다
								    markers.push(marker);
								}

								for(var i=0;i<dataArray.length;i++){
									addMarker(new kakao.maps.LatLng(dataArray[i].mapy, dataArray[i].mapx));
								}
		
				                
		
				                    // 마커 이미지의 이미지 주소입니다
				                    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
				                    for (var i = 0; i < positions.length; i ++) {
		
				                        // 마커 이미지의 이미지 크기 입니다
				                        var imageSize = new kakao.maps.Size(24, 35); 
		
				                        // 마커 이미지를 생성합니다    
				                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
				                        // 마커를 생성합니다
				                        var marker = new kakao.maps.Marker({
				                            map: map, // 마커를 표시할 지도
				                            position: positions[i].latlng, // 마커를 표시할 위치
				                            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				                            image : markerImage // 마커 이미지 
				                        });
				                    }
						}
					}else{
						$('#locResult').html('검색결과가 없습니다');

					}

				}
			});
        });

		$('#areaCode').change(function(){

			if(document.getElementById('areaCode').value!=''){
			//시,군,구 코드 세팅
				$.ajax({
					url:"search/areacode",
					data:{areaCode:document.getElementById('areaCode').value},
					method:"GET",
					dataType:"json"
				}).done(function(data){

					var input='<option value="">전체</option>';
					for(var i=0;i<data.length;i++){
						input+='<option value="'+data[i].sigungu_code+'">'+data[i].loc_dtl_name+'</option>';
					}
					$('#sigunguCode').html(input);
					
				});
			}else{
				$('#sigunguCode').html('<option value="">전체</option>');
			}	
		});

        
	});
</script>

</head>
<body>
    <div id="content">
        <div id="top">
            <div>
            </div>
            <div id="buttons">
                <button type="button" class="btn btn-success">저장</button>
                <button type="button" class="btn btn-warning">닫기</button>
            </div>        
        </div>
        <div id="middle">
            <div id="dayDiv">
                <div>
                    day1
                </div>
                <div>
                    day2
                </div>
                <div>
                    day3
                </div>
            </div>
            <div id="selectLoc" style="overflow:scroll">
                
                	<!-- 장소구분 -->
                	<select id="contentTypeId" name="contentTypeId" class="form-control">
                    	<option selected="selected" value="">선택</option>
                        <option value="12">관광지</option>
                        <option value="32">숙소</option>
                        <option value="39">맛집</option>
                    </select>
                
               		<!-- 도시코드 - 특별시,광역시,도 -->
                    <select id="areaCode" name="areaCode" class="form-control">
                    	<option selected="selected" value="">전체</option>
                        <option value="32">강원</option>
                        <option value="31">경기</option>
                        <option value="35">경북</option>
                        <option value="36">경남</option>
                        <option value="5">광주</option>
                        <option value="4">대구</option>
                        <option value="3">대전</option>
                        <option value="6">부산</option>
                        <option value="1">서울</option>
                        <option value="8">세종</option>
                        <option value="7">울산</option>
                        <option value="2">인천</option>
                        <option value="37">전북</option>
                        <option value="38">전남</option>
                        <option value="39">제주</option>
                        <option value="33">충북</option>
                        <option value="34">충남</option>
                    </select>
                    
                    <!-- 시,군,구 코드 -->
                    <select id="sigunguCode" name="sigunguCode" class="form-control">
                    	<option selected="selected" value="">전체</option>
                    </select>
                    
                    <input type="text" id="keyword" name="keyword"/>
                    <button type="button" id="searchPlace">검색</button>
                    
                <button type="button" id="a">장소선택</button>
                    <div id="locResult">
                    	
                    </div>    
                
            </div>
            
            <div id="category" class="hide">
                <div id="tabs">
				    <ul class="nav nav-pills">
				        <li role="presentation" class="active"><a href="#">관광지</a></li>
				        <li role="presentation"><a href="#">숙소</a></li>
				        <li role="presentation"><a href="#">맛집</a></li>
				        <li role="presentation"><a href="#">교통</a></li>
				        <button type="button">x</button>
				    </ul>
                </div>
                <div id="tabsContent">
                    
                </div>
            </div>
            <div id="mapDiv">
                <div id="map" style="width:100%;height:800px;"></div>

                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d5e477e33c96b52224f709e9c28161c"></script>
                <script>
                var xPosition,yPosition;
                xPosition=(37.5788222356+37.5758422+37.5762653+37.5767159)/4;
                yPosition=(126.9769930325+126.9713913+126.9737248+126.9736068)/4;    
   
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(xPosition, yPosition), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                var positions = [
                        {
                            title: '경복궁', 
                            latlng: new kakao.maps.LatLng(37.5788222356, 126.9769930325)
                        },
                        {
                            title: '경복궁역', 
                            latlng: new kakao.maps.LatLng(37.5758422, 126.9713913)
                        },
                        {
                            title: '통의파출소', 
                            latlng: new kakao.maps.LatLng(37.5762653, 126.9737248)
                        },
                        {
                            title: '코오롱빌딩',
                            latlng: new kakao.maps.LatLng(37.5767159, 126.9736068)
                        }
                    ];

                    // 마커 이미지의 이미지 주소입니다
                    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

                    for (var i = 0; i < positions.length; i ++) {

                        // 마커 이미지의 이미지 크기 입니다
                        var imageSize = new kakao.maps.Size(24, 35); 

                        // 마커 이미지를 생성합니다    
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            map: map, // 마커를 표시할 지도
                            position: positions[i].latlng, // 마커를 표시할 위치
                            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                            image : markerImage // 마커 이미지 
                        });
                    }    
                </script>
            </div>
        </div>
    </div>
</body>
</html>