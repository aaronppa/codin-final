<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원 검색 - MyVet</title>
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
        #hos-name{
        	width: 50%
        }
        #submitContainer{
        	text-align: center;
        }
    </style>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/register.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>
<script src="<c:url value='/resources/js/vendor/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>
</head>
<body>
    <div id="body">
	    <h1>병원 검색</h1>
	    <table>
	        <tr>
	            <th >
	                병원 이름 : 
	            </th>
	            <td>
	                <input type="text" name="searchName" id="search-name">
	                <button type="button" id="search-hos">병원 검색</button>
	            </td>
	        </tr>
	    <tr>
	    </table>
	    <h2>검색 결과</h2>
	    <table id="resultTable">
	        <tr class="hosRow disable">
	            <td class="td1">
	                <input class="radio" type="radio" id=hosRadio name="hos-radio">
	                <input type="hidden" name="hos-code" class="hos-code"/>
	                <input type="hidden" name="hos-register" class="hos-register"/>
	            </td>
	            <th class="td2">
	                <label class="label" for="hosRadio"><h3 class="hos-name"></h3></label>
	            </th>
	            <td>
	                <span class="hos-addr1"></span><br>
	                <span class="hos-addr2"></span><br>
	                <span class="hos-phone"></span>
	            </td>
	        </tr>
	        <tr class="hosEmpty disable">
				<th>검색결과가 존재하지 않습니다.</th>
	        </tr>
	        <tr class="hosPaging disable">
	        	<td colspan="3">
		        	<div id="pageing"></div>
	        	</td>
	        </tr>
	    </table>
	    <div id="submitContainer">
		    <button type="button" id="submit">등록</button>
	    </div>
    </div>
    <script>
    	var $hosRow = $(".hosRow").clone().removeClass("disable");
    	var $hosEmpty = $(".hosEmpty").clone().removeClass("disable");	
    	var $hosPaging = $(".hosPaging").clone().removeClass("disable");	

    	$("#search-hos").click(function(){
    		$.ajax({
    			url: "<c:url value='/hos/hosSearch.do'/>",
    			data: {
    				keyWord : $("#search-name").val(),
    				pageNo : "1"
    					}
    		}).done(function(hosMap) {
				$("#resultTable").empty();
				
				console.dir(hosMap)
				var hosList = hosMap.list;
				
				if (hosList.length == 0) {
					$("#resultTable").append($hosEmpty.clone());
					return;
				}
				
				for(let i = 0; i < hosList.length; i++) {
	    			var $newRow = $hosRow.clone();
	    			$newRow.find(".radio").attr("id", "hosList"+i);
	    			$newRow.find(".label").attr("for", "hosList"+i);
	    			$newRow.find(".hos-code").val(hosList[i].hosCode);
	    			$newRow.find(".hos-register").val(hosList[i].hosRegister);
	    			$newRow.find(".hos-name").html(hosList[i].title);
	    			$newRow.find(".hos-addr1").html(hosList[i].roadAddress);
	    			$newRow.find(".hos-addr2").html(hosList[i].address);
	    			$newRow.find(".hos-phone").html(hosList[i].telephone);
	    			$("#resultTable").append($newRow);
				}
				
    			$("#resultTable").append($hosPaging.clone());
				$("#pageing").load("hosListPage.do?pageNo="+1+"&ListCount="+hosMap.listCount);

    		})
    	})
    	
    	$("#submit").click(function(){
    		var $resultRow = $(".radio:checked").parents(".hosRow")
    		console.dir($resultRow);
    		
    		if($resultRow.length == 0) {
				swal({
					  type: 'error',
					  title: 'ERROR!!',
					  text: '선택된 병원이 없습니다.'
				})
				return false;
    		}
    		
    		console.log($resultRow.find(".hos-register").val())
    		
    		if($resultRow.find(".hos-register").val() == 'Y') {
				swal({
					  type: 'error',
					  title: 'ERROR!!',
					  text: '이미 등록 된 병원입니다.'
				})
				return false;
    		}
    		
    		opener.parent.inputInfo(
    				$resultRow.find(".hos-code").val(),
	    			$resultRow.find(".hos-name").html(),
	    			$resultRow.find(".hos-addr1").html(),
	    			$resultRow.find(".hos-addr2").html()
    		)
			window.close();			
    	}) 
    	
    </script>
</body>
</html>