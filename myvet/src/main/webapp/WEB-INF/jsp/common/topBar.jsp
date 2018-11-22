<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
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
	<link rel="stylesheet" href="<c:url value='../css/common/topbar.css'/>"/>
    <!-- <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script> -->

    <script src="<c:url value='../js/vendor/jquery.js'/>"></script>
    <script src="<c:url value='../js/vendor/foundation.js'/>"></script>
</head>
<body>

    <div class="top-bar">
        <div class="top-bar-left">
            <ul class="dropdown menu" data-dropdown-menu>
                <li class="menu-text"><span>MyVet</span></li>
                <li><a href="#">동물병원 찾기</a></li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="menu vertical">
                    <li><a href="#">유저 뉴스</a></li>
                    <li><a href="#">5959 내새끼</a></li>
                    <li><a href="#">QnA 게시판</a></li>
                    </ul>
                </li>
                <!-- <li><a href="#">Three</a></li> -->
            </ul>
        </div>
        <div class="top-bar-right">
            <ul class="menu">
                <li><a href="#">메신저</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">즐겨찾는 병원</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
                <li><a href="#">관리자</a></li>
            </ul>
        </div>
    </div>
    <script>
        $(document).foundation();
    </script>
</body>
</html>