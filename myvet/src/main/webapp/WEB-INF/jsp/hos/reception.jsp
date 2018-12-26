<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현장접수 - MyVet</title>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/hos/register.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>
<script src="<c:url value='/resources/js/vendor/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>

    <style>
   	    body {
		  	font-family: 'Gamja Flower', cursive !important;
		  	font-size: 20px !important;
	 	}
        #body {
            width: 1100px;
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
       	.petRow:nth-child(2n) {
 	 		background: rgba(255, 255, 255, 0.5);
  		}
  	
	  	.petRow:nth-child(2n-1) {
  			background: rgba(245, 233, 195, 0.5);
	  	}
  	
	  	.petRow:hover,
	  	.petRow:nth-child(2n-1):hover {
	  		background: #f4e8e6;
	  	}
    </style>
</head>
<body>
    <div id="body">
	    <h1>반려동물 검색</h1>
	    <table>
	        <tr>
	            <th>
	                동물 이름 : 
	            </th>
	            <td>
	                <input type="text" name="searchName" id="search-name">
	                <button type="button" id="search-pet">동물 검색</button>
	            </td>
	        </tr>
	    <tr>
	    </table>
	    <h2>검색 결과</h2>
	    <table id="resultTable">
	        <tr class="petRow disable">
	            <td class="td1">
	                <input class="radio" type="radio" id=petRadio name="pet-radio">
	                <input type="hidden" name="pet-code" class="pet-code"/>
	                <input type="hidden" name="member-no" class="member-no"/>
	            </td>
	            <th class="td2">
	                <label class="label" for="petRadio"><h3 class="pet-name"></h3></label>
	            </th>
	            <td>
	                <span class="pet-owner"></span><br>
	                <span class="pet-species"></span><br>
	                <span class="pet-breed"></span>
	            </td>
	        </tr>
	        <tr class="petEmpty disable">
				<th>검색결과가 존재하지 않습니다.</th>
	        </tr>
	        <tr class="petPaging disable">
	        	<td colspan="3">
		        	<div id="pageing"></div>
	        	</td>
	        </tr>
	    </table>
	    <div id="submitContainer">
		    <button type="button" id="submit">접수</button>
	    </div>
    </div>
    <script>
    	var $petRow = $(".petRow").clone().removeClass("disable");
    	var $petEmpty = $(".petEmpty").clone().removeClass("disable");	
    	var $petPaging = $(".petPaging").clone().removeClass("disable");	

    	$("#search-pet").click(function(){
    		$.ajax({
    			url: "<c:url value='/hos/petSearch.do'/>",
    			data: {
    				keyWord : $("#search-name").val(),
    				pageNo : "1"
    					}
    		}).done(function(petMap) {
				$("#resultTable").empty();
				
				console.dir(petMap)
				var petList = petMap.list;
				
				if (petList.length == 0) {
					$("#resultTable").append($petEmpty.clone());
					return;
				}
				
				for(let i = 0; i < petList.length; i++) {
	    			var $newRow = $petRow.clone();
	    			var species = "";
	    			if (petList[i].species == "cat") {
	    				species = "고양이";
	    			} else {
	    				species = "강아지";
	    			}
	    			
	    			$newRow.find(".radio").attr("id", "petList"+i);
	    			$newRow.find(".label").attr("for", "petList"+i);
	    			$newRow.find(".pet-code").val(petList[i].petNo);
	    			$newRow.find(".member-no").val(petList[i].memberNo);
	    			$newRow.find(".pet-name").html(petList[i].petName);
	    			$newRow.find(".pet-owner").html("보호자 성명 : " + petList[i].member.memberName);
	    			$newRow.find(".pet-species").html("동물 종류 : " + species);
	    			$newRow.find(".pet-breed").html("견/묘종 : " + petList[i].breed);
	    			$("#resultTable").append($newRow);
				}
				
    			$("#resultTable").append($petPaging.clone());
				$("#pageing").load("petListPage.do?pageNo="+1+"&ListCount="+petMap.listCount);

    		})
    	})
    	
    	$("#submit").click(function(){
    		var petCode = $(".radio:checked").parents(".petRow").find(".pet-code").val();
    		console.dir(petCode);
    		
    		if(petCode == null) {
				swal({
					  type: 'error',
					  title: 'ERROR!!',
					  text: '선택된 동물이 없습니다.'
				})
				return false;
    		}
    		
    		$.ajax({
    			url: "/myvet/hos/receptionPet.do",
    			data: {bookingPet: petCode,
	    				bookingOwner: $(".radio:checked").parents(".petRow").find(".member-no").val(),
	    				hosCode: ${hosCode}
    			}
    		}).done(function() {
	    		opener.parent.location.reload();
				window.close();			
    		})
    	}) 
    </script>
</body>
</html>