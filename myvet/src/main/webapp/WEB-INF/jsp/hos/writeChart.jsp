<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차트 작성 - MyVet</title>
    <style>
        #body {
            width: 80%;
            margin: auto;
        }
        
        .td1 {
            text-align: center;
            width: 40px;
        }
        
        .td2 {
            text-align: center;
            width: 35%;
        }
        
        .disable {
        	display:none;
        }
        
        #pet-name{
        	width: 50%
        }
        
        #submitContainer{
        	text-align: center;
        }
        
        .chartText {
        	width: 100%;
        	height: 150px;
        }
        
        #disease {
        	width:100%;
        	text-align: center;
        }
        
        .thumb {
        	width: 320px;
        	height: 180px;
        	position: relative;
         	margin-left: 15px; 
        }
        
        #thumbs {
        	height: 200px;
		    overflow: auto;
		    overflow-x: scroll;
		    white-space: nowrap;
        }
    </style>
<script src="<c:url value='/resources/js/vendor/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.date.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.date.css'/>"/>
</head>
<body>
    <div id="body">
	    <h1>차트 작성</h1>
	    <table>
	    <form action="/myvet/hos/insertChart.do" id="form" method="POST" enctype="multipart/form-data">
	            <input type="hidden" name="hosCode" value="${booking.hosCode }"><br>
        		<input type="hidden" name="bookingNo" value="${booking.bookingNo }"><br>
        		<input type="hidden" name="vetNo" value="${user.memberNo }"><br>
	    
	        <tr>
	            <th>
	                보호자
	            </th>
	            <td>
		            ${booking.member.memberName }
	                <input type="hidden" name="memberNo" value="${booking.bookingOwner }">
	            </td>
	        </tr>
	        <tr>
	            <th>
	                동물 이름
	            </th>
	            <td>
	                ${booking.pet.petName }
	                <input type="hidden" name="petNo" value="${booking.bookingPet }">
	            </td>
	        </tr>
	    <tr>
	    </table>
	    <h2>진료 내용</h2>
		    <table id="resultTable">
		        <tr>
		            <th>병명</th>
		            <td><input type="text" name="disease" id="disease"></td>
		        </tr>
		        <tr>
		            <th>처치 내용</th>
		            <td><textarea class="chartText" name="diagnosis"></textarea></td>
		        </tr>
		        <tr>
		            <th>주의사항</th>
		            <td><textarea class="chartText" name="warning"></textarea></td>
		        </tr>
		        <tr>
		        	<th>다음 내원일</th>
		        	<td><input type="text" class="date" id="date" name="nextBooking"></td>
		        </tr>
		        <tr>
		        	<th>첨부파일</th>
		        	<td><input type="file" name="chartImg" id="chartImg" multiple></td>
		        </tr>
		    </table>
        	<div id="thumbs" class="disable" colspan="2">
        		<img class="thumb disable" src="#" />
        	</div>
	    </form>
	    <div id="submitContainer">
		    <button type="button" id="submit">저장</button>
	    </div>
    </div>
    <script>
    	$thumb = $(".thumb").clone().removeClass("disable");
    
  		$("#submit").click(function() {
  			$("#form")[0].submit();
  		})
  		
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
			 min: true
   	    })
   	    
   	    function readURL(input, i) {

          if (input.files && input.files[i]) {

            var reader = new FileReader();
            reader.onload = function(e) {

              $('.thumb:eq('+i+')').attr('src', e.target.result);

            }
            reader.readAsDataURL(input.files[i]);
          }
        }


        $("#chartImg").change(function() {
			$(".thumb").remove();
        	$("#thumbs").removeClass("disable");
        	
        	console.dir(this);
        	console.dir(this.files.length);
        	
        	for (let i = 0; i < this.files.length; i++) {
        		$("#thumbs").append($thumb.clone());
	            readURL(this, i);
        	}

        });
    </script>
</body>
</html>