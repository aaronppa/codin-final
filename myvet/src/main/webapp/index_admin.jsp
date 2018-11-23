<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	index 접속 확인
	<br>
	<a href="<c:url value='/admin/main.do'/>">관리자페이지</a>
	<br>
	<a href="<c:url value='/notice/list.do'/>">공지사항</a>
</body>
</html>