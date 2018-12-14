<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<style>
	#bodyContainer {
		width: 1100px;
		margin: auto;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="bodyContainer">
    <h1>병원 게시판</h1>
    <span>총 <span>${listCount }</span>건</span>
    <table id="boardTable" class="hover">
        <thead>
        <input type="hidden" id="searchKeyWord" value="${keyWord }">
        <input type="hidden" id="searchSearchType" value="${searchType }">
            <tr>
                <th>글 번호</th>
                <th>카테고리</th>
                <th id="tableTitle">제목</th>
                <th>작성자</th>
                <th>게시일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="board" items="${boardList }">
        		<tr class="board-tr">
        			<td class="board-no">${board.hosBoardNo }</td>
        			<td class="board-category">${board.hosBoardCategoryCode }</td>
        			<td class="board-title">
        				<a class="link" 
        				   href="<c:url value="/hos/detailBoard.do?hosBoardId=${board.hosBoardId }"/>">
        					${board.hosBoardTitle }
        				</a>
        			</td>
        			<td class="board-writer">
	        			${board.hosBoardWriterNo }
        			</td>
        			<td class="board-reg-date">
	        			<fmt:formatDate value="${board.hosBoardRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
        			</td>
        			<td class="board-view-cnt">
        				${board.hosBoardViewCnt }
        			</td>
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
    <div id="searchDiv">
    	<select id="searchType">
    		<option value="0">선택</option>
    		<option value="1">제목</option>
    		<option value="2">분류</option>
    		<option value="3">작성자</option>
    	</select>
    	<input type="text" class="keyWord" name="keyWord" id="stringKeyWord">
    	<select class="keyWord" name="kewWord" id="categoryKeyWord">
			<c:forEach items="${categoryList }" var="category">
				<option class="category" value="${category.hosBoardCategoryCode }">${category.hosBoardCategoryName }</option>
			</c:forEach>
    	</select>
    	<button id="search">검색</button>
    </div>
    <div id="pagingDiv"></div>
		<button id="write" type="button">글 쓰기</button>
	</div>
	<script>
		var $stringKeyWord = $("#stringKeyWord").clone();
		var $categoryKeyWord = $("#categoryKeyWord").clone();
		
		$("#categoryKeyWord").remove();
		
		$("#pagingDiv").load("hosBoardPage.do?pageNo="+${pageNo}+"&listCount="+${listCount}+"&hosCode="+${hospital.hosCode});
		
		$("#search").click(function(){
			window.location.href = "/myvet/hos/hosBoard.do?hosCode=${hospital.hosCode}&keyWord=" + $(".keyWord").val() + "&searchType=" + $("#searchType").val();
		})
		
		$("#write").click(function(){
			window.location.href = "/myvet/hos/writeBoard.do?hosCode=${hospital.hosCode}"
		})
		
		$("#searchType").change(function() {
			$("#stringKeyWord").remove();
			$("#categoryKeyWord").remove();
			
			if ($(this).val() == 2) {
				$("#searchDiv").append($categoryKeyWord.clone());
			} else {
				$("#searchDiv").append($stringKeyWord.clone());
			}
		})
	</script>
</body>
</html>