<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OOO 동물병원 - MyVet</title>
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
   table {
       width: 80%;
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
   }
   #book {
       width: 40%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
   }
   #hosBoard {
       width: 30%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
   }
   #hosReview {
       width: 30%;
       height: 250px;
       position: relative;
       display: inline-block;
       margin-top: 10px;
   }
   #hosStaff {
       width: 19.5%;
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
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <table>
        <tr>
            <td rowspan="2">
                <h1 id="title">${hos.title }</h1>
                <div id="fallow">즐겨찾기 버튼</div>
            </td>
            <td>
            <div class="hosTitle"><span>즐겨찾는 고객 수 : </span><span></span><span>명</span></div>
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
                    <td style="width:100px;"><span>김의사</span></td>
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
                    <td><span>박의사</span></td>
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
    </div>
    <div id="bottomContainer">
        <div id="hosBoard">
            병원게시판
        </div>
        <div id="hosReview">
            후기
        </div>
        <div id="hosStaff">
            직원
        </div>
    </div>
    <script>
    
    	$.ajax({
    		url:,
    		data:
    	})
    
    	$("#facilityContainer")
    </script>
</body>
</html>