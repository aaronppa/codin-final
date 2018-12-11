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
<style>

   .hosfacility {
       position: relative;
       display: inline-block;
       border: 1px solid black;
       border-radius: 3px;
       padding: 3px;
   }
   
   #fallow{
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
       width: 40%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   #book {
       width: 40%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
       overflow: hidden;
   }
   #hosBoard {
       width: 49%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
   }
   #hosStaff {
       width: 49%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
   }
   #topContainer, #bottomContainer {
       width: 100%;
       height: 260px;
       text-align: center;
       border: 0px solid black;
   }
   
   #bookTable {
		overflow: auto;
   }
   
   #bodyContainer {
   		width: 1100px;
   		margin: auto;
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
                <div id="fallow">즐겨찾기 버튼</div>
            </td>
            <td>
            <div class="hosTitle"><span>즐겨찾는 고객 수 : </span><span></span><span>명</span></div>
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
	                <div class="hosfacility">24시간 진료</div>
	                <div class="hosfacility">모든 동물 진료</div>
	                <div class="hosfacility">미용 가능</div>
	                <div class="hosfacility">주차장 완비</div>
                </div>
            </td>
        </tr>
    </table>
    <div id="topContainer">
        <div id="map">
            지도구역
        </div>
        <div id="book">
            오늘의 예약현황
            <div id="bookTable">
            <table>
                <tr>
                    <td></td>
                    <td>10시</td>
                    <td>11시</td>
                    <td>12시</td>
                    <td>13시</td>
                    <td>14시</td>
                    <td>15시</td>
                    <td>16시</td>
                    <td>17시</td>
                </tr>
                <tr>
                    <td style="width:100px;"><span>진료</span></td>
                    <td>가능</td>
                    <td>가능</td>
                    <td>가능</td>
                    <td>불가</td>
                    <td>불가</td>
                    <td>혼잡</td>
                    <td>가능</td>
                    <td>불가</td>
                </tr>
                <tr>
                    <td><span>미용</span></td>
                    <td>가능</td>
                    <td>가능</td>
                    <td>가능</td>
                    <td>불가</td>
                    <td>불가</td>
                    <td>혼잡</td>
                    <td>가능</td>
                    <td>불가</td>
                </tr>
            </table>
            </div>
            <div><button id="booking">예약</button>
            <button id="bookingManager">예약관리</button></div>
        </div>
    </div>
    <div id="bottomContainer">
        <div id="hosBoard">
            <a href="hosBoard.do?hosCode=${hospital.hosCode }">병원게시판</a>
        </div>
        <div id="hosStaff">
            직원
        </div>
    </div>
    </div>
    <script>
    
    	$("#chart").click(function(){
    		window.location.href = "/myvet/hos/chartHos.do?hosCode=" + $("#hosCode").val();
    	})
    	
    	$("#booking").click(function(){
    		window.location.href = "/myvet/hos/booking.do?hosCode=" + $("#hosCode").val();
    	})
    	
    	$("#bookingManager").click(function(){
    		window.location.href = "/myvet/hos/bookingManager.do?hosCode=" + $("#hosCode").val();
    	})
    </script>
</body>
</html>