<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page Test Index</title>
</head>
<body>
	index 접속 확인
	<br>
	<a href="<c:url value='/admin/main.do'/>">관리자페이지</a>
	<br>
	<a href="<c:url value='/notice/list.do'/>">공지사항</a>
	<br>
	<a href="<c:url value='/msg/main.do'/>">메신저</a>
	<br>
	<a href="<c:url value='member/signupForm.do'/>">회원가입</a>
	<br>
	<a href="<c:url value='member/loginForm.do'/>">로그인</a>
	
</body>
</html>