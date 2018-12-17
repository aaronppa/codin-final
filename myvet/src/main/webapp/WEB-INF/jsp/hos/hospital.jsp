<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${hospital.title } - MyVet</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kxd0pvbof9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/js/swiper.min.js"></script>

<style>

   .hosfacility {
       position: relative;
       display: inline-block;
       border: 1px solid black;
       border-radius: 3px;
       padding: 3px  5px;
   }
   
   #follow{
       position: relative;
       display: inline-block;
   }
   
   #title {
       display: inline;
       margin-left: 10px;
       font-size: 2em;
   }
   #hosTable {
       width: 1100px;
       margin-top:20px;
       margin-right: auto;
       margin-left: auto;
   }
   #map {
       width: 49%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   
   #hosStaff {
       width: 49%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   
   #hosBoard {
       width: 30%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   
   #book {
       width: 69%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   #topContainer, #bottomContainer {
       width: 100%;
       height: 260px;
       text-align: center;
       border: 0px solid black;
   }
   
   #facilityContainer {
		width: 500px;
   		height: 50px;
	    overflow: hidden;
	    overflow-x: scroll;
	    white-space: nowrap;
   }
   
   #bookTable {
		overflow: auto;
   }
   
   #bodyContainer {
   		width: 1100px;
   		margin: auto;
   		margin-top: 110px;
   }
   
   .date {
   		width: 50px;
   }
   
   #boardList {
   		text-align: left; 
   }
   
   #followDiv {
   		display: inline-block;
   }
   
   .swiper-slide {
   		padding-bottom: 30px;
   }
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="bodyContainer">
    <table id="hosTable">
        <tr>
            <td rowspan="2">
                <h1 id="title">${hospital.title }</h1>
                <input type="hidden" id="hosCode" value="${hospital.hosCode }">
                <div id="followDiv">
					<c:choose>
						<c:when test="${favHos == 0 }">
		                	<button id="follow">
				                즐겨찾기 버튼
		                	</button>
	                	</c:when>
	                	<c:otherwise>
		                	<button id="unfollow" data-fav="${favHos }">
				                즐겨찾기 취소버튼
		                	</button>
	                	</c:otherwise>
                	</c:choose>
                </div>
            </td>
            <td>
            <div class="hosTitle"><span>즐겨찾는 고객 수 : </span><span>${followCnt }</span><span>명</span></div>
            </td>
            <td rowspan="2" style="text-align: center">
                <button id="chart">진료차트</button>
            </td>
            <td rowspan="2" style="text-align: center">
                관리
            </td>
        </tr>
        <tr>
            <td>
            	<div id="facilityContainer">
            		<c:forEach items="${facilityList }" var="facility">
		                <div class="hosfacility">${facility.facilityName }</div>
	                </c:forEach>
                </div>
            </td>
        </tr>
    </table>
    <div id="topContainer">
        <div id="map"></div>
        <div id="hosStaff">
            <a href="hosStaff.do?hosCode=${hospital.hosCode }">직원</a>
			<div class="swiper-container">
			     <div class="swiper-wrapper">
			     	<c:forEach items="${staffs }" var="staff">
			          <div class="swiper-slide">
			          	<div class="staffImg">
			          		<img src="/myvet/upload${staff.member.memberFilePath }/${staff.member.memberSysName}">
			          	</div>
			          	<div class="staffInfo">
			          		이름 : ${staff.member.memberName } <br>
			          		${staff.staffTitle } <br>
			          		약력 <br>
			          		${staff.member.memberCareer }
			          	</div>
			          </div>
			        </c:forEach>
			      </div>
			     <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			    <!-- Add Arrows -->
			    <div class="swiper-button-next"></div>
			    <div class="swiper-button-prev"></div>
    		</div>
    	</div>
   	</div>
    <div id="bottomContainer">
        <div id="hosBoard">
            <a href="hosBoard.do?hosCode=${hospital.hosCode }">병원게시판</a><br>
            <div id="boardList">
            	<c:forEach items="${boardList }" var="board">
		            <a href="/myvet/hos/detailBoard.do?hosBoardId=" + ${board.hosBoardId }>[${board.hosBoardCategoryCode }]${board.hosBoardTitle }</a><br>
	            </c:forEach>
            </div>
        </div>
        <div id="book">
            예약현황
            <div id="bookTable">
            <table>
                <tr>
                    <td></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                    <td class="date"></td>
                </tr>
                <tr>
                    <td style="width:100px;"><span>진료</span></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                    <td class="medical"></td>
                </tr>
                <tr>
                    <td><span>미용</span></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                    <td class="beauty"></td>
                </tr>
            </table>
            </div>
            <div><button id="booking">예약</button>
            <button id="bookingManager">예약관리</button></div>
        </div>
        
    </div>
    </div>
    <script>

	    function formatDate (d, f) {
	        if (!this.valueOf()) return "";
	     
	        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	            switch ($1) {
	                case "yyyy": return d.getFullYear();
	                case "MM": return (d.getMonth() + 1).zf(2);
	                case "dd": return d.getDate().zf(2);
	                default: return $1;
	            }
	        });
	    };

		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	    Number.prototype.zf = function(len){return this.toString().zf(len);};

	    var mapDiv = document.getElementById('map'); // 'map'으로 선언해도 동일
	
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(${hospital.mapy}, ${hospital.mapx}),
		    zoom: 11
		});    
	    
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(${hospital.mapy}, ${hospital.mapx}),
		    map: map
		});
		
		for (let i = 0; i < $(".date").length; i++) {
			var date = new Date();
			date = date.setDate(date.getDate()+i);
			date = new Date(date);
			$(".date:eq("+i+")").html(formatDate(date, "MM/dd"));
			
			$.ajax({
				url: "/myvet/hos/checkBooking.do",
				data: {hosCode: ${hospital.hosCode},
					blockDay: formatDate(date, "yyyy-MM-dd")}
			}).done(function(bookingMap){
				console.log(bookingMap.medicalMax)
				$(".medical:eq("+i+")").html(bookingMap.medical);
				$(".beauty:eq("+i+")").html(bookingMap.beauty);
			})
		}
	    
		$("#follow").click(function(){
			$.ajax({
				url: "/myvet/hos/insertFavHos.do",
				data: {
					hosCode: ${hospital.hosCode},
					memberNo: ${user.memberNo}
				}
			}).done(function(){
				window.location.reload()
			})
		})
	    
		$("#unfollow").click(function(){
			$.ajax({
				url: "/myvet/hos/deleteFavHos.do",
				data: {
					favHosNo: $(this).data("fav")
				}
			}).done(function(){
				window.location.reload()
			})
		})
		
    	$("#chart").click(function(){
    		window.location.href = "/myvet/hos/chartHos.do?hosCode=" + $("#hosCode").val();
    	})
    	
    	$("#booking").click(function(){
    		window.location.href = "/myvet/hos/booking.do?hosCode=" + $("#hosCode").val();
    	})
    	
    	$("#bookingManager").click(function(){
    		window.location.href = "/myvet/hos/bookingManager.do?hosCode=" + $("#hosCode").val();
    	})
    	
  	  var swiper = new Swiper('.swiper-container', {
			slidesPerView: 1,
			spaceBetween: 30,
			loop: true,
			autoplay: {
		        delay: 2500,
		        disableOnInteraction: false,
		    },
		    navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		    },
		    pagination: {
	          el: '.swiper-pagination',
	          dynamicBullets: true,
	        },
 	  })
</script>
    </script>
</body>
</html>