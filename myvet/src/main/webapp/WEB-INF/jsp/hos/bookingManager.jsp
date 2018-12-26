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
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/search.css'/>"/>
<style>
	#bodyContainer {
		width:1100px;
		margin: auto;
		padding-top: 110px;
/* 		height: 500px; */
		overflow: auto;
	}
	
	#bookingTable{
		width:100%;
	}
	
	.margin-left{
		margin-left: 30px;
	}
	
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
	
	#pageTitle {
		margin-top: 20px;
		margin-bottom: 15px;
	}
	
	#date {
		text-align: center;
	}
	
	th, td {
		text-align: center !important;
	}
	
	#thRow {
		color: #ffffff;
		background-color: #412427;
		font-size: 1.3em;
		height: 40px;
	}
	
	.bookingRow {
		height: 60px;
	}
	
   	.bookingRow:nth-child(2n) {
  		background: rgba(255, 255, 255, 0.5);
  	}
  	
  	.bookingRow:nth-child(2n-1) {
  		background: rgba(245, 233, 195, 0.5);
  	}
  	
  	.bookingRow:hover,
  	.bookingRow:nth-child(2n-1):hover {
  		background: #f4e8e6;
  	}
  	
	.agree {
		background: #286090;
		color: #f5e9c3;
	}
  	
  	.ban {
  		margin-left: 20px;
  		background: #c9302c;
  		color: #f5e9c3
  	}
	
	.agree:hover,
	.ban:hover {
		font-weight: bold;
	}
	
	#hosTitle {
		color: black !important;	
		font-size: 0.6em !important;
	}
	
	.marginLeft {
		margin-left: 50px
	}
	
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />     
	<div id="background"></div>
	       
	<div id="bodyContainer">
	<input type="hidden" id="hosCode" value="${hospital.hosCode }">
	
	<button id="blockMake">예약 블럭 만들기</button>
	<button id="blockEdit">예약 블럭 수정/삭제</button><br>
	<h1 id="pageTitle">예약 확정/거부 <a id="hosTitle" href="/myvet/hos/hospital.do?hosCode=${hospital.hosCode }"><span class="marginLeft">${hospital.title }</span></a><br></h1>
	
   	<span>예약종류 : </span>
   	<select id="facilityType">
   		<option class="type" value="1">진료</option>
   		<option class="type" value="2">미용</option>
   	</select>

	<table id="bookingTable">
		<tr id="thRow">
			<th>예약일</th>
			<th>예약 고객명</th>
			<th>반려동물명</th>
			<th>예약시간</th>
			<th>예약종류</th>
			<th>처리여부</th>
			<th>승인 / 거부</th>
		</tr>
		<tr class="bookingRow">
			<input type="hidden" class="bookingNo">
			<td class="date"></td>
			<td class="owner"></td>
			<td class="pet"></td>
			<td class="bookingTime"><span class="startTime"></span> ~ <span class="endTime"></span></td>
			<td class="type"></td>
			<td class="confirm"></td>
			<td ><button class="agree">승인</button><button class="ban">거부</button></td>
		</tr>
	</table>
	</div>
	<script>
		var $bookingRow = $(".bookingRow").clone();
		$(".bookingRow").remove()
		
		function getBookingList() {
			$.ajax({
				url:"/myvet/hos/bookingList.do",
				data:{hosCode: ${hospital.hosCode }},
				async: false
			}).done(function(bookingList){
				console.dir(bookingList);
				for(let i = 0; i < bookingList.length; i++) {
					var $newRow = $bookingRow.clone();
					$newRow.find(".bookingNo").val(bookingList[i].bookingNo);
					$newRow.find(".date").text(bookingList[i].hosBlock.blockDay);
					$newRow.find(".owner").text(bookingList[i].member.memberName);
					$newRow.find(".pet").text(bookingList[i].pet.petName);
					$newRow.find(".startTime").text(bookingList[i].hosBlock.blockStart);
					$newRow.find(".endTime").text(bookingList[i].hosBlock.blockEnd);
					if (bookingList[i].confirm == 'N') {
						$newRow.find(".confirm").text("미처리");
					}
					if (bookingList[i].confirm == 'Y') {
						$newRow.find(".confirm").text("승인");
					}
					if (bookingList[i].confirm == 'B') {
						$newRow.find(".confirm").text("거부");
					}
					if (bookingList[i].hosBlock.facilityNo == 1) {
						$newRow.find(".type").text("진료");
					}
					if (bookingList[i].hosBlock.facilityNo == 2) {
						$newRow.find(".type").text("미용");
					}
					
					$("#bookingTable").append($newRow);
					
				}
				
				clickEvent()
				
			})
		}
		
		getBookingList();
	
		$("#blockMake").click(function(){
			window.location.href = "/myvet/hos/blockMaking.do?hosCode="+$("#hosCode").val();
		})
		
		$("#blockEdit").click(function(){
			window.location.href = "/myvet/hos/blockEdit.do?hosCode="+$("#hosCode").val();
		})
		
		function clickEvent() {
			$(".agree").click(function(){
				$.ajax({
					url: "/myvet/hos/confirmBooking.do",
					data: {bookingNo: $(this).parents(".bookingRow").find(".bookingNo").val()}
					}).done(function(){
						swal({
							  type: 'success',
							  title: '예약승인!',
							  text: '정상적으로 승인되었습니다.'
						}).then(function(){
							window.location.reload();
						})
					})
				})
			
			$(".ban").click(function(){
				console.log($(this).parents(".bookingRow").find(".bookingNo").val())
				$.ajax({
					url: "/myvet/hos/banBooking.do",
					data: {bookingNo: $(this).parents(".bookingRow").find(".bookingNo").val()}
					}).done(function(){
						swal({
							  type: 'error',
							  title: '예약거절!',
							  text: '정상적으로 거절되었습니다.'
						}).then(function(){
							window.location.reload();
						})
					})
				})
		}
	</script>
</body>
</html>