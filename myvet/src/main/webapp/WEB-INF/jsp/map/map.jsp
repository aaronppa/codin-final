<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	width: 249px;
}

#resultDiv {
	border: 1px solid black;
	width: 299px;
	height: 473.8px;
	position:relative;
}

#mapsearchdiv {
	position: absolute;
/* 	top: 150px; */
}

#MapSearchlist{
	postion:absolute;
}

#MapSearchlist >table{
	postion:absolute;
	width:100%;
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
				<div style="border:red 1px solid;position:absolute; bottom:0px;width:100%;">페이징 디아브</div>
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
				//	alert(result[0].mapx,result[0].mapy);
				//console.log("성공");
				//	alert(result.length);
				MainMap(result[0].mapx, result[0].mapy, result);
			})
		})
		function geoLocation() {
			console.log("geoLocation 진입");
			if (navigator.geolocation) {
				console.log(navigator.geolocation);
				console.log("if geoLocation 진입");
				console.log(position);
				navigator.geolocation.getCurrentPosition(function(position) {//허용하면 여기옴
					console.log("위치정보 허용 요기옴");
					y = position.coords.latitude;
					x = position.coords.longitude;
					//console.log(position.coords.latitude+"  "+position.coords.longitude);
					//		console.log("허용");
					//		console.log(x,y);
					console.log("센터 x"+x);
					console.log("센터 y"+y);
					$.ajax({
						url : "<c:url value='/map/mainajax.do'/>",
						type : "post",
						dataType : "json",
						data : {
							x : x,
							y : y
						}
					}).done(function(result) {
						//	console.log(result);
						//	console.log("됨");
						//	console.log(x);		console.log(y);//위치정보 제공시의 중심점
						//MainMap(x,y);
						
						
						
						console.log("ajax 통신성공");
						for (var i = 0; i < result.length; i++) {
							//console.log(result[i]);
							//console.log(result[i].title);
							//console.log(result[i].address);
							//console.log(result[i].mapx);
							//console.log(result[i].mapy);
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
						//	console.log("안됨");
						//	console.log(result);
					})

				}, function(error) {
					//console.log(error.code);
					console.log("에러코드"+error);
					switch (error.code) {
					case error.PERMISSION_DENIED:
						//console.log("위치정보 제공 x");
						console.log("요기옴");
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
							
							
							
							
							// 아 왜 안되는거야 ㅡㅡ^;
							$("#gotoCenter").css("visibility","hidden");
							
							
							// 아 왜 안되는거야 ㅡㅡ^;
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
		console.log("호이쨔:"+jsondata);
		function MainMap(x, y, jsondata,xx,yy) {//x,y는 중심점 , jsondata는 병원 좌표
			
			console.log("x:"+x);
			console.log("y:"+y);
			console.log("xx:"+xx);
			console.log("yy:"+yy);
			
			console.log(jsondata);
			$("#MapSearchlist >table > tbody").empty();//동적인 태그 생성
			for(let k = 0 ;  k < jsondata.length; k ++){
				if(jsondata[k].hosRegister == 'N'){
					$("#MapSearchlist >table > tbody").append(
						
							"<tr class='mapSearchResult'><td class='"+(k+1)+"td'><img src='/myvet/resources/img/mapmark/RedFolder/redMarker"+String.fromCharCode(65+k)+".png'/><strong>"+jsondata[k].title +"</strong></td><tr/><tr><td class='"+(k+1)+"td'>"+jsondata[k].roadAddress+"</td></tr>"		
							)
							$("#MapSearchlist > table > tbody> tr > ."+(k+1)+"td").on("click",function(e){
				
						
						//alert("클릭");
						xx=jsondata[k].mapx;
						yy=jsondata[k].mapy;
						MainMap(xx, yy, jsondata);
					})
					
					
				}else{
					$("#MapSearchlist >table > tbody").append(
							
							"<tr class='mapSearchResult'><td class='"+(k+1)+"td'><img src='/myvet/resources/img/mapmark/blueFolder/blueMarker"+String.fromCharCode(65+k)+".png'/><strong>"+jsondata[k].title +"</strong></td><tr/><tr><td class='"+(k+1)+"td'>"+jsondata[k].roadAddress+"</td></tr>"		
							)
							$("#MapSearchlist > table > tbody> tr > ."+(k+1)+"td").on("click",function(e){
				
						
						//alert("클릭");
						xx=jsondata[k].mapx;
						yy=jsondata[k].mapy;
						
						
						MainMap(xx, yy, jsondata);
						
					})
				
					
				}
			}
			

			
			
		/* 	$("#gotoCenter").click(function(e){
				console.log("클릭");
				console.log(x);
				console.log(y);
				xx=centerX;
				yy=centerY;
				MainMap(xx, yy);
				//MainMap(xx, yy, jsondata);
			})
			 */
		
			
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
								// 검색 결과 갯수: result.total
								// 첫번째 결과 결과 주소: result.items[0].address
								// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
								//  var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
								
										
								
			
		
								
							
							//	console.log(x);
							//	console.log(y);
							//	console.log("273:"+xx);
						//		console.log(yy);
								
							

							
								

							
								
								

							//	if (xx == null && yy == null) {
									//console.log("sdfghif")
									centerXY = new naver.maps.Point(x, y);//중심점으로 이동
							/* 	} else {
									console.log("else");
									centerXY = new naver.maps.Point(xx, yy);
								} */
							
								
								//-----------------------------------------------------------------------------
								
								//여기서부터 작업핡서
							if(centerPositionX != null && centerPositionY != null){
								console.log("fififififififi")
								map.setCenter(centerXY); // 검색된 좌표로 지도 이동

								//    console.log(myaddr);

								// 마커 표시
								
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
											/* 	if (infowindow.getMap()) {
													infowindow.close();
												} else {
													infowindow.open(map, marker);
												} */
											alert("중심좌표입니다");
										});
							}else{
								console.log("elelelelelelele")
								map.setCenter(centerXY); // 검색된 좌표로 지도 이동

								//    console.log(myaddr);

								// 마커 표시
								
								hosaddr = new naver.maps.Point(x, y);//마커중심 좌표 설정(현재위치)
								
							
							}
								
								
								
								
								
								
								
								let MarkerClicklist = new Array();

								//병원의 마크점 생성
								for (let k = 0; k < jsondata.length; k++) {

								/* 	console
											.log("ddd:::"
													+ '/myvet/resources/img/mapmark/blueFolder/blueMarker'
													+ String
															.fromCharCode(65 + k) */	
											//	+ '.png');
									//if(jsondata[k] == null)continue;//서강대로 검색시 null값이 있음
									//console.dir(jsondata[k]);

									//console.dir("ddd:"
									//		+ jsondata[k].hosRegister);
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
									MarkerClicklist[k] = hosmarker;

									//	console.log(jsondata[k].title);

									let infowindow = new naver.maps.InfoWindow(
											{

												content : '<p>병원이름:'
														+ jsondata[k].title
														+ "</p>'<a href='<c:url value='/hos/hospital.do?hosCode="
														+jsondata[k].hosCode
														+"&memberNo="
														+${user.memberNo}
														+"'/>'>"
														+ "동물병원 찾기 페이지로 이동" 
														+ "</a>"
											});

									//마크점 클릭시 나오는 action의 분기
									if (jsondata[k].hosRegister == "N") {
										naver.maps.Event
												.addListener(
														MarkerClicklist[k],
														"click",
														function(e) {

															alert("병원 이름:"
																	+ jsondata[k].title
																	+ "은 등록되지 않은 병원입니다.");
														});
									} else {
										naver.maps.Event
												.addListener(
														MarkerClicklist[k],
														"click",
														function(e) {

															if (infowindow
																	.getMap()) {
																infowindow
																		.close();
															} else {
																infowindow
																		.open(
																				map,
																				MarkerClicklist[k]);
															}
														});
									}

									let hosInfo = new naver.maps.InfoWindow({
										content : '<p>등록되지 않은 병원입니다.</p>'
												+ hosmarker

									});

								}//for

							//	console.log("374번 줄 " + jsondata);
							//	console.log(jsondata);
								/* 	
										 
									}*/
							});

		}

		$("#map").append(
						"<div id='gotoCenter' style='position:absolute;z-index:100;margin-top:0px; margin-left:0px;'><button><img src='/myvet/resources/img/mapmark/goToCenTer.png'/></button>"
								+ "</div>")
	</script>
</body>

</html>