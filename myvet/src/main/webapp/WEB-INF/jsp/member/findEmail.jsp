<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반려인의 개인 페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
    #email-contaner {
    	width: 400px;
		margin: auto;
		margin-top: 10%;
    }
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
<!-- 	찾은 아이디 -->
	<div id="email-contaner">
		<h3>아이디 찾기</h3>
		<hr>
		<h4>${member.memberEmail}</h4>
		<button type="button" onclick="location.href='loginForm.do'" class="btn btn-primary offset-md-8">로그인 페이지로</button>
	</div>
</body>
</html>