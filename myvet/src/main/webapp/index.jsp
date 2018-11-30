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
	
	<a href="<c:url value='/notice/list.do'/>">공지사항</a>
	<a href="<c:url value='/hos/register.do'/>">병원등록</a>
	<a href="<c:url value='/hos/search.do'/>">병원찾기</a>
	<a href="<c:url value='/hos/chartHos.do'/>">진료기록 - 병원</a>
</body>
</html>