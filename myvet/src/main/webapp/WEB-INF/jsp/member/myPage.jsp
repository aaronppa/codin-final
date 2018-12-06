<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<title>반려인의 개인 페이지입니다.</title>

<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />

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
    
    #container {
    	margin-top: 50px;
    	margin-left: 50px;
    	margin-right: 50px;
    	margin-bottom: 50px;
    	font-size: 18px;
    }
    
    #top-menu {
    	height: 50px;
    }
    
    .pet-info {
    	width: 200px;
    	height: 160px;
    	border: 1px solid black;
    	float: left;
    	margin: 50px;
    	text-align: center;
    }
    
    .pet-info > img {
    	width: 100%;
    }
    
    #pet-add {
    	padding-top: 0;
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
                    <button type="button" class="btn btn-default"><i class="fas fa-camera"></i></button>
                </td>
                <th>이메일</th>
                <td>${member.memberEmail}</td>
                <th>비밀번호</th>
                <td>
                	<input type="password" value="${member.password}" style="width:100px;" readOnly/>
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
<!--                 실제 가입일로 수정해야 함 -->
                <td><fmt:formatDate value="${member.memberFileRegDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${member.memberName}</td>
                <th>닉네임</th>
                <td>
                    <span id="my-nickname">${member.memberNickname}</span>
                    <button class="btn btn-default" id="nickChangeBtn">변경</button>
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
    <h2>반려동물</h2>
    <hr>
    <div id="pet-container">
    
<!-- pet이 잘 들어오는지 확인 -->
<%--     :${pet }: --%>
		
    	<c:forEach var="pet" items="${pet}">
			<div class="pet-info" data-pet-no="${pet.petNo}">
				<img alt="강아지 사진" src="<c:url value='${pet.petFilePath}/${pet.petSysName}' />">
				<div>${pet.petName}</div>
			</div>
		</c:forEach>
		<button class="pet-info" id="pet-add">반려동물 정보 추가</button>
	</div>
	<script src="<c:url value='/resources/js/member/mypage.js'/>"></script>
</body>
</html>