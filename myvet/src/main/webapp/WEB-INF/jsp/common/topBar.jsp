<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
    
       	#topBarBody{
    		margin: 0px;
    	}
    
        .top-bar {
            height: 80px;
        }

        .menu > li > a {
            margin-top: 10px;
            color: #412427;
        }

        .menu-text > span {
            font-size: 30px;
            color: #412427;
        }
    </style>
	<link rel="stylesheet" href="<c:url value='../resources/css/common/topbar.css'/>"/>
    <!-- <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script> -->

    <script src="<c:url value='../resources/js/vendor/jquery.js'/>"></script>
    <script src="<c:url value='../resources/js/vendor/foundation.js'/>"></script>
</head>
<body id="topBarBody">

    <div class="top-bar">
        <div class="top-bar-left">
            <ul class="dropdown menu" data-dropdown-menu>
                <li class="menu-text"><span>MyVet</span></li>
                <li><a href="<c:url value='/hos/search.do'/>">동물병원 찾기</a></li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="menu vertical">
	                    <li><a href="<c:url value='/tip/list.do'/>">개꿀팁이냥</a></li>
	                    <li><a href="#">5959 내시끼</a></li>
	                    <li><a href="#">QnA 게시판</a></li>
	                    <li><a href="<c:url value='/notice/list.do'/>">공지사항</a></li>
                    </ul>
                </li>
                <!-- <li><a href="#">Three</a></li> -->
            </ul>
        </div>
        <div class="top-bar-right">
            <ul class="dropdown menu" data-dropdown-menu>
                <li><a href="<c:url value='/msg/main.do'/>">메신저</a></li>
                <li><a href="#">즐겨찾는 병원</a></li>
                <li><a href="<c:url value='/member/loginForm.do'/>">로그인</a></li>
                <li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
                <li><a href="<c:url value='/member/signup.do'/>">회원가입</a></li>
                <li><a href="<c:url value='/admin/main.do'/>">관리자</a></li>
                <li>
                <a href="#">${user.memberNickname}</a>
                 <ul class="menu vertical">
	                    <li><a href="#">마이페이지</a></li>
	             </ul>
                </li>
            </ul>
        </div>
    </div>
    <script>
        $(document).foundation();
    </script>
</body>
</html>