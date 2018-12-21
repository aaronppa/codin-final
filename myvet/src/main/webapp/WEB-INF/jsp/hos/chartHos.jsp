<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차트 목록(병원) - MyVet</title>
	<script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>
    <script src="<c:url value='../resources/js/vendor/foundation.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='../resources/css/common/foundation.css'/>"/>
	<script src="<c:url value='/resources/js/timepicker/jquery.timepicker.js'/>"></script>
	<script src="<c:url value='/resources/js/datepicker/picker.js'/>"></script>
	<script src="<c:url value='/resources/js/datepicker/picker.date.js'/>"></script>
	<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.date.css'/>"/>
	
    <style>
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
    
        #body {
            width:1100px;
            margin: auto;
            margin-top: 110px;
        }
        
        #chartList {
	   		background: rgba(245, 233, 195, 0.5);
            display: inline-block;
            width: 73%;
            height: 500px;
            position: relative;
            top: 0px;
            left: 0px;
            overflow: auto;
            margin: 20px 0px;
        }
        
        #patientList {
            margin-left: 20px;
            display: inline-block;
            width: 23%;
            height: 500px;
            /* border: 1px solid black; */
            position: relative;
            top: 0px;
            left: 0px;
            overflow: auto;
            text-align: center;
        }
        #patientList ul {
        	text-align: left;
        }
        
        .marginLeft{
            margin-left: 20px;
        }

        .chartDetail{
            display: inline-block;
            cursor: pointer;
        }
        
        #register {
        	display: inline-block;
        	border: 1px solid black;
        	padding: 3px;
        	background-color: #8b787a;
        	color: white;
        	border-radius: 3px;
        	line-height: 1;
        	cursor: auto;
        }
        
        .chartRow {
        	width: 95%;
        	overflow: auto;
	   		background: rgba(139, 120, 122, 0.5);
	   		margin-bottom: 10px;
	   		margin-top: 20px;
	   		margin-left: 20px;
	   		padding: 10px;
	   		border: 1px solid #412427;
        }
        
        .panel-body {
        	margin-left: 15px;
        }
        
        .disable {
        	display: none;
        }
        
        .selected {
        	background-color: #ffffdd;
        }
        
        .accordion-title {
        	font-size: 18px !important;
        }
        
        a {
        	color: black !important;
        }
        
        #chartDiv {

        }
    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="background"></div>

    <div id="body">
        <h1>차트 목록</h1>
        <h5>병원명 : <span>${hospital.title }</span></h5>
        <h5>진료의 : <span>${user.memberName }</span></h5>
        <input type="hidden" id="bookingNo" value="-1"><br>
        <button id="writeChart">차트 작성</button><br>
        <div id="chartList">
            <div class="columns" id="chartDiv">
            
	            <div class="panel-group chartRow disable">
					 <div class="panel panel-default">
					   <div class="panel-heading">
					      <h4 class="panel-title">
					        <a class="href" data-toggle="collapse" href="#collapse1"><span class="owner"></span> 님 / <span class="pet"></span> / <span class="regDate"></span></a>
					      </h4>
					    </div>
					    <div class="panel-collapse collapse idDiv">
					      <div class="panel-body">
					        <span>진료일 : </span><span class="regDate">2018-11-30</span>
                            <span class="marginLeft">보호자 성명 : </span><span class="owner"></span> 님
                            <span class="marginLeft">동물 이름 : </span><span class="pet"></span>
                            <br>
                            <span>병명 : </span><span class="disease"></span><br>
                            <span>주요 처치 내용 : </span><span class="diagnosis"></span><br>
                            <span>주의사항 : </span><span class="warning"></span><br>
                            <span>다음 진료일 : </span><span class="nextBooking"></span><br>
                            <span>최근 수정일 : </span><span class="editDate"></span><br>
						  </div>
					      <div class="panel-footer"></div>
	                        <a class="chartImg" href="#"> 첨부사진</a>
					      </div>
					  </div>
            	</div>
            </div>
        </div>
        <div id="patientList">
        	<div>날짜<br>
       	 	    <input type="text" class="date" id="date" value="${date }">
        	</div>
           	<div class="booking">
				<h5>예약 환자</h5>
               	<div class="columns">
                	<ul id="bookingUl" class="accordion" data-accordion data-multi-expand="true" data-allow-all-closed="true">
                    <li class="accordion-item bookingRow disable" data-accordion-item>
                        <a href="#" class="accordion-title"><span class="owner"></span> 님 / <span class="pet"></span></a>
                        <div class="accordion-content" data-tab-content >
                            <div class="patientDetail">
                            	<span>진료 예약 시간 : <span class="time"></span></span><br>
                                <span>보호자 성명 : <span class="owner"></span> 님</span><br>
                                <span>동물 이름 : <span class="pet"></span></span><br>
                                <input type="hidden" class="petNo">
                                <input type="hidden" class="bookingNo">
