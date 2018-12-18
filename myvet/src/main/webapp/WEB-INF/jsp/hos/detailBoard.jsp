<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#bodyContainer{
			width: 1100px;
			margin: auto;
			margin-top: 110px;
		}
		
		disable {
			display: none;
		}
	</style>
	
<!--     include libraries(jQuery, bootstrap) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />     
	       
	<div id="bodyContainer">
		제목 : [<span id="category">${board.hosBoardCategoryCode }</span>]<span id="boardTitle">${board.hosBoardTitle }</span><br>
		작성자 : <span id="writer">${board.hosBoardWriterNo }</span><br>
		조회수 : <span id="viewCnt">${board.hosBoardViewCnt }</span><br>
		작성일 : <span id="regDate">${board.hosBoardRegDate }</span><br>
		내용<br>
		<div>
			${board.hosBoardContent }
		</div>
		<button type="button" id="delete">삭제</button>
		<button type="button" id="edit">수정</button>
		<button type="button" id="list">목록</button>
	</div>
	
	<script>
		$("#edit").click(function(){
			window.location.href="editBoard.do?hosBoardId=${board.hosBoardId }"
		})

		$("#list").click(function(){
			window.location.href="hosBoard.do?hosCode=${board.hosCode }"
		})
	</script>
</body>
</html>