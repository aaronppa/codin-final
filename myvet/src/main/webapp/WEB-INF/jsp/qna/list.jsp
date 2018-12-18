<%@page import="kr.co.codin.repository.domain.Tip"%>
<%@page import="kr.co.codin.repository.mapper.TipMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<!--bootstrap-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<style>

/*category*/
@import "compass/css3";

select[disabled] {
	color: #aaa;
}

h1 {
	color: #563d7c;
}

/*search*/
.mb-3 {
	margin-left: 20%;
}

.dropdown-toggle {
	background: none;
}

.dropdown-toggle:hover {
	opacity: 0.5;
	/* color:white; */
}
/*검색입력창*/
.input-search {
	border: none;
	width: 280px;
	color: saddlebrown;
}
/*검색버튼*/
.btn-outline {
	border: none;
}

.btn-outline:hover {
	border: none;
	opacity: 0.5;
}

input#search-bar {
	margin: 0 auto;
	width: 300px;
	height: 45px;
	padding: 0 20px;
	font-size: 1rem;
	border: 1px solid #D0CFCE;
	outline: none;
}

input#search-bar:focus {
	border: 1px solid #008ABF;
	transition: 0.20s ease;
	color: #008ABF;
}

input#search-bar:focus::-webkit-input-placeholder {
	transition: opacity 0.45s ease;
	opacity: 0;
}

input#search-bar:focus::-moz-placeholder {
	transition: opacity 0.45s ease;
	opacity: 0;
}

input#search-bar:focus:-ms-placeholder {
	transition: opacity 0.45s ease;
	opacity: 0;
}

.search-icon {
	position: relative;
	float: right;
	width: 75px;
	height: 75px;
	top: -62px;
	right: -10px;
}

.search-icon:hover {
	transform: scale(1.5);
	transition: 0.5s;
}

/*writeBtn*/
.btn-light:hover {
	background: black;
	color: white;
	transition: .5s;
}

/*table*/
tr:hover {
	background: gray;
	opacity: 0.8;
}

.no {
	width: 10%;
}

.writer {
	width: 15%;
}

.reg_date {
	width: 15%;
}

.view_cnt {
	width: 15%;
}
/*pagenation*/
.bodyContainer {
	width: 1100px;
	overflow: hidden;
	margin: auto;
	margin-top: 30px;
}

.answered {
	margin-left: 20px;
	font-size: 16px;

}
.searchForm{
	width:100%;
	postion:absolute;
	margin-top: 110px;
	
	
}
</style>
<script src="<c:url value="../resources/js/vendor/jquery.js"/>"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />

	<!--search-->
	<!--category-->
	<div class="bodyContainer">
		<div class="input-group mb-3">
			<form class="searchForm" action="<c:url value='/qna/list.do'/>" method="post">
				<input type="hidden" id="pageNo" name="pageNo" value="">
				<!-- <div class="input-group-prepend"> -->
				<select name="order" id="order" class="order">
					<option selected value="0">조회순서</option>
					<option value="1" <c:if test='${searchQuery.order == 1}'>selected</c:if>>조회수▲</option>
					<option value="2" <c:if test='${searchQuery.order == 2}'>selected</c:if>>조회수▼</option>
					<option value="3" <c:if test='${searchQuery.order == 3}'>selected</c:if>>추천수▲</option>
					<option value="4" <c:if test='${searchQuery.order == 4}'>selected</c:if>>추천수▼</option>
					<option value="5" <c:if test='${searchQuery.order == 5}'>selected</c:if>>작성일▲</option>
					<option value="6" <c:if test='${searchQuery.order == 6}'>selected</c:if>>작성일▼</option>
				</select> 
				
				<select name="answered" class="answered">
					<option selected value="0">채택여부:Y/N</option>
					<option value="1" <c:if test='${searchQuery.answered == 1}'>selected</c:if>>채택여부:Y</option>
					<option value="2" <c:if test='${searchQuery.answered == 2}'>selected</c:if>>채택여부:N</option>
				</select> 
				
				<select name="categoryCode" class="categoryCode">

					<option selected value="0">Category</option>

					<c:forEach var="c" items="${category}" varStatus="loop">

						<option value="${c.categoryCode }" <c:if test='${searchQuery.categoryCode == c.categoryCode}'>selected</c:if>>${c.categoryName }</option>

					</c:forEach>
				</select> 
				
				<select name="sort" id="sort" class="sort">
					<option selected value="0">검색조건</option>
					<option value="1" <c:if test='${searchQuery.sort == 1}'>selected</c:if>>제목</option>
					<option value="2" <c:if test='${searchQuery.sort == 2}'>selected</c:if>>내용</option>
					<option value="3" <c:if test='${searchQuery.sort == 3}'>selected</c:if>>작성자</option>
					<option value="4" <c:if test='${searchQuery.sort == 4}'>selected</c:if>>제목+내용</option>
				</select>



				<!--  </div> -->
				<input name="keyword" id="keyword" type="text" class="input-search" placeholder="search" value="<c:if test="${searchQuery.keyword != '0'}" >${searchQuery.keyword}</c:if>"  >
				<button id="submitBtn" type="submit" class="btn btn-outline">검색</button>
			</form>
		</div>
		<!--count-->

		<!--list-->
		<table class="table">
			<div style="text-align: right;">전체 ${totalCnt} 개</div>
			<!-- <caption>List of users</caption> -->
			<thead>
				<tr style="text-align: center;">
					<th scope="col" style="width: 10%;" class="no">글번호</th>
					<th scope="col" style="width: 10%;" class="no">채택여부</th>
					<th scope="col" style="width: 20%;" class="writer">작성자</th>
					<th scope="col" style="width: 20%;" class="title">제목</th>
					<th scope="col" style="width: 10%;" class="category">카테고리</th>
					<th scope="col" style="width: 10%;" class="reg_date">작성일</th>
					<th scope="col" style="width: 10%;" class="view_cnt">조회수</th>
					<th scope="col" style="width: 10%;" class="view_cnt">추천수</th>
				</tr>
			</thead>
			<tbody>
		
				<c:forEach  var="q" items="${qna}"  varStatus="loop">
					<tr style="text-align: center;">
						<th scope="row">${q.qnaNo}</th>
						<td>${q.answered }</td>
						<td>${q.memberNickname}</td>
						<td><a
							href="<c:url value='/qna/detail.do?qnaNo=${q.qnaNo}'/>">${q.title }(<strong
								style="color: brown">${q.commentCount}</strong>)
						</a><span id="countComment"></span></td>

						<td>${q.categoryName}</td>

						<td><fmt:formatDate value="${q.regDate}"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td>${q.viewCnt}</td>
						<td><i class="fas fa-heart" style="color: red;">&nbsp;${q.recomCnt }</i>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<!--writeBtn-->
		<div class="writeBtn" style="text-align: right;">
			<a id="writeButton" href="<c:url value='/qna/writeForm.do'/>">
				<button type="button" class="btn btn-light">글쓰기</button>
			</a>
		</div>
		<!--pagenation-->

		 <div id="pagination">
   	 	 	<c:import url="page.jsp"></c:import> 
    	</div>
	</div>
		<input type="hidden" id="searchQuery" value="${searchQuery }"> 
</body>
<script>
console.log("${searchQuery}");


</script>
</html>