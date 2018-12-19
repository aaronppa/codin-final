<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${hospital.title } 예약하기 - MyVet</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/timepicker/jquery.timepicker.css'/>"/>
<script src="<c:url value='/resources/js/timepicker/jquery.timepicker.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.date.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.date.css'/>"/>

<style>

	.picker__button--today,
	.picker__button--close {
		color:black;
	}
	
	#bodyContainer {
		width: 1100px;
		overflow: auto;
		margin: auto;
		margin-top: 30px;
	}
	
	.disable {
		display: none;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <div id="bodyContainer">
   	    <h1>동물병원 예약</h1>
   	    <span>예약일</span>
   	    <input type="text" class="date" id="date">
    	<c:forEach items="${petList }" var="pet">
			<label for="pet${pet.petNo }">
    		<div>
    			<input type="radio" name="petNo" class="petNo" data-pet="${pet.petNo }" id="pet${pet.petNo }">
 		   		<span>${pet.petName }</span>
    		</div>
    		</label>
    	</c:forEach>
    	<select id="facilityType">
    		<option class="type" value="1">진료</option>
    		<option class="type" value="2">미용</option>
    	</select>
   		<table id="blockTable">
   			<tr>
   				<th>예약 시간</th>
				<th>현재 예약 가능 여부</th>
				<th>예약 신청</th>
   			</tr>
	    	<tr class="blockRow disable motherRow">
	    	<td class="blockTime">
	    		${block.blockStart } ~ ${block.blockEnd }
    		</td>
	    		<td class="possibility">가능</td>
	    		<td><button class="booking">예약하기</button></td>
	    	</tr>
   			
	    	<c:forEach items="${blockList }" var="block">
		    	<tr class="blockRow">
			    	<td class="blockTime">
			    		${block.blockStart } ~ ${block.blockEnd }
		    		</td>
		    		<td class="possibility">가능</td>
		    		<td class="button"><button class="booking" data-block="${block.blockCode }">예약하기</button></td>
		    	</tr>
    		</c:forEach>
   		</table>
    </div>
    <script>
    	console.dir($(".type[value=${facilityNo}]"));
    
    	$(".type[value=${facilityNo}]").attr("selected", "selected");
    
	    Date.prototype.format = function(f) {
	        if (!this.valueOf()) return " ";
	     
	        var d = this;
	         
	        return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	            switch ($1) {
	                case "yyyy": return d.getFullYear();
	                case "MM": return (d.getMonth() + 1).zf(2);
	                case "dd": return d.getDate().zf(2);
	                default: return $1;
	            }
	        });
	    };
	     
	    String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	    String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	    Number.prototype.zf = function(len){return this.toString().zf(len);};

    
    	var $blockRow = $(".motherRow").clone().removeClass("disable").removeClass("motherRow");
    	
    	$("#date").val("${date}");
    	
    	$("#facilityType").change(function() {
    		window.location.href = "/myvet/hos/booking.do?hosCode=${hospital.hosCode}&date=" + $("#date").val() + "&facilityNo=" + $(".type:checked").val()
    	})	
    	
    	bookingClick()
    	
   	    $('.date').pickadate({
   	     monthsShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       	 weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
   	     showMonthsShort: true,
		 today: '오늘 선택',
		 clear: '',
		 close: '닫기',
		 labelMonthNext: '다음달로...',
		 labelMonthPrev: '이전달로...',
		 labelMonthSelect: '월 선택',
		 labelYearSelect: '연도 선택',
		 selectMonths: true,
		 selectYears: true,
		 format: 'yyyy-mm-dd',
		 formatSubmit: 'yyyy-mm-dd',
		 min: true,
		 onSet: changeDate
   	    })

   	    function changeDate() {
    		window.location.href = "/myvet/hos/booking.do?hosCode=${hospital.hosCode}&date=" + $("#date").val() + "&facilityNo=" + $(".type:checked").val()
    	}
   	    

    	function bookingClick() {
    		
	    	$(".booking").click(function(){
	    		console.log($(this));
	    		console.log($(this).data("block"));
	    		console.log($(".petNo:checked").data("pet"));
	    		$.ajax({
	    			url: "/myvet/hos/bookingSubmit.do",
	    			data: {
	    				blockCode: $(this).data("block"),
	    				bookingOwner: ${petList[0].memberNo},
	    				bookingPet: $(".petNo:checked").data("pet"),
	    				hosCode: ${hospital.hosCode}
		       			},
		       		type: "post"
	    		})
	    	})
    	}
    	
    </script>
</body>
</html>