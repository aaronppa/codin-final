<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
<script src="<c:url value='/resources/js/vendor/foundation.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<title>MyVet :: 괜찮🐈-건강하🐕</title>
    <style>
        .relative {
            /* border: 1px solid black; */
            position: relative;
        }    
        
        #mapArea {
        	width: 500px;
        	height: 500px;
        }
        
        #bodyContainer {
            margin: auto;
            margin-top: 10px;
            width: 1100px;
            text-align: center;
            padding: 5px;

        }
        
        #noticeContainer {
            padding-left: 10px;
            text-align: left;
        }
        
        #leftContainer {
            position: absolute;
            top: 0px;
            left: 0px;
            display: inline-block;
            width: 74%;
        }
        
        #rightContainer {
            position: absolute;
            top :0px;
            left: 930px;
            /* position: relative; */
            display: inline-block;
            width: 24%;
        }
        
        #hospitalContainer {
            height:230px
        }
        
        #petContainer {
            height:150px
        }
        
        #newsContainer {
            height:200px 
        }
    </style>
	<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
</head>          
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <div class="relative" id="bodyContainer">
        <div class="relative" id="leftContainer">
            <div class="relative" id="noticeContainer">
                <span>[공지] 여기는 뉴스스크롤 자리입니다.</span>
            </div>
            <div class="relative" id="mapContainer">
                <div class="relative" id="mapArea"><span>지도영역</span></div>
            </div>
        </div>
        <div class="relative" id="rightContainer">
            <div class="relative" id="hospitalContainer">병원 리스트 영역</div>
            <div class="relative" id="petContainer">PET 영역</div>
            <div class="relative" id="newsContainer">유저 뉴스 영역</div>
        </div>
    </div>
</body>

<script>
	$("#mapArea").load("/myvet/map/map.do")
</script>

</html>