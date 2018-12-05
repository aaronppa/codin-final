<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 관리</title>
<script
   src="https://code.jquery.com/jquery-3.3.1.js"
   integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
   crossorigin="anonymous"></script>
<style>
	#bodyContainer {
		width:1100px;
		margin: auto;
		margin-top: 30px;
	}
	
	#bookingTable{
		width:100%;
	}
	
	.margin-left{
		margin-left: 30px;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="bodyContainer">

	<button id="blockMake">예약 블럭 만들기</button>
	<button id="blockEdit">예약 블럭 수정/삭제</button><br>
	<span id="blockMaking">예약 확정/거부</span>
	<table id="bookingTable">
		<tr>
			<th>예약 고객명</th>
			<th>반려동물명</th>
			<th>예약시간</th>
			<th>예약종류</th>
			<th>승인 / 거부</th>
		</tr>
		<tr class="bookingRow">
			<td class="owner"></td>
			<td class="pet"></td>
			<td class="bookingTime"><span class="startTime"></span> ~ <span class="endTime"></span></td>
			<td class="type"></td>
			<td class="button"><button>승인</button><button class="margin-left">거부</button></td>
		</tr>
	</table>
	</div>
	<script>
		$("#blockMake").click(function(){
			window.location.href = "/myvet/hos/blockMaking.do"
		})
	</script>
</body>
</html>