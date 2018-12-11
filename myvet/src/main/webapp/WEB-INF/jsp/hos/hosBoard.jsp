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
    <table id="boardTable" class="hover">
        <thead>
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
        				   href="<c:url value="/notice/boardDetail.do?boardCode=${board.boardCode }"/>">
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
		<button id="write" type="button">글 쓰기</button>
	</div>
	<script>
		$("#write").click(function(){
			window.location.href = "/myvet/hos/writeBoard.do?hosCode=${hospital.hosCode}"
		})
	</script>
</body>
</html>