<!--                            <span>최근 방문일 : 2018-11-30</span><br> -->
                            </div>
                        </div>
                    </li>
                    </ul>
                </div>
            </div>
			<div class="reception">
				<h5>현장 접수 환자</h5>
				<div class="columns">
					<ul id="receptionUl" class="accordion" data-accordion data-multi-expand="true" data-allow-all-closed="true">
						<li class="accordion-item receptionRow disable" data-accordion-item>
	                        <a href="#" class="accordion-title"><span class="owner"></span> 님 / <span class="pet"></span></a>
	                        <div class="accordion-content " data-tab-content >
							<div class="patientDetail">
                                <span>보호자 성명 : <span class="owner"></span> 님</span><br>
                                <span>동물 이름 : <span class="pet"></span></span><br>
                                <input type="hidden" class="petNo">
                                <input type="hidden" class="bookingNo">
							</div>
						</li>
					</ul>
				 </div>
				</div>
            </div>
            <button id="register" type="button">현장접수</button>
        </div>
    </div>
    <script>
    
        var $bookingRow = $(".bookingRow").clone().removeClass("disable");
        var $receptionRow = $(".receptionRow").clone().removeClass("disable");
        var $chartRow = $(".chartRow").clone().removeClass("disable");
        var triger1 = false;
        var triger2 = false;
        
		function doFoundation() {
			if (triger1 == true && triger2 == true) {
		        $(document).foundation();
		        patientDetail();
			}			
		}

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
      	    })

        $.ajax({
        	type: "post",
        	url: "/myvet/hos/bookingListByDay.do",
        	data: {
        		hosCode: ${hospital.hosCode},
        		date: $("#date").val()
        	}
        }).done(function(bookingList){
        	console.dir(bookingList)
			for (let i = 0; i < bookingList.length; i++) {
	        	var $newRow = $bookingRow.clone();
	        	$newRow.find(".owner").text(bookingList[i].member.memberName);
	        	$newRow.find(".pet").text(bookingList[i].pet.petName);
	        	$newRow.find(".petNo").val(bookingList[i].bookingPet);
	        	$newRow.find(".bookingNo").val(bookingList[i].bookingNo);
	        	$newRow.find(".time").text(bookingList[i].hosBlock.blockStart);
				$("#bookingUl").append($newRow);
			}        	
        	triger1 = true;
        	doFoundation();
        })
        
        $.ajax({
        	type: "post",
        	url: "/myvet/hos/receptionListByDay.do",
        	data: {
        		hosCode: ${hospital.hosCode},
        		date: $("#date").val()
        		}
        }).done(function(receptionList){
        	console.dir(receptionList)
        	
			for (let i = 0; i < receptionList.length; i++) {
	        	var $newRow = $receptionRow.clone();
	        	$newRow.find(".owner").text(receptionList[i].member.memberName);
	        	$newRow.find(".pet").text(receptionList[i].pet.petName);
	        	$newRow.find(".petNo").val(receptionList[i].bookingPet);
	        	$newRow.find(".bookingNo").val(receptionList[i].bookingNo);
				$("#receptionUl").append($newRow);
			}        	
        	
        	triger2 = true;
        	doFoundation();
        })

       	function patientDetail() {
        	$(".patientDetail").parent().click(function(){
        		$(".selected").removeClass("selected");
        		$(this).addClass("selected");
        		$("#bookingNo").val($(this).find(".bookingNo").val())
        		console.log($(this).find(".bookingNo").val());
        		
        		$.ajax({
        			type: "post",
        			url: "/myvet/hos/chartListByPetNo.do",
        			data: {bookingNo: $("#bookingNo").val()}
        		}).done(function(chartList) {
	        		$(".chartRow").remove()
        			console.dir(chartList)

        			for (let i = 0; i < chartList.length; i++) {
        				var $newRow = $chartRow.clone();
        				$newRow.find(".idDiv").attr("id", "collapse"+chartList[i].chartNo);
        				$newRow.find(".href").attr("href", "#collapse"+chartList[i].chartNo);
        				$newRow.find(".regDate").text(chartList[i].chartRegDate);
        				$newRow.find(".owner").text(chartList[i].member.memberName);
        				$newRow.find(".pet").text(chartList[i].pet.petName);
        				$newRow.find(".disease").text(chartList[i].disease);
        				$newRow.find(".diagnosis").text(chartList[i].diagnosis);
        				$newRow.find(".warning").text(chartList[i].warning);
        				$newRow.find(".editDate").text(chartList[i].chartEditDate);
        				$newRow.find(".nextBooking").text(chartList[i].nextBooking);
        				$newRow.find(".chartImg").attr("href", chartList[i].chartNo);
        				
        				$("#chartDiv").append($newRow);
        			}
	        		$(".chartImg").click(function(e){
	        			e.preventDefault();
		        		
		        		window.open("/myvet/hos/chartImg.do?chartNo="+$(this).attr("href"),
		        					"chartImg",
									"width=1100, height=800, location=no"
						);		
	        		})

        		})
	       		$('.collapse').collapse()
        		
       			console.dir($(".chartImg").attr("href"));
        	})
        }
        
        $("#writeChart").click(function(){
			if ($("#bookingNo").val() == -1) {
				swal({
					  type: 'error',
					  title: '아이가 없어요!',
					  text: '선택된 진료대상이 없습니다.'
				}).then(function(){
					return
				})
			} else {
	        	window.open("/myvet/hos/writeChart.do?bookingNo=" + $("#bookingNo").val(), 
        				"writeChart",
        				"width=850, height=1000, location=no");
			}
        	
        })
        
        $("#register").click(function(){
        	window.open("/myvet/hos/reception.do?hosCode="+${hospital.hosCode}, "reception", "width=850, height=850, location=no");
        })

        $("#date").change(function(){
        	window.location.href = `/myvet/hos/chartHos.do?hosCode=${hospital.hosCode}&date=` + $("#date").val();
        })
        
    </script>
</body>
</html>