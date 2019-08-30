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
        width: 1439px;
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
        background-color: white;
    }
    
    #mapDiv{
        float: left;
        width: 989px;
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

        //현재 day선택 세션 : 1
    	sessionStorage.setItem('day_deg', '1');

		//관광지 탭 클릭
		$('#tabs a').eq(0).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(0).parent().addClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');
			
			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+' div').eq(0).addClass('hide');
			$('#tabsDay'+position+' div').eq(1).addClass('hide');
			$('#tabsDay'+position+' div').eq(2).addClass('hide');
			$('#tabsDay'+position+' div').eq(3).addClass('hide');
			$('#tabsDay'+position+' div').eq(0).removeClass('hide');


		});

		//숙소 탭 클릭
		$('#tabs a').eq(1).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(1).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+' div').eq(0).addClass('hide');
			$('#tabsDay'+position+' div').eq(1).addClass('hide');
			$('#tabsDay'+position+' div').eq(2).addClass('hide');
			$('#tabsDay'+position+' div').eq(3).addClass('hide');
			$('#tabsDay'+position+' div').eq(1).removeClass('hide');
		});

		//맛집 탭 클릭
		$('#tabs a').eq(2).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(2).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(3).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+' div').eq(0).addClass('hide');
			$('#tabsDay'+position+' div').eq(1).addClass('hide');
			$('#tabsDay'+position+' div').eq(2).addClass('hide');
			$('#tabsDay'+position+' div').eq(3).addClass('hide');
			$('#tabsDay'+position+' div').eq(2).removeClass('hide');
		});

        //교통 탭 클릭
        $('#tabs a').eq(3).click(function(e){
			e.preventDefault();
			$('#tabs a').eq(3).parent().addClass('active');
			$('#tabs a').eq(0).parent().removeClass('active');
			$('#tabs a').eq(1).parent().removeClass('active');
			$('#tabs a').eq(2).parent().removeClass('active');

			var position=sessionStorage.getItem('day_deg');
			$('#tabsDay'+position+' div').eq(0).addClass('hide');
			$('#tabsDay'+position+' div').eq(1).addClass('hide');
			$('#tabsDay'+position+' div').eq(2).addClass('hide');
			$('#tabsDay'+position+' div').eq(3).addClass('hide');
			$('#tabsDay'+position+' div').eq(3).removeClass('hide');
		});
        
        $('#a').click(function(){
            $('#category').removeClass('hide');
        });
        
        $('#tabs button').click(function(){
            $('#category').addClass('hide');
        });


        //검색버튼 클릭 이벤트
        $('#searchPlace').click(function(){
			
			if(document.getElementById('contentTypeId').value==null || document.getElementById('contentTypeId').value==''){
				alert('선택안했음');
				return false;
			}

			//검색결과 전부 지움
			$('#locResult').empty();
            
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
							
							var img;
							var input='';
							if(data.response.body.items.item.firstimage2==null){
								img='imgs/no_img.gif';
							}else{
								img=data.response.body.items.item.firstimage2;
							}
							$('#locResult').append('<div class="locSelect" style="height: 200px; width: 280px; border:1px solid black;"><img width="150" height="150" alt="..." src="'+img+'"/>'+data.response.body.items.item.title+'<br/>'+data.response.body.items.item.addr1+'<input type="hidden" id="contenttypeid" value="'+data.response.body.items.item.contenttypeid+'"/><input type="hidden" id="contentId" value="'+data.response.body.items.item.contentid+'"/></div>');
						//	input+='<div onclick="locClick()" class="locSelect" style="height: 200px; width: 280px; border:1px solid black;"><img width="150" height="150" alt="..." src="'+img+'"/>'+data.response.body.items.item.title+'<br/>'+data.response.body.items.item.addr1+'</div>';
							
						//	$('#locResult').html(input);
							$('#locResult').append('<nav aria-label="..."><ul class="pagination pagination-lg">...</ul></nav><nav aria-label="..."><ul class="pagination">...</ul></nav><nav aria-label="..."><ul class="pagination pagination-sm">...</ul></nav>');
						}else{
						
					//		console.log(data.response.body.items.item);
					//		alert(data.response.body.items.item.length);
							
							var dataArray=data.response.body.items.item;
							var input='';
								for(var i=0;i<dataArray.length;i++){
									var img;
									
									if(dataArray[i].firstimage2==null){
										img='imgs/no_img.gif';
									}else{
										img=dataArray[i].firstimage2;
									}

									$('#locResult').append('<div class="locSelect" style="height: 200px; width: 280px; border:1px solid black;"><img width="150" height="150" alt="..." src="'+img+'"/>'+dataArray[i].title+'<br/>'+dataArray[i].addr1+'<input type="hidden" id="contenttypeid" value="'+dataArray[i].contenttypeid+'"/><input type="hidden" id="contentId" value="'+dataArray[i].contentid+'"/></div>');
								//	input+='<div onclick="locClick()" class="locSelect" style="height: 200px; width: 280px; border:1px solid black;"><img width="150" height="150" alt="..." src="'+img+'"/>'+dataArray[i].title+'<br/>'+dataArray[i].addr1+'</div>';
									
								}
								$('#locResult').append('<nav aria-label="..."><ul class="pagination pagination-lg">...</ul></nav><nav aria-label="..."><ul class="pagination">...</ul></nav><nav aria-label="..."><ul class="pagination pagination-sm">...</ul></nav>');
							//		$('#locResult').html(input);
									
				
								//지도 다시불러옴
								
								//중심좌표설정
								var xPosition,yPosition;
								if(document.getElementById('areaCode').value==1){
									xPosition=37.5611283;
									yPosition=126.9795475;
								}else if(document.getElementById('areaCode').value==2){
									xPosition=37.4568505;
									yPosition=126.702966;
								}else if(document.getElementById('areaCode').value==3){
									xPosition=36.350461;
									yPosition=127.38263;
								}else if(document.getElementById('areaCode').value==4){
									xPosition=35.8693295;
									yPosition=128.5387992;
								}else if(document.getElementById('areaCode').value==5){
									xPosition=35.1772149;
									yPosition=126.7515678;
								}else if(document.getElementById('areaCode').value==6){
									xPosition=35.1798856;
									yPosition=129.0728478;
								}else if(document.getElementById('areaCode').value==7){
									xPosition=35.5387416;
									yPosition=129.1172225;
								}else if(document.getElementById('areaCode').value==8){
									xPosition=36.4801027;
									yPosition=127.2868467;
								}else if(document.getElementById('areaCode').value==31){
									xPosition=37.2750552;
									yPosition=127.0072561;
								}else if(document.getElementById('areaCode').value==32){
									xPosition=37.8633724;
									yPosition=127.1265699;
								}else if(document.getElementById('areaCode').value==33){
									xPosition=36.6358136;
									yPosition=127.4891451;
								}else if(document.getElementById('areaCode').value==34){
									xPosition=36.6588327;
									yPosition=126.6706662;
								}else if(document.getElementById('areaCode').value==35){
									xPosition=36.5760896;
									yPosition=128.5035504;
								}else if(document.getElementById('areaCode').value==36){
									xPosition=35.2382949;
									yPosition=128.6902093;
								}else if(document.getElementById('areaCode').value==37){
									xPosition=35.8203643;
									yPosition=127.1065383;
								}else if(document.getElementById('areaCode').value==38){
									xPosition=34.816223;
									yPosition=126.4607355;
								}else if(document.getElementById('areaCode').value==38){
									xPosition=33.505454;
									yPosition=126.479512;
								}else{
									xPosition=33.450701;
									yPosition=126.570667;
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

    
    //장소선택 디바이스 클릭 이벤트
    $(document).on("click","#locResult div",function(){
		var idx=$(this).index();
		var contentId=$('#locResult div').eq(idx).find('input[type=hidden]').eq(1).val();

		var sKey='RMXuxrglF4aN0k%2F8zj3aNWSC%2BhYdYfArk9DBnC%2BRWYkbnnM3Nh0CEyEI6CzQx%2F5hKHDPOTWDmBqMMPCnoIO%2Fpg%3D%3D';
        var reqUrl;
        reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey='+sKey+'&contentTypeId=&contentId='+contentId+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json';

        $.ajax({
			url:reqUrl,
			type:'get',
			data:'idx=1',
			//dataType:
			success:function(data){
				console.log(data);
				//data.response.body.items.item
				var dataVal=data.response.body.items.item;
				var contenttypeid=dataVal.contenttypeid;
				var addr1=dataVal.addr1;
				var contentid=dataVal.contentid;
				var firstimage=dataVal.firstimage;
				var homepage=dataVal.homepage;
				var mapx=dataVal.mapx;
				var mapy=dataVal.mapy;
				var overview=dataVal.overview;
				var tel=dataVal.tel;
				var title=dataVal.title;
				var zipcode=dataVal.zipcode;	//우편번호

				console.log(contentid);			//필요없음
				console.log(contenttypeid);		//히든
				console.log(addr1);				//뷰
				console.log(firstimage);		//뷰
				console.log(homepage);			//상세정보
				console.log(mapx+','+mapy);		//히든
				console.log(overview);			//상세정보
				console.log(tel);				//뷰
				console.log(title);				//뷰
				console.log(zipcode);			//뷰

				if(zipcode==null){
					zipcodeTxt='';
				}else{
					zipcodeTxt='('+zipcode+')';
				}

				var img;
				if(firstimage==null){
					img='imgs/no_img.gif';
				}else{
					img=firstimage;
				}
				
				var temp='<span><img src="'+img+'" alt="firstimage" width="100%"/><label>'+title+' '+zipcodeTxt+'</label><br/>';
				temp+='<label>'+addr1+'</label><input type="hidden" id="contenttypeid" value="'+contenttypeid+'"/><input type="hidden" id="mapx" value="'+mapx+'"/>';
				temp+='<input type="hidden" id="mapy" value="'+mapy+'"/></span><hr style="border-color:gray;width:100%"></hr>';
				
				//관광지
				if(contenttypeid==12){
					$('#category').removeClass('hide');

			    	var position=sessionStorage.getItem('day_deg');
			    	$('#tabsDay'+position+' div').eq(0).removeClass('hide');
			    	$('#tabsDay'+position+' div').eq(1).addClass('hide');
					$('#tabsDay'+position+' div').eq(2).addClass('hide');
					$('#tabsDay'+position+' div').eq(3).addClass('hide');

			    	$('#tabs a').eq(0).parent().addClass('active');
					$('#tabs a').eq(1).parent().removeClass('active');
					$('#tabs a').eq(2).parent().removeClass('active');
					$('#tabs a').eq(3).parent().removeClass('active');

					$('#tabsDay'+position+' div').eq(0).append(temp);
				}
				//숙소
				else if(contenttypeid==32){
					$('#category').removeClass('hide');
			    	
			    	var position=sessionStorage.getItem('day_deg');
			    	$('#tabsDay'+position+' div').eq(1).removeClass('hide');
			    	$('#tabsDay'+position+' div').eq(0).addClass('hide');
					$('#tabsDay'+position+' div').eq(2).addClass('hide');
					$('#tabsDay'+position+' div').eq(3).addClass('hide');

			    	$('#tabs a').eq(1).parent().addClass('active');
					$('#tabs a').eq(0).parent().removeClass('active');
					$('#tabs a').eq(2).parent().removeClass('active');
					$('#tabs a').eq(3).parent().removeClass('active');

					$('#tabsDay'+position+' div').eq(1).append(temp);
				}
				//맛집
				else if(contenttypeid==39){
					$('#category').removeClass('hide');
			    	
			    	var position=sessionStorage.getItem('day_deg');
			    	$('#tabsDay'+position+' div').eq(2).removeClass('hide');
			    	$('#tabsDay'+position+' div').eq(0).addClass('hide');
					$('#tabsDay'+position+' div').eq(1).addClass('hide');
					$('#tabsDay'+position+' div').eq(3).addClass('hide');

			    	$('#tabs a').eq(2).parent().addClass('active');
					$('#tabs a').eq(1).parent().removeClass('active');
					$('#tabs a').eq(0).parent().removeClass('active');
					$('#tabs a').eq(3).parent().removeClass('active');

					$('#tabsDay'+position+' div').eq(2).append(temp);
				}
				//나머지
				else{
					$('#category').removeClass('hide');
			    	
			    	var position=sessionStorage.getItem('day_deg');
			    	$('#tabsDay'+position+' div').eq(3).removeClass('hide');
			    	$('#tabsDay'+position+' div').eq(0).addClass('hide');
					$('#tabsDay'+position+' div').eq(1).addClass('hide');
					$('#tabsDay'+position+' div').eq(2).addClass('hide');

			    	$('#tabs a').eq(3).parent().addClass('active');
					$('#tabs a').eq(1).parent().removeClass('active');
					$('#tabs a').eq(2).parent().removeClass('active');
					$('#tabs a').eq(0).parent().removeClass('active');

					$('#tabsDay'+position+' div').eq(3).append(temp);
				}
				
			}
        });
		
    });
	
	//day div 선택 및 삭제 이벤트
	$(document).on("click","#dayDiv div",function(e){

		//클래스명 deleteDay 영역 안에서만 삭제
		if($(e.target).hasClass('deleteDay')){
			for(var i=$('#dayDiv div').index(this);i<$('#dayDiv div').length;i++){
				var dayNum=$('#dayDiv div').eq(i).find('input[type=hidden]').eq(0).val();
				$('#dayDiv div').eq(i).html('<label>DAY'+i+'</label><button type="button" class="deleteDay">삭제</button><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
			}
			
		var dayNum=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();
		var viewDiv1=$('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val();
		var viewDiv2=$('#dayDiv div').eq($(this).index()-2).find('input[type=hidden]').eq(0).val();
		$('#tabsDay'+dayNum).empty();
		$('#tabsDay'+dayNum).remove();

		$('#dayDiv div').eq($(this).index()-1).remove();

		//보여줄것
		if(viewDiv1!=null){
			$('#tabsDay'+viewDiv1+' div').eq(0).removeClass('hide');
			sessionStorage.setItem('day_deg', viewDiv1);
		}else{
			$('#tabsDay'+viewDiv2+' div').eq(0).removeClass('hide');
			sessionStorage.setItem('day_deg', viewDiv2);
		}

		//셀렉트박스 초기화
		$("#contentTypeId option:eq(0)").prop("selected", true);
		$("#areaCode option:eq(0)").prop("selected", true);
		$("#sigunguCode option:eq(0)").prop("selected", true);
		$('#sigunguCode').html('<option selected="selected" value="">전체</option>');
		$('#locResult').empty();
		
		return;
		}
		
		var dayNum=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();

		sessionStorage.setItem('day_deg', dayNum);
		var position = sessionStorage.getItem('day_deg');

		var lastIdx=$('#dayDiv div').last().find('input[type=hidden]').eq(0).val();

		//모든요소 hide
		for(var i=1;i<=lastIdx;i++){
			$('#tabsDay'+i+' div').eq(0).addClass('hide');
			$('#tabsDay'+i+' div').eq(1).addClass('hide');
			$('#tabsDay'+i+' div').eq(2).addClass('hide');
			$('#tabsDay'+i+' div').eq(3).addClass('hide');
		}
		
		$('#tabsDay'+position+' div').eq(0).removeClass('hide');
		$('#tabs a').eq(0).parent().addClass('active');
		$('#tabs a').eq(1).parent().removeClass('active');
		$('#tabs a').eq(2).parent().removeClass('active');
		$('#tabs a').eq(3).parent().removeClass('active');

		var dayView=$('#dayDiv div>label').eq(position-1).text();
		$('#dayView').text(dayView);
		
	});
    
    //day 추가
	function addDay(){
		var dayMaxNum=$('#dayDiv div').eq($('#dayDiv div').length-1).find('input[type=hidden]').eq(0).val();
		var dayNum=Number(dayMaxNum)+1;
		var length = $('#dayDiv div').length;

		$('#tabsContent').append('<div id="tabsDay'+dayNum+'"><div></div><div></div><div></div><div></div></div>');
		
		$('#dayDiv').append('<div><label>DAY'+(length+1)+'</label><button type="button" class="deleteDay">삭제</button><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
	}

    //내 목록에서 span제거 이벤트
	$(document).on("click","#tabsContent div span",function(e){
		if($(e.target).hasClass('removeLoc')){
			
			var idx=$(this).index();
			var position=sessionStorage.getItem('day_deg');
			var contentTypeIdx=$('#tabs ul').find('li[class=active]').index();

			//span제거
			$($('#tabsDay'+position+' div').eq(contentTypeIdx)).find('span').eq(idx).remove();
			
		}
	});

    
	//저장
    $(document).on("click","#savePlan",function(e){

    	//전송할 전체 데이터
		var savePlan = new Object();
		var plannerCode=document.getElementById('plannerCode').value;
    	
    	//플래너 관리데이터
		savePlan.plan_code=plannerCode;
		savePlan.user_id="tester";
		savePlan.trv_from_date="2019-08-12";
		savePlan.trv_to_date="2019-08-15";

		var planMstArray = new Array();
		var planDtlArray = new Array();
		var size=$('#dayDiv div').length;

		for(var i=0;i<size;i++){
			var planMstChd=new Object();
			
			planMstChd.plan_code=plannerCode;
			planMstChd.trv_deg=i+1;
			planMstArray.push(planMstChd);

			var dayPlanSize1=$($('#tabsContent div').eq(i)).eq(0).find('span').length;
			var dayPlanSize2=$($('#tabsContent div').eq(i)).eq(1).find('span').length;
			var dayPlanSize3=$($('#tabsContent div').eq(i)).eq(2).find('span').length;
			var dayPlanSize4=$($('#tabsContent div').eq(i)).eq(3).find('span').length;
			var dayPlanSize=dayPlanSize1+dayPlanSize2+dayPlanSize3+dayPlanSize4;

			for(var j=0;j<dayPlanSize;j++){
				var planDtlChd = new Object();
				planDtlChd.day_deg=i+1;
				planDtlChd.plan_code=plannerCode;
				planDtlChd.loc_name="서편제";
				planDtlChd.loc_type="12";
				
				planDtlArray.push(planDtlChd);
			}
		}

			savePlan.planMst=planMstArray;
			savePlan.planDtl=planDtlArray;
		
			var sJson = JSON.stringify(savePlan);
			console.log(savePlan);
			console.log(sJson);

    });
</script>

</head>
<body>
    <div id="content">
        <div id="top">
            <div>
	            <label>플래너번호</label>
	            <input type="text" id="plannerCode" name="plannerCode" value="123213"/>
            </div>
            <div id="buttons">
                <button type="button" class="btn btn-success" id="savePlan">저장</button>
                <button type="button" class="btn btn-warning">닫기</button>
            </div>        
        </div>
        <div id="middle">
            <div id="dayDiv">
            	<button type="button" onclick="addDay()">추가</button>
                <div>
                    <label>DAY1</label>
                    <button type="button" class="deleteDay">삭제</button>
                    <input type="hidden" id="dayNum" name="dayNum" value="1"/>
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
                <div id="tabsContent" style="overflow:scroll">
                		<h2><span id="dayView" class="label label-default">DAY1</span></h2>
                	<div id="tabsDay1">
	                    <div>
	                    	<hr style="border-color:gray;width:100%"></hr>
	                    </div>
	                    
	                    <div>
	                   		<hr style="border-color:gray;width:100%"></hr>
	                    </div>
	                    
	                    <div>
	                    	<hr style="border-color:gray;width:100%"></hr>
	                    </div>
	                    
	                    <div>
	                    	<hr style="border-color:gray;width:100%"></hr>
	                    </div>
	               </div>     
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
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                var positions = [
                    
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