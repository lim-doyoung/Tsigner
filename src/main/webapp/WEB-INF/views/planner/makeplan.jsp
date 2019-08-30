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

        //���� day���� ���� : 1
    	sessionStorage.setItem('day_deg', '1');

		//������ �� Ŭ��
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

		//���� �� Ŭ��
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

		//���� �� Ŭ��
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

        //���� �� Ŭ��
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


        //�˻���ư Ŭ�� �̺�Ʈ
        $('#searchPlace').click(function(){
			
			if(document.getElementById('contentTypeId').value==null || document.getElementById('contentTypeId').value==''){
				alert('���þ�����');
				return false;
			}

			//�˻���� ���� ����
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
									
				
								//���� �ٽúҷ���
								
								//�߽���ǥ����
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

    
    //��Ҽ��� ����̽� Ŭ�� �̺�Ʈ
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
				var zipcode=dataVal.zipcode;	//�����ȣ

				console.log(contentid);			//�ʿ����
				console.log(contenttypeid);		//����
				console.log(addr1);				//��
				console.log(firstimage);		//��
				console.log(homepage);			//������
				console.log(mapx+','+mapy);		//����
				console.log(overview);			//������
				console.log(tel);				//��
				console.log(title);				//��
				console.log(zipcode);			//��

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
				
				//������
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
				//����
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
				//����
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
				//������
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
	
	//day div ���� �� ���� �̺�Ʈ
	$(document).on("click","#dayDiv div",function(e){

		//Ŭ������ deleteDay ���� �ȿ����� ����
		if($(e.target).hasClass('deleteDay')){
			for(var i=$('#dayDiv div').index(this);i<$('#dayDiv div').length;i++){
				var dayNum=$('#dayDiv div').eq(i).find('input[type=hidden]').eq(0).val();
				$('#dayDiv div').eq(i).html('<label>DAY'+i+'</label><button type="button" class="deleteDay">����</button><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
			}
			
		var dayNum=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();
		var viewDiv1=$('#dayDiv div').eq($(this).index()).find('input[type=hidden]').eq(0).val();
		var viewDiv2=$('#dayDiv div').eq($(this).index()-2).find('input[type=hidden]').eq(0).val();
		$('#tabsDay'+dayNum).empty();
		$('#tabsDay'+dayNum).remove();

		$('#dayDiv div').eq($(this).index()-1).remove();

		//�����ٰ�
		if(viewDiv1!=null){
			$('#tabsDay'+viewDiv1+' div').eq(0).removeClass('hide');
			sessionStorage.setItem('day_deg', viewDiv1);
		}else{
			$('#tabsDay'+viewDiv2+' div').eq(0).removeClass('hide');
			sessionStorage.setItem('day_deg', viewDiv2);
		}

		//����Ʈ�ڽ� �ʱ�ȭ
		$("#contentTypeId option:eq(0)").prop("selected", true);
		$("#areaCode option:eq(0)").prop("selected", true);
		$("#sigunguCode option:eq(0)").prop("selected", true);
		$('#sigunguCode').html('<option selected="selected" value="">��ü</option>');
		$('#locResult').empty();
		
		return;
		}
		
		var dayNum=$('#dayDiv div').eq($(this).index()-1).find('input[type=hidden]').eq(0).val();

		sessionStorage.setItem('day_deg', dayNum);
		var position = sessionStorage.getItem('day_deg');

		var lastIdx=$('#dayDiv div').last().find('input[type=hidden]').eq(0).val();

		//����� hide
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
    
    //day �߰�
	function addDay(){
		var dayMaxNum=$('#dayDiv div').eq($('#dayDiv div').length-1).find('input[type=hidden]').eq(0).val();
		var dayNum=Number(dayMaxNum)+1;
		var length = $('#dayDiv div').length;

		$('#tabsContent').append('<div id="tabsDay'+dayNum+'"><div></div><div></div><div></div><div></div></div>');
		
		$('#dayDiv').append('<div><label>DAY'+(length+1)+'</label><button type="button" class="deleteDay">����</button><input type="hidden" id="dayNum" name="dayNum" value="'+dayNum+'"/></div>');
	}

    //�� ��Ͽ��� span���� �̺�Ʈ
	$(document).on("click","#tabsContent div span",function(e){
		if($(e.target).hasClass('removeLoc')){
			
			var idx=$(this).index();
			var position=sessionStorage.getItem('day_deg');
			var contentTypeIdx=$('#tabs ul').find('li[class=active]').index();

			//span����
			$($('#tabsDay'+position+' div').eq(contentTypeIdx)).find('span').eq(idx).remove();
			
		}
	});

    
	//����
    $(document).on("click","#savePlan",function(e){

    	//������ ��ü ������
		var savePlan = new Object();
		var plannerCode=document.getElementById('plannerCode').value;
    	
    	//�÷��� ����������
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
				planDtlChd.loc_name="������";
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
	            <label>�÷��ʹ�ȣ</label>
	            <input type="text" id="plannerCode" name="plannerCode" value="123213"/>
            </div>
            <div id="buttons">
                <button type="button" class="btn btn-success" id="savePlan">����</button>
                <button type="button" class="btn btn-warning">�ݱ�</button>
            </div>        
        </div>
        <div id="middle">
            <div id="dayDiv">
            	<button type="button" onclick="addDay()">�߰�</button>
                <div>
                    <label>DAY1</label>
                    <button type="button" class="deleteDay">����</button>
                    <input type="hidden" id="dayNum" name="dayNum" value="1"/>
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
   
                var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
                        level: 3 // ������ Ȯ�� ����
                    };

                // ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
                var map = new kakao.maps.Map(mapContainer, mapOption); 
                var positions = [
                    
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