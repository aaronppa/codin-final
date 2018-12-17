<%@page import="java.util.List"%>
<%@page import="kr.co.codin.repository.domain.HosBlock"%>
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
<title>예약 블럭 수정/삭제 (${hospital.title }) - MyVet</title>
    <style>
    #bodyContainer {
        width: 1100px;
        margin: auto;
        margin-top: 110px;
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
	<script src="<c:url value='/resources/js/datepicker/picker.js'/>"></script>
	<script src="<c:url value='/resources/js/datepicker/picker.date.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.date.css'/>"/>
	
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
    <div id="bodyContainer">
        <div>
            <h1 class="inline">예약 수정 / 삭제</h1>
            <span class="marginLeft">${hospital.title }</span>
            <input type="hidden" id="hosCode" name="hosCode" value="${hospital.hosCode }">
        </div>
        <div>
   	 	    <input type="text" class="date" id="date" value="${date }">
        	<table>
        		<tr>
        			<th>예약시간</th>
        			<th>예약종류</th>
        			<th>현재 예약 수</th>
        			<th>최대 예약 수</th>
        			<th>수정/삭제</th>
        		</tr>
				<%
					List<HosBlock> blockList = (List<HosBlock>) request.getAttribute("blockList");
					for (int i = 0; i< blockList.size(); i++) {
						HosBlock block = blockList.get(i); 
				%>
						
        		<tr class="blockRow">
        			<td>
        				<%=block.getBlockStart().toString() %> ~ <%=block.getBlockEnd().toString() %>
        			</td>
        			<td>
						<%if(block.getFacilityNo() == 1) { %>
						진료
						<%} else if(block.getFacilityNo() == 2) { %>
						미용
						<%} %>
        			</td>
        			<td><%=block.getCountBooking() %></td>							<!-- 예약 수 추가 예정 -->
        			<td><%=block.getMaxBooking() %></td>
        			<td>
        				<button class="edit" data-code="<%=block.getBlockCode() %>">수정</button>
        				<button class="delete" data-code="<%=block.getBlockCode() %>">삭제</button>
        			</td>
        		</tr>
				<%
					}
				%>
        	</table>
        </div>
    </div>
    <script>
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

		$(".edit").click(function() {
			var blockCode = $(this).data("code");
	    	window.open("/myvet/hos/blockEditForm.do?blockCode="+blockCode, "issue", "width=500, height=500, location=no");
		})
		
		$(".delete").click(function() {
			var blockCode = $(this).data("code");
	    	$.ajax({
	    		url: "/myvet/hos/blockDelete.do",
	    		data: {blockCode:blockCode}
	    	}).done(function(){
	    		location.reload()
	    	})
		})
		
		$("#date").change(function() {
			window.location.href = `/myvet/hos/blockEdit.do?hosCode=${hospital.hosCode}&date=` + $("#date").val();
		})
		
    </script>
</body>
</html>