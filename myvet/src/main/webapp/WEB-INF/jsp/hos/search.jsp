<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동물병원 찾기 - MyVet</title>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/search.css'/>"/>
 <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
    <style>
       	#background {
       		width: 100%;
       		height: 100%;
       		position: absolute;
       		z-index: -2;
       		top:0;
       		left:0;
       		opacity: 0.3;
    		background-image: url('/myvet/resources/img/common/background.jpg');
    	}
    	
    	.registerHos:nth-child(2n) {
    		background: rgba(255, 255, 255, 0.5);
    	}
    	
    	.registerHos:nth-child(2n-1) {
    		background: rgba(245, 233, 195, 0.5);
    	}
    	
    	.registerHos:hover,
    	.registerHos:nth-child(2n-1):hover {
    		background: #f4e8e6;
    	}
    	
   	 	.registerPaging {
   	 		height: 50px;
   	 		vertical-align: middle;
    	}
    	
        #body {
            width: 1100px;
            margin: auto;
            margin-top: 110px;
        }
        
        .hos-name,
        .hos-name:hover {
			color: #412427;
        }
        
        #search{
        	margin-left: 15px;
        }
        
        .margin {
        	margin-left: 20px;
        	margin-bottom: 40px;
        }

        #searchDiv {
			display: inline-block;
			position: relative;
			left: 370px;
        }
        
        .nomalHos{
        	display: inline-block;
        	width: 260px;
        	height: 140px;
        	overflow: hidden;
        	position: relative;
        	margin-left: 15px;
        	border: 1px solid #412427;
        	border-radius: 30px;
        	background: rgba(245, 233, 195, 0.5);
        	padding: 10px;
        }
        
        .nomalHos:nth-child(1) {
        	margin-left: 0px;
        }
        
       .disable {
        	display:none;
        }
        
        .firstTd {
        	width: 60px;
        	text-align: right;
        }
        
        .hos-img {
        	max-width: 50px;
        	max-height: 50px;
        }
        
        .addressTd {
        	width: 440px;
        	overflow: hidden;
        }
        
        #resultRegister th {
        	text-align: center;
        	margin: auto;
        	width: 35%;
        	height: 60px;
        }
        
        h4 {
        	margin-bottom: 0px !important;
        }
        
        h5.hos-name {
        	font-weight: bold;
        }
        
        #norPaging {
        	margin-top: 10px;
        }
        
        
    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="background"></div>

    <div id="body">
    <h1>동물병원 찾기</h1>
       	<input type="radio" name="searchType" id="type-name" value="1" checked="checked">
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
        	<td class="firstTd">
        		<img class="hos-img" src="...">
        	</td>
            <th>
                <h4><a href="#" class="hos-name">aaa 동물병원</a></h4>
            </th>
            <td class="addressTd">
                <span class="hos-addr1">경기도 성남시 분당구 어쩌고 저쩌고</span><br>
                <span class="hos-phone">031-123-4567</span>
            </td>
            <td>
            	즐겨찾는 고객 수 : <span class="follow"></span>
            </td>
        </tr>
        <tr class="hosEmpty disable">
			<th>검색결과가 존재하지 않습니다.</th>
        </tr>
        <tr class="registerPaging disable">
        	<td colspan="4" class=".paging">
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
	               <h5 class="hos-name">bbb 동물병원</h5>
	           </th>
	           <td>
	               <span class="hos-addr1">경기도 성남시 분당구 어쩌고 저쩌고</span><br>
	               <span class="hos-phone">031-123-4567</span>
	           </td>
	  	    </tr>
  	    </div>
  	</div>
  	<div class="paging" id="norPaging"></div>
    </div>
    <script>
	var $registerHos = $(".registerHos").clone().removeClass("disable");
	var $hosEmpty = $(".hosEmpty").clone().removeClass("disable");	
	var $nomalHos = $(".nomalHos").clone().removeClass("disable");
	var $registerPaging = $(".registerPaging").clone().removeClass("disable");	
	$("#regPageing").load("regHosPage.do?pageNo="+1+"&ListCount="+0);
	$("#norPaging").load("norHosPage.do?pageNo="+1+"&ListCount="+0);
	
	$("#key-word").keydown(function(e) {
		if(e.keyCode == 13) {
			if($(this).val() == "") {
				return;
			}
			$("#search").click();
		}
	})
    
   	$("#search").click(function(){
   		
   		if ($("#key-word").val() == "") {
   			Swal({
   			  type: 'error',
   			  title: '검색어가...',
   			  text: '입력되지 않았습니다!',
   			}).then(function() {
   				return;
   			})
   		} else {
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
					try {
		    			$newRow.find(".hos-img").attr("src", "/myvet/upload/" + hosList[i].thumbImgInfo.filePath + "/" + hosList[i].thumbImgInfo.sysName);
					} catch {
						;;
					}
	    			$newRow.find(".hos-name").attr("href", hosList[i].hosCode);
	    			$newRow.find(".hos-name").html(hosList[i].title);
	    			$newRow.find(".hos-addr1").html(hosList[i].roadAddress);
	    			$newRow.find(".hos-addr2").html(hosList[i].address);
	    			$newRow.find(".hos-phone").html(hosList[i].telephone);
	    			$newRow.find(".follow").html(hosList[i].followCnt);
	
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
   		}
   	})
    		
    </script>
</body>
</html>