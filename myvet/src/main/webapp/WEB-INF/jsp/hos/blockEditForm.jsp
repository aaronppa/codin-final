<%@page import="kr.co.codin.repository.domain.HosBlock"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

</head>
<body>
	예약 블럭 수정
	<table>
		<%HosBlock block = (HosBlock) request.getAttribute("block"); %>
		<input type="hidden" id="blockCode" value="<%=block.getBlockCode() %>">
		<tr>
			<th>예약 시간</th>
 			<td>
 				<%=block.getBlockStart().toString() %> ~ <%=block.getBlockEnd().toString() %>
			</td>
		</tr>
		<tr>
			<th>예약종류<th>
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
	<div>
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