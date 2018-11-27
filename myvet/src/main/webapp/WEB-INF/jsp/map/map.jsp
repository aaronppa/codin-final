<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.map {
	border: 1px solid black;
	width: 50%;
	height: 600px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=S_tAkybRyVr0rREE6Wvr&submodules=geocoder"></script>
</head>
<body>
	<div>

		<input id="addr">

		<button id="button">검색</button>

		<div id="map" class="map"></div>
	</div>
	<script>
		
	
	  	var mapx;
	    var mapy;
	    var position;
		var positionData = new Array();
	    geoLocation();
	    var jsondata;
	    
	    
	    $("#button").click(function(){
	    //	console.log($("#addr").val());
	    	$.ajax({
	    		url:"<c:url value='/map/ajax.do'/>",
	    		type:"post",
	    		dataType:"json",
	    		data:{data:$("#addr").val()}
	    	}).done(function(result){
	    	//	alert(result[0].mapx,result[0].mapy);
	    		//console.log("성공");
	    	//	alert(result.length);
	    		MainMap(result[0].mapx,result[0].mapy,result);
	    	})
	    })
	    function geoLocation(){
		
	    	
	    	
	        if(navigator.geolocation){
	    
	            navigator.geolocation.getCurrentPosition(function(position){//허용하면 여기옴
	         
	                y=position.coords.latitude;
	                x=position.coords.longitude;
	               //console.log(position.coords.latitude+"  "+position.coords.longitude);
	      	//		console.log("허용");
	      	//		console.log(x,y);
	      			$.ajax({
	      				url:"<c:url value='/map/mainajax.do'/>",
	      				type:"post",
	      				dataType:"json",
	      				data:{x : x, y : y}
	      			}).done(function(result){
	      			//	console.log(result);
	      			//	console.log("됨");
	      			//	console.log(x);		console.log(y);//위치정보 제공시의 중심점
	      				//MainMap(x,y);
	      				
	      				for(var i =0 ; i < result.length;i++){
	      					//console.log(result[i]);
	      					//console.log(result[i].title);
	      					//console.log(result[i].address);
	      					//console.log(result[i].mapx);
	      					//console.log(result[i].mapy);
	      					var data = new Object();
	      					data.number = i;
	      					data.name=result[i].title;
	      					data.jibun_address=result[i].address;
	      					data.x = result[i].mapx;
	      					data.y=result[i].mapy;
	      					positionData.push(data);
	      				}
	      				 jsondata = positionData;
	      				MainMap(x,y,result);//넘어온 병원 정보를 지도 api에 넘겼음
	      			}).fail(function(result){
	      			//	console.log("안됨");
	      			//	console.log(result);
	      			})
	      			
	      			
	            },function(error){
	                //console.log(error.code);
	                switch(error.code){
	                    case error.PERMISSION_DENIED:
	                    	//console.log("위치정보 제공 x");
	                    
	                    $.ajax({
	                    	url:"<c:url value='/map/ajax.do'/>",
	                    	type:"post",
	                    	dataType:"json",
	                    	data:{data:"광화문"}
	                    }).done(function(result){
	                    	for(var i =0 ; i < result.length;i++){
	                    	//	console.log("뽀");
		      					//console.log(result[i]);
		      				//	console.log(result[i].address);
		      				//	console.log(result[i].roadAddress);
		      				//	console.log(result[i].mapy);
		      				//	console.log(result[i].mapx);
		      					var data = new Object();
		      					data.number = i;
		      					data.name=result[i].title;
		      					data.jibun_address=result[i].address;
		      					data.x = result[i].mapx;
		      					data.y=result[i].mapy;
		      					positionData.push(data);
		      					
		      				}
	                    	MainMap(result[0].mapx,result[0].mapy,result);
	                //    	console.log("성공"+result);
	                    }).fail(function(result){
	                //    	console.log("실패"+result);//여기서 막힘 하아
	                    });
	                    
	                    
	                    //여기서부터 작업
	                    break;
	                    case error.UNKNOWN_ERROR://console.log("알수없음 에러");
	                    break;
	                }
	             
	            },{
	                enableHighAccuracy:true,
	                maximumAge:0,                
	            })
	            
	        }else{
	          console.log('위치정보 접근 불가');
	        }
	    }
	   
   		
	
	    
		function MainMap(x,y,jsondata){//x,y는 중심점 , jsondata는 병원 좌표
			//console.log(jsondata);
			//console.log(jsondata.length);
			//console.log(jsondata[0].name);
			//console.log("MaisdfsdfsdfsdsfnMap" + jsondata);
			//console.log(jsondata.length);
		    var map = new naver.maps.Map('map');
		      var myaddress = '불정로 6';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		          if (status !== naver.maps.Service.Status.OK) {
		              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		          }
		          var result = response.result;
		          // 검색 결과 갯수: result.total
		          // 첫번째 결과 결과 주소: result.items[0].address
		          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		        //  var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		          var myaddr = new naver.maps.Point(x,y);//마커
		          
		          
		          var centerXY = new naver.maps.Point(x,y);//중심점으로 이동
		          map.setCenter(centerXY); // 검색된 좌표로 지도 이동
		          
		      //    console.log(myaddr);
		          
		       // 마커 표시
		          var marker = new naver.maps.Marker({
		            position: myaddr,
		            icon: {  				    	
					       url:'/myvet/resources/img/mapmark/blackIcon.gif'
					    },
		            title:'중심좌표',
		            map: map
		          });
		          naver.maps.Event.addListener(marker, "click", function(e) {
			            if (infowindow.getMap()) {
			                infowindow.close();
			            } else {
			                infowindow.open(map, marker);
			            }
			       });
		       		//   /map/mapunrigi.do
		          //console.log(jsondata);
		          
		 /*          $.ajax({
		        	  url:"<c:url value='/map/mapUnregi.do'/>",
		        	  type:'post',
		        	  dataType:"json",
		        	  data:{HosBasic:jsondata}
		          }).done(function(result){
		        	  for(var r=0; r < result.length; r++){
		        		  var hosaddr = new naver.maps.Point(result[r].mapx,result[r].mapy);
		        		  var hosmarker = new naver.maps.Marker({
								position:hosaddr,
								map:map,
								title:jsondata[r].title,
							    icon: {  				    	
							       url:'/myvet/resources/img/mapmark/KakaoTalk20181125194810379.gif'
							    }
							});
							  naver.maps.Event.addListener(hosmarker, "click", function(e) {
						            if (infowindow.getMap()) {
						                infowindow.close();
						            } else {
						                infowindow.open(map, hosmarker);
						            }
						       });
							
							var hosInfo = new naver.maps.InfoWindow({
								content:'<p>ㅇㅇ</p>'
							});
		        	  }
		          }).fail(function(result){
		        	  console.log(result);
		        	  console.log("실패");
		          }) */
		          
		          
		          
		          
		          
		          
		          
		          
		          console.log(jsondata);
		 		//  console.log(jsondata.length);
		         console.log("개꿀띠"+jsondata[0]);
		          //병원의 마크점 생성
		          for(var k = 0 ; k < jsondata.length; k ++){
		        	  
		        	  console.log("dd::"+jsondata[0]);
        	  	
		        	  if(MarkLog(jsondata[k])==null){
		        		  console.log("요기냐");
		        	  }else{
		        		  console.log("조기냐");
		        	  };
		        
		        	 // 	console.log("됨"+k);
						//console.log(jsondata[k].title);
						//console.log(jsondata[k].mapx);
						//console.log(jsondata[k].mapy);
					//	console.log("끵!");
						//CheckingMark(jsondata);
						//console.log("끵1");
						//console.log(jsondata[0]);
						//console.log("긩3");
						//console.log("if != null;");
					
						var hosaddr = new naver.maps.Point(jsondata[k].mapx,jsondata[k].mapy);
						var hosmarker = new naver.maps.Marker({
							position:hosaddr,
							map:map,
							title:jsondata[k].title,
						    icon: {  				    	
						       url:'/myvet/resources/img/mapmark/KakaoTalk20181125194810379.gif'
						    }
						});
						  naver.maps.Event.addListener(hosmarker, "click", function(e) {
							  alert("등록되지 않은 병원입니다.");
					            if (infowindow.getMap()) {
					                infowindow.close();
					            } else {
					                infowindow.open(map, hosmarker);
					            }
					       });
						
						var hosInfo = new naver.maps.InfoWindow({
							content:'<p>등록되지 않은 병원입니다.</p>'
							
							
							
						}); 
						//console.log("므아?");
					
					}//개별 병원의 마커
		          // 마커 클릭 이벤트 처리
		        
		          // 마크 클릭시 인포윈도우 오픈
		          var infowindow = new naver.maps.InfoWindow({
		        	  
		        	  
		        	  
		              content: '<p>중심점</p>'
		          });
		      });
		 	    
		}
    	
		function MarkLog(data){
			  $.ajax({
        		  url:"<c:url value='/map/mapUnregi.do'/>",
        		  type:"post",
        		  data:{HosBasic:data},
        		  dataType:"json"
        	  }).done(function(result){
        		  console.log("성공");
        	  }).fail(function(result){
        		  console.log(result);
        		  console.log("실패");
        	  })
		}

   
      </script>
</html>