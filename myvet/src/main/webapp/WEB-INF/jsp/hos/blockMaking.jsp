<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 블럭 만들기 (${hospital.title }) - MyVet</title>
    <style>
    #bodyContainer {
        width: 1100px;
        margin: auto;
        margin-top: 30px;
    }

    .inline {
        display: inline-block;
    }

    .marginLeft{
        margin-left: 50px;
    }

	#blockTable,
	#blockTable tr,
	#blockTable th,
	#blockTable td {
		border-collapse: separate;
		border-spacing: 0px;
		border: 1px solid black;
	}

    #blockTable {
        width: 100%;
    }

    #blockTable th {
        text-align: center;
		height: 40px;    
    }
    
    .height-down {
    	height: 20px !important;
    }

    #blockTable td,
    .center{
        text-align: center;
    }
    .picker {
        width: 50px;
    }
    
    .button-td {
    	padding: 10px 0px;
    }
    
    .margin-top{
    	margin-top: 10px;	
    }
    
    #buttonArea {
    	margin-top: 30px;
    	text-align: center;
    }
    
    .big-checkbox {
    	width:20px;
    	height:20px;
    }
    
    .picker {
    	text-align: center;
    }
    
    .maxBook {
    	width: 50px;
    	text-align: center;
    }
    
    .borderBottom{
     	border-bottom: none !important; 
    }
    
    .borderTop {
    	border-top: none !important;
    }
    
    #nextWeek,
    #lastWeek {
    	color: #000000;
    	text-decoration: none;
    }
    
    </style>
	<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<c:url value='/resources/js/timepicker/jquery.timepicker.css'/>"/>
	<script src="<c:url value='/resources/js/timepicker/jquery.timepicker.js'/>"></script>
	
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
    <div id="bodyContainer">
        <div>
            <h1 class="inline">예약 블럭 만들기</h1>
            <span class="marginLeft">${hospital.title }</span>
            <input type="hidden" id="hosCode" name="hosCode" value="${hospital.hosCode }">
        </div>
        <div>
            <input type="checkbox" name="medical" id="medical" value="on">
            <label for="medical">진료</label>
            <input type="checkbox" name="beauty" id="beauty" value="on">
            <label for="beauty">미용</label>
        </div>
        
        <div>
           		  <%
           			 Calendar cal = (Calendar) request.getAttribute("cal");
          			 cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY); 
					 SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				  %>
            <h3 class="center">
            	<a id="lastWeek" style="margin-right: 50px" href="<%=sdf.format(cal.getTime())%>"><<</a>
            	<%=sdf.format(cal.getTime()) %>
            	 ~ 
            	<% 
            		cal.add(Calendar.DATE, 6);
            	%>
            	<%=sdf.format(cal.getTime()) %>
            	<a id="nextWeek" style="margin-left: 50px" href="<%=sdf.format(cal.getTime())%>">>></a>
            	</h3>
        </div>
        <table id="blockTable">
            <tr>
                <th rowspan="2"></th>
                <th class="height-down borderBottom">월</th>
                <th class="height-down borderBottom">화</th>
                <th class="height-down borderBottom">수</th>
                <th class="height-down borderBottom">목</th>
                <th class="height-down borderBottom">금</th>
                <th class="height-down borderBottom">토</th>
                <th class="height-down borderBottom">일</th>
            </tr>
            <tr>
     		  <%
           			 cal.add(Calendar.DATE, -7); 
           		 	 for (int i = 0; i < 7; i++) {
           			 cal.add(Calendar.DATE, 1); %>
	                 <th class="height-down borderTop">
	                 <fmt:formatDate value="<%=cal.getTime()%>" pattern="MM/dd"/>
	                 <input 
	                 	class="date" 
	                 	type="hidden" 
	                 	name="date"
	                 	data-day="<%=i %>"
	                 	value=<fmt:formatDate value="<%=cal.getTime()%>" pattern="yyyy/MM/dd"/>
	                 >
	                 </th>
           		  <% } %>
            </tr>
            <tr>
                <th>
                    휴무일   
                </th>
                <c:forEach begin="0" end="6" var="i">
                <td>
                	<input class="big-checkbox" type="checkbox" data-dayoff="${i }" name="dayOff${i }">
                </td>
                </c:forEach>
           	</tr>
            <tr>
                <th>
                    진료시간
                </th>
                <c:forEach var="i" begin="0" end="6" >
	                <td>
	                    <input class="picker" type="text" name="openTime" data-date="${i }" value="09:00"> ~ 
	                    <input class="picker" type="text" name="closeTime" data-date="${i }" value="18:00">
	                </td>
                </c:forEach>
            </tr>
            <tr>
                <th>
                    예약간격
                </th>
                <c:forEach var="i" begin="0" end="6">
	                <td>
	                    <select name="bookInterval" id="book-interval" data-date="${i }">
	                        <option value="15">15분</option>
	                        <option value="30" selected="selected">30분</option>
	                        <option value="60">1시간</option>
	                    </select>
	                </td>    
                </c:forEach>
            </tr>
            <tr class="breakTime">
                <th id="breakTime-th" rowspan="1">
                    휴게시간
