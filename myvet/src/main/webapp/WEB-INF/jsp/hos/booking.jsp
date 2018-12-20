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
<link rel="stylesheet" href="<c:url value='/resources/css/hos/search.css'/>"/>
<style>

	.picker__button--today,
	.picker__button--close {
		color:black;
	}
	
	#bodyContainer {
		width: 1100px;
		overflow: auto;
		margin: auto;
		padding-top: 110px;
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
	
	.disable {
		display: none;
	}
	
	#blockTable {
		margin-top: 30px;
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
	
	.blockRow {
		height: 60px;
	}
	
   	.blockRow:nth-child(2n) {
  		background: rgba(255, 255, 255, 0.5);
  	}
  	
  	.blockRow:nth-child(2n-1) {
  		background: rgba(245, 233, 195, 0.5);
  	}
  	
  	.blockRow:hover,
  	.blockRow:nth-child(2n-1):hover {
  		background: #f4e8e6;
  	}
  	
  	#hosTitle {
  		font-size: 0.6em;
  		margin-left: 30px;
  	}
  	#controlTable {
  		border: none;
  		border-collapse: separate !important;
  	}
  	
  	.booking {
		padding: 5px;
  	}
  	
  	.booking:hover {
  		font-weight: bold;
  	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="background"></div>
	
	<c:choose>
	<c:when test="${empty petList }">
		<script>
			Swal({
			  type: 'error',
			  title: '등록된 반려동물이 없습니다.',
			  text: '반려동물 추가 후 예약 신청 해주세요!',
			}).then(function() {
				window.location.href = "/myvet/member/myPage.do";
			})
		</script>
	</c:when>
	<c:otherwise>
    <div id="bodyContainer">
   	    <h1>동물병원 예약 <span id="hosTitle">${hospital.title }</span></h1>
   	    <table id="controlTable">
   	    	<tr id="controlRow">
   	    		<td>
	   		   	    <span>예약일</span>
	   	       	    <input type="text" class="date" id="date">
   	    		</td>
   	    		<td>
    		    	<c:forEach items="${petList }" var="pet">
					<label for="pet${pet.petNo }">
		    			<div>
		    				<input type="radio" name="petNo" class="petNo" data-pet="${pet.petNo }" id="pet${pet.petNo }">
		 		   			<span>${pet.petName }</span>
			    		</div>
		    		</label>
			    	</c:forEach>
   	    		</td>
   	    		<td>
    		    	<select id="facilityType">
			    		<option class="type" value="1">진료</option>
	    				<option class="type" value="2">미용</option>
    				</select>
   	    		</td>
   	    	</tr>
   	    </table>



   		<table id="blockTable">
   			<tr id="thRow">
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
	    		
	    		if($(".petNo:checked").length == 0) {
	    			Swal({
	    				  type: 'error',
	    				  title: '선택된 반려동물이 없습니다.',
	    				  text: '반려동물 선택 후 예약 신청 해주세요!',
	    				}).then(function() {
							return;
	    				})
	    		} else {
	
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
		    		}).done(function(result) {
		    			if (result == 0) {
		    				Swal({
		    					  type: 'success',
		    					  title: '예약 접수',
		    					  text: '병원에서 예약 확정 / 취소 시 메시지로 알려드립니다.'
		    					})
		    			} else {
		    				Swal({
		    					  type: 'error',
		    					  title: '예약 실패',
		    					  text: '이미 동일한 시간에 예약기록이 있습니다.'
		    					})
		    			}
		    		})
	    		}
	    	})
    	}
    	
    </script>
    </c:otherwise>
    </c:choose>
</body>
</html>