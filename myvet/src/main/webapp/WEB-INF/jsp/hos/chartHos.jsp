<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차트 목록(병원) - MyVet</title>
	<script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>
    <script src="<c:url value='../resources/js/vendor/foundation.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='../resources/css/common/foundation.css'/>"/>
    <style>
        #body {
            width:1100px;
            margin: auto;
        }
        #chartList {
            display: inline-block;
            width: 70%;
            height: 500px;
            /* border: 1px solid black; */
            position: relative;
            top: 0px;
            left: 0px;
            overflow: auto;
        }
        #patientList {
            margin-left: 20px;
            display: inline-block;
            width: 20%;
            height: 500px;
            /* border: 1px solid black; */
            position: relative;
            top: 0px;
            left: 0px;
            overflow: auto;
            text-align: center;
        }
        #patientList ul {
        	text-align: left;
        }
        
        .marginLeft{
            margin-left: 20px;
        }

        .chartDetail{
            display: inline-block;
        }
        
        #register {
        	display: inline-block;
        	border: 1px solid black;
        	padding: 3px;
        	background-color: #8b787a;
        	color: white;
        	border-radius: 3px;
        	line-height: 1;
        	cursor: auto;
        }
    </style>
</head>
<body>
    <div id="body">
        <h1>차트 목록</h1>
        <h5>병원명 : <span></span></h5>
        <h5>진료의<br></h5>
        <span>김모씨</span>
        <div id="chartList">
            <div class="row">
                <div class="columns">
                    <ul class="accordion" data-accordion data-multi-expand="true" data-allow-all-closed="true">
                    <li class="accordion-item" data-accordion-item>
                        <a href="#" class="accordion-title">OOO님 / OOO / 2018-11-30</a>
                        <div class="accordion-content" data-tab-content >
                            <div class="chartDetail">
                                <span>진료일 : </span><span>2018-11-30</span>
                                <span class="marginLeft">보호자 성명 : </span><span>OOO님</span>
                                <span class="marginLeft">동물 이름 : </span><span>OOO</span>
                                <br>
                                <span>병명 : </span><span>습진</span>
                                <span class="marginLeft">다음 진료일 : </span><span>2018-12-05</span>
                                <span class="marginLeft">주의사항 : </span><span>물 줄때 주의 해 주세요</span>
                                <br>
                                <span>주요 처치 내용 : </span><span>습진 부위 처지</span>
                                <span class="marginLeft">최근 수정일 : </span><span>2018-11-30</span>
                            </div>
                            <a> 첨부사진</a>
                        </div>
                    </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="patientList">
            <div class="row">
                <div class="columns">
                    <ul class="accordion" data-accordion data-multi-expand="true" data-allow-all-closed="true">
                    <li class="accordion-item" data-accordion-item>
                        <a href="#" class="accordion-title">OOO님 / OOO</a>
                        <div class="accordion-content" data-tab-content >
                            <div class="chartDetail">
                                <span>보호자 성명 : OOO님</span><br>
                                <span>동물 이름 : OO</span><br>
                                <span>최근 방문일 : 2018-11-30</span><br>
                            </div>
                        </div>
                    </li>
                    </ul>
                </div>
            </div>
            <button id="register" type="button">현장접수</button>
        </div>
    </div>
    <script>
        $(document).foundation();
        
        $("#register").click(function(){
        	window.open("/myvet/hos/reception.do", "reception", "width=850, height=1000, location=no");
        })
    </script>
</body>
</html>