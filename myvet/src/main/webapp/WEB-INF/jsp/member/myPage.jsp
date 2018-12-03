<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<title>반려인의 개인 페이지입니다.</title>

<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../dist/css/swiper.min.css">

<!-- swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.bundle.js"></script>

<!-- Swiper JS -->
<script src="../dist/js/swiper.min.js"></script>

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
    table, tr, td{
        border-collapse: collapse;
        border: 1px solid black;
    }

    .basics {
        width: 80%;
        margin-right : auto;
        margin-left : auto;

    }

    .form-control {
        width: 150px;
    }

    .career {
        width: 80%;
        margin-right : auto;
        margin-left : auto;
        
    }

    #tools {
        margin-left: 50px;
    }

    .imgTd {
        width: 170px;
    }
    th{
        font-size:large;
        width: 200px;
        text-align: center;
        height: 40px;
    }
    td {
        padding-left: 20px;
        width: 250px;
    }
    
    a {
    	text-decoration: none !important;
    	color: white;
    }
    
    .update-delete {
    	text-align: right;
    	margin-top: 50px;
    }
    
    .career {
    	text-align: right;
    }
    
    body {
    	font-size: 18px;
    }
    
    #container {
    	margin-left: 50px;
    	margin-right: 50px;
    	margin-bottom: 50px;
    }
    
    #top-menu {
    	height: 50px;
    }
    
	.swiper-container {
		width: 100%;
		height: 30%;
    }
    
    .swiper-slide {
		text-align: center;
		font-size: 18px;
		background: #fff;
		/* Center slide text vertically */
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
		
		border: 1px solid black;
		width: 10%;
		height: 200px;
    }
    .pet-info {
    	width: 200px;
    	height: 200px;
    	border: 1px solid black;
    	float: left;
    	margin: 50px;
    	text-align: center;
    	padding-top: 90px;
    }
    #show-password {
    	width: 150px;
    }
</style>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
	<div id="top-menu">
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	</div>
	<div id="container">
	<h2>반려인</h2>
    <hr>
    <div>
        <table class="info basics">
            <tr>
                <td rowspan="4" class="imgTd">
                    <img src="../../../../app/myVet/profile.jpg" width="150px" height="150px" id="profile" />
                    <i class="fas fa-camera"></i>
                </td>
                <th>이메일</th>
                <td>${member.memberEmail}</td>
                <th>비밀번호</th>
                <td>
                	<input id="password" type="password" value="${member.password}" style="width:100px;" readOnly/>
                	<button class="btn btn-default">변경</button>
                </td>
            </tr>
            <tr>
                <th>회원구분</th>
                <td>
                	<c:choose>
                		<c:when test="${member.memberGrade eq 'U'}">일반회원</c:when>
                		<c:when test="${member.memberGrade eq 'S'}">관계자</c:when>
                		<c:when test="${member.memberGrade eq 'P'}">수의사 인증 처리중..</c:when>
                		<c:when test="${member.memberGrade eq 'V'}">수의사</c:when>
                		<c:when test="${member.memberGrade eq 'A'}">관리자</c:when>
                	</c:choose>
                </td>
                <th>가입일</th>
                <td><fmt:formatDate value="${member.memberFileRegDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${member.memberName}</td>
                <th>닉네임</th>
                <td>
                    ${member.memberNickname}
                    <button class="btn btn-default">변경</button>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td colspan="3">
                	${member.memberPhone}
                	<button class="btn btn-default">변경</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="col-md-offset-10">
    	<button class="btn btn-primary"><a href="<c:url value='/member/updateForm.do' />">수정</a></button>
    	<button class="btn btn-primary"><a href="<c:url value='/member/deleteAccount.do?memberNo=' />${member.memberNo}">탈퇴</a></button>
    </div>
    <h2>반려동물</h2>
    <hr>
    <div id="pet-container">
    	<c:forEach var="pet" items="${pet}">
			<div class="pet-info">
				<img alt="강아지 사진" src="">
				<div>${pet.petName}</div>
			</div>
		</c:forEach>
		<div class="pet-info">
			<img alt="고양이 사진" src="">
		</div>
		<div class="pet-info" id="pet-add">
			반려동물 정보 추가
		</div>
	</div>
    
<!-- 	Swiper -->
<!-- 	<div class="swiper-container"> -->
<!--     	<div class="swiper-wrapper"> -->
<!-- 			<div class="swiper-slide">Slide 1</div> -->
<!-- 			<div class="swiper-slide">Slide 2</div> -->
<!-- 			<div class="swiper-slide">Slide 3</div> -->
<!-- 			<div class="swiper-slide">Slide 4</div> -->
<!-- 			<div class="swiper-slide">Slide 5</div> -->
<!-- 	    </div> -->
<!-- 		Add Pagination -->
<!-- 		<div class="swiper-pagination"></div> -->
<!-- 	</div> -->
	
<%--    	<button class="btn btn-primary col-md-offset-10"><a href="<c:url value='/member/insertCareerForm.do' />">추가</a></button> --%>
   	

    <script>
// 		var swiper = new Swiper('.swiper-container', {
// 			slidesPerView: 3,
// 			spaceBetween: 30,
// 			pagination: {
//  			el: '.swiper-pagination',
// 			clickable: true,
// 			},
// 		});
    </script>
</body>
</html>