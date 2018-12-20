<%@page import="kr.co.codin.repository.domain.HosBlock"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/hos/search.css'/>"/>
   	<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
	<style>
    body {
    	font-family: 'Gamja Flower', cursive !important;
    	font-size: 20px !important;
    	padding-top: 50px;
   	}
   	
   	th, td {
		text-align: center !important;
	}
	
	th {
		color: #ffffff;
		background-color: #412427;
		height: 40px;
		padding : 10px;
		border: none;
	}
	
	.bookingRow {
		height: 60px;
	}
	
   	td:nth-child(2n) {
  		background: rgba(255, 255, 255, 0.5);
  	}
  	
  	td:nth-child(2n-1) {
  		background: rgba(245, 233, 195, 0.5);
  	}
  	
  	td:hover,
  	td:nth-child(2n-1):hover {
  		background: #f4e8e6;
  	}
  	
  	#formTable {
  		margin: auto;
  	}
  	
  	#buttonArea {
  		text-align: center;
  	}
  	
  	input {
  		text-align: center;
  		border: none;
  		background: #dddddd;
  		width: 70%;
    	font-family: 'Gamja Flower', cursive !important;
    	font-size: 20px !important;
  	}
  	
  	h2 {
  		margin-left: 30px;
  	}
	</style>
</head>
<body>
	<h2>예약 블럭 수정</h2>
	<table id="formTable">
		<%HosBlock block = (HosBlock) request.getAttribute("block"); %>
		<input type="hidden" id="blockCode" value="<%=block.getBlockCode() %>">
		<tr>
			<th>예약 시간</th>
 			<td>
 				<%=block.getBlockStart().toString() %> ~ <%=block.getBlockEnd().toString() %>
			</td>
		</tr>
		<tr>
			<th>예약종류</th>
			<td>
			
			<%if(block.getFacilityNo() == 1) { %>
			진료
			<%} else if(block.getFacilityNo() == 2) { %>
			미용
			<%} %>

			</td>
		</tr>
		<tr>
			<th>현재 예약 수</th>
			<td>0</td>						<!-- 추후 추가 예정 -->
		</tr>
		<tr>
			<th>최대 예약 수</th>
			<td><input type="number" id="max-booking" value="<%=block.getMaxBooking() %>"></td>
		</tr>
	</table>
	<div id="buttonArea">
		<button id="submit">수정</button>
	</div>
</body>
	<script>
		$("#submit").click(function(){
			$.ajax({
				type: "post",
				url: "/myvet/hos/blockEditing.do",
				data: {
						blockCode: $("#blockCode").val(),
						maxBooking: $("#max-booking").val()
					  }
			}).done(function() {
				opener.parent.location.reload();
				window.close();
			})
		})
	</script>
</html>