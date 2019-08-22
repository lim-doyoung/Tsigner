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
        //�˻���ư Ŭ�� �̺�Ʈ
        $('#searchPlace').click(function(){
			
			if(document.getElementById('contentTypeId').value==null || document.getElementById('contentTypeId').value==''){
				alert('���þ�����');
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
									
				
								//���� �ٽúҷ���
								
								//�߽���ǥ����
								var xPosition,yPosition;
								if(document.getElementById('areaCode').value==1){
									xPosition=37.5611283;
									yPosition=126.9795475;
								}
								
								
								
		
				                var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
				                    mapOption = { 
				                        center: new kakao.maps.LatLng(xPosition, yPosition), // ������ �߽���ǥ
				                        level: 9 // ������ Ȯ�� ����
				                    };
		
				                // ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
				                var map = new kakao.maps.Map(mapContainer, mapOption); 

								// ������ ǥ�õ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�							
								var markers = [];

		
								// ��Ŀ�� �����ϰ� �������� ǥ���ϴ� �Լ��Դϴ�
								function addMarker(position) {
    
								    // ��Ŀ�� �����մϴ�
								    var marker = new kakao.maps.Marker({
								        position: position
								    });
								
								    // ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
								    marker.setMap(map);
								    
								    // ������ ��Ŀ�� �迭�� �߰��մϴ�
								    markers.push(marker);
								}

								for(var i=0;i<dataArray.length;i++){
									addMarker(new kakao.maps.LatLng(dataArray[i].mapy, dataArray[i].mapx));
								}
		
				                
		
				                    // ��Ŀ �̹����� �̹��� �ּ��Դϴ�
				                    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
				                    for (var i = 0; i < positions.length; i ++) {
		
				                        // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
				                        var imageSize = new kakao.maps.Size(24, 35); 
		
				                        // ��Ŀ �̹����� �����մϴ�    
				                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
				                        // ��Ŀ�� �����մϴ�
				                        var marker = new kakao.maps.Marker({
				                            map: map, // ��Ŀ�� ǥ���� ����
				                            position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
				                            title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
				                            image : markerImage // ��Ŀ �̹��� 
				                        });
				                    }
						}
					}else{
						$('#locResult').html('�˻������ �����ϴ�');

					}

				}
			});
        });

		$('#areaCode').change(function(){

			if(document.getElementById('areaCode').value!=''){
			//��,��,�� �ڵ� ����
				$.ajax({
					url:"search/areacode",
					data:{areaCode:document.getElementById('areaCode').value},
					method:"GET",
					dataType:"json"
				}).done(function(data){

					var input='<option value="">��ü</option>';
					for(var i=0;i<data.length;i++){
						input+='<option value="'+data[i].sigungu_code+'">'+data[i].loc_dtl_name+'</option>';
					}
					$('#sigunguCode').html(input);
					
				});
			}else{
				$('#sigunguCode').html('<option value="">��ü</option>');
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
                <button type="button" class="btn btn-success">����</button>
                <button type="button" class="btn btn-warning">�ݱ�</button>
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
                
                	<!-- ��ұ��� -->
                	<select id="contentTypeId" name="contentTypeId" class="form-control">
                    	<option selected="selected" value="">����</option>
                        <option value="12">������</option>
                        <option value="32">����</option>
                        <option value="39">����</option>
                    </select>
                
               		<!-- �����ڵ� - Ư����,������,�� -->
                    <select id="areaCode" name="areaCode" class="form-control">
                    	<option selected="selected" value="">��ü</option>
                        <option value="32">����</option>
                        <option value="31">���</option>
                        <option value="35">���</option>
                        <option value="36">�泲</option>
                        <option value="5">����</option>
                        <option value="4">�뱸</option>
                        <option value="3">����</option>
                        <option value="6">�λ�</option>
                        <option value="1">����</option>
                        <option value="8">����</option>
                        <option value="7">���</option>
                        <option value="2">��õ</option>
                        <option value="37">����</option>
                        <option value="38">����</option>
                        <option value="39">����</option>
                        <option value="33">���</option>
                        <option value="34">�泲</option>
                    </select>
                    
                    <!-- ��,��,�� �ڵ� -->
                    <select id="sigunguCode" name="sigunguCode" class="form-control">
                    	<option selected="selected" value="">��ü</option>
                    </select>
                    
                    <input type="text" id="keyword" name="keyword"/>
                    <button type="button" id="searchPlace">�˻�</button>
                    
                <button type="button" id="a">��Ҽ���</button>
                    <div id="locResult">
                    	
                    </div>    
                
            </div>
            
            <div id="category" class="hide">
                <div id="tabs">
				    <ul class="nav nav-pills">
				        <li role="presentation" class="active"><a href="#">������</a></li>
				        <li role="presentation"><a href="#">����</a></li>
				        <li role="presentation"><a href="#">����</a></li>
				        <li role="presentation"><a href="#">����</a></li>
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
   
                var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(xPosition, yPosition), // ������ �߽���ǥ
                        level: 3 // ������ Ȯ�� ����
                    };

                // ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                var positions = [
                        {
                            title: '�溹��', 
                            latlng: new kakao.maps.LatLng(37.5788222356, 126.9769930325)
                        },
                        {
                            title: '�溹�ÿ�', 
                            latlng: new kakao.maps.LatLng(37.5758422, 126.9713913)
                        },
                        {
                            title: '���������', 
                            latlng: new kakao.maps.LatLng(37.5762653, 126.9737248)
                        },
                        {
                            title: '�ڿ��պ���',
                            latlng: new kakao.maps.LatLng(37.5767159, 126.9736068)
                        }
                    ];

                    // ��Ŀ �̹����� �̹��� �ּ��Դϴ�
                    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

                    for (var i = 0; i < positions.length; i ++) {

                        // ��Ŀ �̹����� �̹��� ũ�� �Դϴ�
                        var imageSize = new kakao.maps.Size(24, 35); 

                        // ��Ŀ �̹����� �����մϴ�    
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

                        // ��Ŀ�� �����մϴ�
                        var marker = new kakao.maps.Marker({
                            map: map, // ��Ŀ�� ǥ���� ����
                            position: positions[i].latlng, // ��Ŀ�� ǥ���� ��ġ
                            title : positions[i].title, // ��Ŀ�� Ÿ��Ʋ, ��Ŀ�� ���콺�� �ø��� Ÿ��Ʋ�� ǥ�õ˴ϴ�
                            image : markerImage // ��Ŀ �̹��� 
                        });
                    }    
                </script>
            </div>
        </div>
    </div>
</body>
</html>