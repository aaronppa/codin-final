<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>공지사항 - MyVet</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="<c:url value='/resources/css/notice/notice.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>

<style>

	#background {
		width: 100%;
		height: 100%;
		position: fixed;
		z-index: -2;
		top:0;
		left:0;
		opacity: 0.3;
		background-image: url('/myvet/resources/img/common/background.jpg');
	}
    #body {
        width: 80%;
        margin: auto;
        padding-top: 110px;
    }
    #noticeTable{
        width: 100%;
        text-align: center;
        font-size: 0.85em;
    }
    #tableTitle {
        width: 60%;
    }
    .link {
        color:#412427;
    }
    .notice-title {
        text-align: left;
    }
    .newNotice{
        color: red;
    }
</style>
<script src="<c:url value="../resources/js/vendor/jquery.js"/>"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />        
	<div id="background"></div>
	    
    <div id="body">
    <h1>공지사항</h1>
    <table id="noticeTable" class="hover">
        <thead>
            <tr>
                <td>글 번호</td>
                <td id="tableTitle">제목</td>
                <td>게시일</td>
                <td>조회수</td>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="notice" items="${notice }">
        		<tr class="notice-tr">
        			<td class="notice-no">${notice.noticeNo }</td>
        			<td class="notice-title">
        				<a class="link" 
        				   href="<c:url value="/notice/detail.do?noticeNo=${notice.noticeNo }"/>">
        					${notice.noticeTitle }
        				</a>
        			</td>
        			<td class="notice-reg-date">
	        			<fmt:formatDate value="${notice.noticeRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
        			</td>
        			<td class="notice-view-cnt">
        				${notice.noticeViewCnt }
        			</td>
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
	<c:import url="page.jsp"></c:import>
    </div>
</body>
</html>