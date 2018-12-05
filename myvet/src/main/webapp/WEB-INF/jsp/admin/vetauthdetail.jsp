<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수의사 요청 상세</title>
<style>
.btnarea{
	border: 1px solid black;
	width: 300px;
	height: auto;
	margin: auto;
}

.button{
	display: inline-block;
}

.button.approve {
  background-color: #a56e50;  
  border-radius: 5px;
  color: white;
  padding: .5em;
  text-decoration: none;
  width: 30px;
  height: 20px;
  margin: auto;
}

.button.reject {
  background-color: #8b787a;  
  border-radius: 5px;
  color: white;
  padding: .5em;
  text-decoration: none;
  width: 30px;
  height: 20px;
  margin: auto;
}
</style>
</head>
<body>
${detail }

<div class="btnarea">

<c:if test="${detail.memberGrade=='P' }">
<a href="#" class="button reject">반려</a>
<a href="#" class="button approve">승인</a>
</c:if>
<c:if test="${detail.memberGrade=='V' }">
<a href="#" class="button reject">수정</a> 
</c:if>

</div>
</body>
</html>