<!--                     <br> -->
<!--                     <button class="margin-top" id="addBreak">추가</button> -->
                </th>
                <c:forEach var="i" begin="0" end="6" >
	                <td>
	                    <input class="picker" type="text" name="breakStart" data-date="${i }" value="13:00"> ~ 
	                    <input class="picker" type="text" name="breakEnd" data-date="${i }"  value="14:00">
	                </td>
	            </c:forEach>
            </tr>
            <tr>
            	<th>
            		최대 예약 수
            	</th>
            	<c:forEach var="i" begin="0" end="6" >
	                <td>
	                    <input class="maxBook" type="number" name="maxBook" id="max-book" data-date="${i }">
	                </td>
	            </c:forEach>
            </tr>
            <tr>
                <th>
                    일괄적용
                </th>
                <c:forEach var="i" begin="0" end="6" >
	                <td class="button-td">
	                    <button class="weekday" data-date="${i }" >평일 일괄 적용</button> <br>
	                    <button class="weekend margin-top" data-date="${i }" >주말 일괄 적용</button> <br>
	                    <button class="dayall margin-top" data-date="${i }" >모두 일괄 적용</button> <br>
	                </td>
	            </c:forEach>
            </tr>  
        </table>
        <div id="buttonArea">
	        <button id="submit">저장</button>
        </div>
    </div>
    <script>
    	var errMessage = "";
    	var $breakTime = $(".breakTime").clone();
    	$breakTime.find("th").remove();

        $('.picker').timepicker({'timeFormat' : 'H:i'})
        
        $('#addBreak').click(function(){
        	$(".breakTime:last").after($breakTime.clone());
        	$("#breakTime-th").attr({rowspan: parseInt($("#breakTime-th").attr("rowspan"))+1})
            $('.picker').timepicker({'timeFormat' : 'H:i'})
            for (let i = 0; i < 7; i++) {
            	disable(i);
            }
        })
        
        $('.big-checkbox').click(function() {
        	var dayoff = $(this).data("dayoff");
        	console.dir(dayoff);
        	console.dir($("#blockTable").find("[data-date="+dayoff+"]"))
        	disable(dayoff);
        })
        
		$(".big-checkbox[data-dayoff="+5+"]").click();
		$(".big-checkbox[data-dayoff="+6+"]").click();
        
        $('.weekday').click(function() {
        	var date = $(this).data("date");
        	dataCopy(date, 0, 4)
        })
        
        $('.weekend').click(function() {
        	var date = $(this).data("date");
			
        	dayOpen(5);
        	dayOpen(6);
        	
        	dataCopy(date, 5, 6)
        })
        
        $('.dayall').click(function() {
        	var date = $(this).data("date");
        	
        	for(let i = 0; i < 7; i++) {
        		dayOpen(i);
        	}

        	dataCopy(date, 0, 7)
        })
        
        $('#lastWeek').click(function(e) {
        	e.preventDefault();
        	var date = new Date($(this).attr("href"));
        	date.setDate(date.getDate() -7);
        	var dateParam = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
         	window.location.href = "/myvet/hos/blockMaking.do?hosCode=" + ${hospital.hosCode} + "&date="+dateParam
        })
        
        $('#nextWeek').click(function(e) {
        	e.preventDefault();
        	var date = new Date($(this).attr("href"));
        	date.setDate(date.getDate());
        	var dateParam = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
         	window.location.href = "/myvet/hos/blockMaking.do?hosCode=" + ${hospital.hosCode} + "&date="+dateParam
        })

        $('#submit').click(function(){
        	for (let i = 0; i < 7; i++) {
            	if ($(".big-checkbox[data-dayoff="+i+"]").is(":checked")) {
            		continue;
            	}
        	
	        	var $sendDate = $("#blockTable").find("[data-date="+i+"]");
	        	console.dir($sendDate);
        		var booking = new Object();
        		for (let l = 0; l < $sendDate.length; l++) {
					booking[$sendDate[l].name] = $sendDate[l].value;
        		}
        		booking.date = $("#blockTable").find("[data-day="+i+"]").val();
        		if ($("#medical").is(":checked")) booking.medical = "on";
        		if ($("#beauty").is(":checked")) booking.beauty = "on";
        		booking.hosCode = $("#hosCode").val();
        		
        		console.dir(booking);
				$.ajax({
					url:"/myvet/hos/createBlock.do",
					method: "post",
					data: booking,
					async: false, 
					error: function() {
						alert("이미 등록된 날짜입니다. " + booking.date)
						}
					}
				)
        	}
        	
        })
        
        
        function disable(dayoff) {
        	if ($(".big-checkbox[data-dayoff="+dayoff+"]").is(":checked")) {
	        	$("#blockTable").find("[data-date="+dayoff+"]").attr("disabled", "disabled");
        	} else {
        		$("#blockTable").find("[data-date="+dayoff+"]").removeAttr("disabled");
        	}
        	$("[disabled=disabled]").val("");
        }
        
        function dataCopy(date ,begin, end) {
        	var orgData = $("#blockTable").find("[data-date="+date+"]");
        	
        	for (let i = begin; i <= end; i ++) {
        		let copyData = $("#blockTable").find("[data-date="+i+"]")
        		for (let l = 0; l < copyData.length; l++) {
        			copyData[l].value = orgData[l].value
        		}
        	}
        	$("[disabled=disabled]").val("");
        }        
        
        function dayOpen(date) {
        	if ($(".big-checkbox[data-dayoff="+date+"]").is(":checked")) {
        		$(".big-checkbox[data-dayoff="+date+"]").click();
        	}
        }
        
        function blockError(request,status,error) {
        	errMessage = errMessage + request.responseText + "/n";
        }
    </script>
</body>
</html>