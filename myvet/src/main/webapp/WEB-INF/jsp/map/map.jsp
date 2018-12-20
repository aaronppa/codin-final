<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/> 
<script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script> 

<title>Insert title here</title>
<style>
.mapsearchdiv {
	margin-left: 30px;
}

.map {
	width: 620px;
	height: 500px;
	margin-left: 300px;
/* 	margin-top: 150px; */
}

#addr {
	width:250px;
	
}

#resultDiv {
	border: 1px solid black;
	width: 299px;
	height: 462px;
	position:relative;
}

#mapsearchdiv {
	position: absolute;
/* 	top: 150px; */
}

#MapSearchlist{
	postion:absolute;
	height:100%;
	
}

#MapSearchlist >table{
	postion:absolute;
	width:100%;
	text-align:left;
}



.address{
	font-size:15px;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	
	
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=S_tAkybRyVr0rREE6Wvr&submodules=geocoder"></script> 
<!-- <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=omim5fmof6&submodules=geocoder"></script> -->
	
</head>
<body>
	<div>
		<div id="mapsearchdiv">
				<!--<select>
					<option selected value="1">전체검색</option>
					<option value="2">등록병원</option>
					<option value="3">미등록병원</option>
				</select>-->
			<input id="addr">

			<button id="button">검색</button>
			
			<br>
			<div id="resultDiv">
				
				<div id="MapSearchlist">
					<table>
						<tbody>
					
						</tbody>
					</table>
				</div>
				
			</div>

		</div>
		<div id="map" class="map"></div>
	</div>
	<script>
		let centerPositionX=null;
		let centerPositionY=null;
		var mapx;
		var mapy;
		var position;
		var positionData = new Array();
		geoLocation();
		let jsondata;
		let xx=null;
		let yy=null;
		let centerXY;
		let marker=null;
		$("#button").click(function() {
			
			$.ajax({
				url : "<c:url value='/map/ajax.do'/>",
				type : "post",
				dataType : "json",
				data : {
					data : $("#addr").val()
				}
			}).done(function(result) {
			
				MainMap(result[0].mapx, result[0].mapy, result);
			})
		})
		function geoLocation() {
		
			if (navigator.geolocation) {
				
				navigator.geolocation.getCurrentPosition(function(position) {//허용하면 여기옴
					//센터 x
					y = position.coords.latitude;
					//센터 y
					x = position.coords.longitude;
				
					
					$("#map").append(
							"<div valueX='"+x+"' valueY='"+y+"' id='gotoCenter' style='position:absolute;z-index:100;margin-top:0px; margin-left:0px;'><button><img src='/myvet/resources/img/mapmark/goToCenTer.png'/></button>"
									+ "</div>")
					$.ajax({
						url : "<c:url value='/map/mainajax.do'/>",
						type : "post",
						dataType : "json",
						data : {
							x : x,
							y : y
						}
					}).done(function(result) {
				
						for (var i = 0; i < result.length; i++) {
					
							var data = new Object();
							data.number = i;
							data.name = result[i].title;
							data.jibun_address = result[i].address;
							data.x = result[i].mapx;
							data.y = result[i].mapy;
							positionData.push(data);
						}
						jsondata = positionData;
						centerPositionX=x;
						centerPositionY=y;
						MainMap(data.x, data.y, result,x,y);//넘어온 병원 정보를 지도 api에 넘겼음
					}).fail(function(result) {
		
					})

				}, function(error) {
					//console.log(error.code);
		
					switch (error.code) {
					case error.PERMISSION_DENIED:
						
						//위치정보 제동 미동의시 도착;
						$.ajax({
							url : "<c:url value='/map/ajax.do'/>",
							type : "post",
							dataType : "json",
							data : {
								data : "광화문"
							}
						}).done(function(result) {
							for (var i = 0; i < result.length; i++) {
							
								var data = new Object();
								data.number = i;
								data.name = result[i].title;
								data.jibun_address = result[i].address;
								data.x = result[i].mapx;
								data.y = result[i].mapy;
								positionData.push(data);

							}
					
							$("#gotoCenter").css("visibility","hidden");
							
							
				
							MainMap(result[0].mapx, result[0].mapy, result,null,null);//첫번째 매개변수 x값 두번째 매개변수 y값 , --> 중심좌표 , result 데이터의 갯수
							//    	console.log("성공"+result);
							
						
						}).fail(function(result) {
							//    	console.log("실패"+result);//여기서 막힘 하아
						});

						//여기서부터 작업
						break;
					case error.UNKNOWN_ERROR://console.log("알수없음 에러");
						break;
					}

				}, {
					enableHighAccuracy : true,
					maximumAge : 0
				})

			} else {
				console.log('위치정보 접근 불가');
			}
		}
		
		
		
		let myaddr=null;
		let centerX=xx;
		let centerY=yy;
		let infowindow =null
	
		function MainMap(x, y, jsondata,xx,yy) {//x,y는 중심점 , jsondata는 병원 좌표
			
		
				
						$("#MapSearchlist >table > tbody").empty();//동적인 태그 생성
						for(let k = 0 ;  k < jsondata.length; k ++){
							if(jsondata[k].hosRegister == 'N'){
								$("#MapSearchlist >table > tbody").append(
									
										"<tr class='mapSearchResult' style='height:80px;' value1='"+jsondata[k].mapx+"' value2='"+jsondata[k].mapy+"'><td class='"+(k+1)+"td'><img src='/myvet/resources/img/mapmark/RedFolder/redMarker"+String.fromCharCode(65+k)+".png'/><strong>"+jsondata[k].title +"</strong><br><span class='address'>"+jsondata[k].roadAddress+"</span></td>"
										+"</tr>"
										)
								
								
							}else{
								$("#MapSearchlist >table > tbody").append(
										
										"<tr class='mapSearchResult' style='height:80px;' value1='"+jsondata[k].mapx+"' value2='"+jsondata[k].mapy+"' ><td class='"+(k+1)+"td'><img src='/myvet/resources/img/mapmark/blueFolder/blueMarker"+String.fromCharCode(65+k)+".png'/><strong>"+jsondata[k].title +"</strong><span class='address'><br>"+jsondata[k].roadAddress+"</span></td>"
										+"</tr>"
										)
								
							}
						}
			
		
			
			//console.log(jsondata.length);
			var map = new naver.maps.Map('map');
			var myaddress = '불정로 6';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
			naver.maps.Service
					.geocode(
							{
								address : myaddress
							},
							function(status, response) {
								if (status !== naver.maps.Service.Status.OK) {
									return alert(myaddress
											+ '의 검색 결과가 없거나 기타 네트워크 에러');
								}
								let result = response.result;
							
								

							centerXY = new naver.maps.Point(x, y);
							map.setCenter(centerXY);						
							let clickResult = jsondata;
							$(".mapSearchResult").click(function(e){
								let resultX=$(this).attr("value1");//x값
								let resultY=$(this).attr("value2");//y주소값
							
								$.ajax({
									url:"map/Centerajax.do",
									type:"post",
									data:{x:$(this).attr("value1"), y:$(this).attr("value2")}
								}).done(function(result){
					
									centerXY = new naver.maps.Point(resultX, resultY);
									map.setCenter(centerXY);
									myaddr = new naver.maps.Point(centerPositionX, centerPositionY);//마커중심 좌표 설정(현재위치)
									
									marker = new naver.maps.Marker(
											{
												position : myaddr,
												icon : {
													url : '/myvet/resources/img/mapmark/blackIcon.gif'
												},
												title : '중심좌표',
												map : map
											});
									naver.maps.Event.addListener(marker, "click",
											function(e) {
												
												alert("중심좌표입니다");
											});
			
									map.setCenter(centerXY); // 검색된 좌표로 지도 이동

								}).fail(function(result){
									console.log("실패")
								})
							})
							
							$("#gotoCenter").click(function(e){
								
								centerXY = new naver.maps.Point(x, y);
								let resultCenterX=$(this).attr("valuex");
								let resultCenterY=$(this).attr("valuey");
								
								$.ajax({
									url:"map/Centerajax.do",
									type:"post",
									data:{x:$(this).attr("valuex"), y:$(this).attr("valuey")}
								}).done(function(result){
							
									
									
									centerXY = new naver.maps.Point(resultCenterX, resultCenterY);
									map.setCenter(centerXY);
									myaddr = new naver.maps.Point(resultCenterX, resultCenterY);//마커중심 좌표 설정(현재위치)
									
									marker = new naver.maps.Marker(
											{
												position : myaddr,
												icon : {
													url : '/myvet/resources/img/mapmark/blackIcon.gif'
												},
												title : '중심좌표',
												map : map
											});
									naver.maps.Event.addListener(marker, "click",
											function(e) {
					
												alert("중심좌표입니다");
											});
									map.setCenter(centerXY); // 검색된 좌표로 지도 이동	
								}).fail(function(result){
									console.log("실패")
								})
							})
		
								myaddr = new naver.maps.Point(centerPositionX, centerPositionY);//마커중심 좌표 설정(현재위치)
								
								marker = new naver.maps.Marker(
										{
											position : myaddr,
											icon : {
												url : '/myvet/resources/img/mapmark/blackIcon.gif'
											},
											title : '중심좌표',
											map : map
										});
								naver.maps.Event.addListener(marker, "click",
										function(e) {
									
											alert("중심좌표입니다");
										});
						
								map.setCenter(centerXY); // 검색된 좌표로 지도 이동
								hosaddr = new naver.maps.Point(x, y);//마커중심 좌표 설정(현재위치)
								

								let jsonDData = jsondata;

								let MarkerClicklist = new Array();
					
								//병원의 마크점 생성
								
									for (let k = 0; k < jsondata.length; k++) {
	
										let hosmarker = null;
										let hosaddr = null;
										if (jsondata[k].hosRegister == "N") { //if 조건에 따른 마크점 분기 완료
	
											hosaddr = new naver.maps.Point(
													jsondata[k].mapx,
													jsondata[k].mapy);
											hosmarker = new naver.maps.Marker(
													{
														position : hosaddr,
														map : map,
														title : jsondata[k].title,
														icon : {
															url : '/myvet/resources/img/mapmark/RedFolder/redMarker'
																	+ String
																			.fromCharCode(65 + k)
																	+ '.png'
														}
													});
	
										} else {
											
				
											
											hosaddr = new naver.maps.Point(
													jsondata[k].mapx,
													jsondata[k].mapy);
											hosmarker = new naver.maps.Marker(
													{
														position : hosaddr,
														map : map,
														title : jsondata[k].title,
														icon : {
															url : '/myvet/resources/img/mapmark/blueFolder/blueMarker'
																	+ String
																			.fromCharCode(65 + k)
																	+ '.png'
														}
													});
											
	
										}//if-else
									//console.log(hosmarker);
									MarkerClicklist[k] = hosmarker;
								/* 	console.log(MarkerClicklist[k])
									console.log(MarkerClicklist[k].title);
									console.log(jsondata[k].title); */
							/* 		console.log(k);
									 infowindow = new naver.maps.InfoWindow(
												{

													content : "<a href='<c:url value='/hos/hospital.do?hosCode="
															+jsondata[k].hosCode
													
															+"'/>'>"
															+'<span ><strong>'
															+ MarkerClicklist[k].title
															+ "</strong><span>"
															+ "</a>"
												}
										);				
					 */
						 
					
						//마크점 클릭시 나오는 action의 분기
				
						if (jsondata[k].hosRegister == "N") {
							naver.maps.Event
									.addListener(
											MarkerClicklist[k],
											"click",
											function(e) {

												swal("\""+jsondata[k].title
														+ "\"은 등록되지 않은 병원입니다.");
											});
						} else {
						//	console.log(k);
							//
							naver.maps.Event
									.addListener(
											MarkerClicklist[k],
											"click",
											function(e) {

											/* 	if (infowindow.getMap()) {
													infowindow.close();
													console.log("클릭"+jsondata[k].title);
												} else {
													console.log("큼");
													console.log("클릭"+jsondata[k].title);
													infowindow.open(map,MarkerClicklist[k]);
													//infowindow.open(map,jsondata[k].title);
												} */
												var userId = '${user.memberNickname}';
												if(userId.length == 0 ){
													//alert("로그인이 되어 있지 않습니다.")
													swal('로그인 후 이용해주세요!');
												}else{
													swal({
														title:jsondata[k].title+" 페이지로 이동하시겠습니까?",
														html:"<a href=\"<c:url value='/hos/hospital.do?hosCode="+jsondata[k].hosCode+"'/>\">"+jsondata[k].title+" 병원 페이지로 이동</a>"
													});
											
												}
												
											});
									/* console.log('--------------');
									console.log(k);
									console.log(Ma rkerClicklist[k].title);*/
							
						}

					/* 	let hosInfo = new naver.maps.InfoWindow({
							content : '<p>등록되지 않은 병원입니다.</p>'
									+ hosmarker

						}); */

						}//for

							
					});
			
		}


								
			
	</script>
</body>

</html>