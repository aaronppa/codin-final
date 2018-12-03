<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동물병원 찾기 - MyVet</title>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/register.css'/>"/>
 <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
    <style>
    	.registerHos:nth-child(2n-1) {
    		background: #f5e9c3;
    	}
    	
    	.registerHos:hover,
    	.registerHos:nth-child(2n-1):hover {
    		background: #f4e8e6;
    	}
    	
   	 	.registerPaging {
   	 		height: 20px;
    	}
    	
        #body {
            width: 80%;
            margin: auto;
        }
        
        a {
			color: #412427;
        }
        
        th {
            text-align: center;
            width: 30%;
        }
        
        #search{
        	margin-left: 15px;
        }
        
        .margin {
        	margin-left: 20px;
        	margin-bottom: 10px;
        }

        #searchDiv {
			display: inline-block;
			position: relative;
			left: 500px;
        }
        
        .nomalHos{
        	display: inline-block;
        	width: 300px;
        	height: 140px;
        	overflow: hidden;
        	position: relative;
        }
        
       .disable {
        	display:none;
        }
        
        
    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <div id="body">
    <h1>동물병원 찾기</h1>
       	<input type="radio" name="searchType" id="type-name" value="1">
       	<label for="type-name">병원 이름으로 검색</label>
       	<input class="margin" type="radio" name="searchType" id="type-addr" value="2">
       	<label for="type-addr">주소로 가까운 병원 검색</label>
       	<div id=searchDiv>
       	<span class="margin-left">검색어 : </span><input type="text" name="keyWord" id="key-word"/>
       	<button type="button" id="search">병원 검색</button>
       	</div>
    <h3>MyVet 인증병원</h3>
    <table id="resultRegister">
        <tr class="disable registerHos">
            <th>
                <h3><a href="#" class="hos-name">aaa 동물병원</a></h3>
            </th>
            <td>
                <span class="hos-addr1">경기도 성남시 분당구 어쩌고 저쩌고</span><br>
                <span class="hos-phone">031-123-4567</span>
            </td>
            <td>
            	즐겨찾는 고객 수 : <span class="follower"></span>
            </td>
        </tr>
        <tr class="hosEmpty disable">
			<th>검색결과가 존재하지 않습니다.</th>
        </tr>
        <tr class="registerPaging disable">
        	<td colspan="3">
	        	<div id="regPageing"></div>
        	</td>
        </tr>
        
    </table>
    <hr>
    <h3>미등록 병원</h3>
    <div id="resultNormal">
    	<div class="disable nomalHos">
	       <tr>
	           <th>
	               <h4 class="hos-name">bbb 동물병원</h4>
	           </th>
	           <td>
	               <span class="hos-addr1">경기도 성남시 분당구 어쩌고 저쩌고</span><br>
	               <span class="hos-phone">031-123-4567</span>
	           </td>
	  	    </tr>
  	    </div>
  	</div>
  	<div id="norPaging"></div>
    </div>
    <script>
	var $registerHos = $(".registerHos").clone().removeClass("disable");
	var $hosEmpty = $(".hosEmpty").clone().removeClass("disable");	
	var $nomalHos = $(".nomalHos").clone().removeClass("disable");
	var $registerPaging = $(".registerPaging").clone().removeClass("disable");	

	
    
   	$("#search").click(function(){
   		$.ajax({
   			url:"<c:url value='/hos/searchReg.do'/>",
   			data:{
   				keyWord : $("#key-word").val(),
   				searchType : $("input[name='searchType']:checked").val(),
   				pageNo : "1"},
   		}).done(function(hosMap){
   			
			$("#resultRegister").empty();
			
			console.dir(hosMap)
			var hosList = hosMap.list;
			
			if (hosList.length == 0) {
				$("#resultRegister").append($hosEmpty.clone());
				return;
			}
			
			for(let i = 0; i < hosList.length; i++) {
				var $newRow = $registerHos.clone();
    			$newRow.find(".hos-name").attr("href", hosList[i].hosCode);
    			$newRow.find(".hos-name").html(hosList[i].title);
    			$newRow.find(".hos-addr1").html(hosList[i].roadAddress);
    			$newRow.find(".hos-addr2").html(hosList[i].address);
    			$newRow.find(".hos-phone").html(hosList[i].telephone);

    			$("#resultRegister").append($newRow);
			}

   			$("#resultRegister").append($registerPaging.clone());
			$("#regPageing").load("regHosPage.do?pageNo="+1+"&ListCount="+hosMap.listCount);
			
	   		$(".hos-name").click(function(e){
	   			e.preventDefault();
	   					
	   	 		window.location.href = "hospital.do?hosCode="+$(this).attr("href");
	   		})

   		})
   		
   		$.ajax({
   			url:"<c:url value='/hos/searchNor.do'/>",
   			data:{
   				keyWord : $("#key-word").val(),
   				searchType : $("input[name='searchType']:checked").val(),
   				pageNo : "1"},
   		}).done(function(hosMap){

   			$("#norPaging").empty();
			$(".nomalHos").remove();
			
			console.dir(hosMap)
			var hosList = hosMap.list;
			
			if (hosList.length == 0) {
				$("#resultTable").append($hosEmpty.clone());
				return;
			}
			
			for(let i = 0; i < hosList.length; i++) {
				var $newRow = $nomalHos.clone();
    			$newRow.find(".hos-name").html(hosList[i].title);
    			$newRow.find(".hos-addr1").html(hosList[i].roadAddress);
    			if(hosList[i].roadAddress == null) {
	    			$newRow.find(".hos-addr1").html(hosList[i].address);
    			}
    			$newRow.find(".hos-phone").html(hosList[i].telephone);

    			$("#resultNormal").append($newRow);
			}
			$("#norPaging").load("norHosPage.do?pageNo="+1+"&ListCount="+hosMap.listCount);
   		})
   		
   	})
    		
    </script>
</body>
</html>