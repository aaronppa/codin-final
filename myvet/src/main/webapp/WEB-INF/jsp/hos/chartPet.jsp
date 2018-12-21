<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>진료 차트 조회(${booking.pet.petName }) - MyVet</title>
    <style>
   	    body {
	    	font-family: 'Gamja Flower', cursive !important;
	    	font-size: 20px !important;
	    	padding-top: 50px;
	   	}
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
        
        th, td {
		text-align: center !important;
	}
	
	th {
		color: #ffffff;
		background-color: #412427;
		width: 150px;
		height: 40px;
		padding : 10px;
		border: none;
	}
	
	td {
		background-color: rgba(244, 232, 230, 0.5)
	}
	
	.bookingRow {
		height: 60px;
	}
	
	tr {
		border-bottom: 1px solid black;
	}
	
	.lastTr {
		border-bottom: none;
	}
	
/*   	#resultTable, */
/*   	#resultTable tr, */
/*   	#resultTable th, */
/*   	#resultTable td */
  	
/*   	 { */
/*   		border-collapse: collapse; */
/*   		border: 1px solid black; */
/*   	} */
  	
  	#disease,
  	#date {
  		border:none;
  		width: 100%;
  		height: 50px;
  		text-align: center;
  		background-color: rgba(244, 232, 230, 0.5);
  	}
  	
  	textarea {
  		border:none;
  		resize: none;
  		background-color: rgba(244, 232, 230, 0.5);
  	}
  	
    </style>
<script src="<c:url value='/resources/js/vendor/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.js'/>"></script>
<script src="<c:url value='/resources/js/datepicker/picker.date.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/js/datepicker/default.date.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/search.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">

</head>
<body>
    <div id="body">
	    <h1>차트 조회</h1>
	    <table>
	        <tr>
	            <th id="shortTh">
	                보호자
	            </th>
	            <td>
		            ${chart.member.memberName }
	            </td>
	        </tr>
	        <tr>
	            <th>
	                동물 이름
	            </th>
	            <td>
	                ${chart.pet.petName }
	            </td>
	        </tr>
	        <tr class="lastTr">
	            <th>
	                진료일
	            </th>
	            <td>
	                ${chart.chartRegDate }
	            </td>
	        </tr>
	    <tr>
	    </table>
	    <h2>진료 내용</h2>
		    <table id="resultTable">
		        <tr>
		            <th>병명</th>
		            <td>${chart.disease }</td>
		        </tr>
		        <tr>
		            <th>처치 내용</th>
		            <td>${chart.diagnosis }</td>
		        </tr>
		        <tr>
		            <th>주의사항</th>
		            <td>${chart.warning }</td>
		        </tr>
		        <tr>
		        	<th>다음 내원일</th>
		        	<td>${chart.nextBooking }</td>
		        </tr>
		        <tr class="lastTr">
		        	<th>첨부파일</th>
					<td><button class="viewImg" data-chart="${chart.chartNo }">조회하기</button></td>
		        </tr>
		    </table>
	    <div id="submitContainer">
		    <button type="button" id="close">닫기</button>
	    </div>
    </div>
    <script>
    	$thumb = $(".thumb").clone().removeClass("disable");
    
  		$("#close").click(function() {
			window.close();
		})

		$(".viewImg").click(function() {
			window.open("/myvet/hos/chartImg.do?chartNo="+$(this).data("chart"),
					"chartImg",
					"width=1100, height=800, location=no")
		})
    </script>
</body>
</html>