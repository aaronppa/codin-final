<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<c:if test="${pageResult.count != 0}">

    <nav aria-label="Pagination">
        <ul class="pagination">
            <li ><a <c:if test="${pageResult.pageNo == 1}">class='disabled'</c:if> id="first" href="1">&laquo;&laquo;</a></li>
            <li ><a <c:if test="${pageResult.pageNo == 1}">class='disabled'</c:if> href=${pageResult.pageNo-1 }>&laquo;</a></li>
            
			<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		    	<li <c:if test="${i eq pageResult.pageNo }">class="current"</c:if> ><a href="${i}">${i}</a></li>
			</c:forEach>
            
            <li ><a <c:if test="${pageResult.pageNo == pageResult.lastPage}">class='disabled'</c:if> href="${pageResult.pageNo+1 }">&raquo;</a></li>
            <li ><a <c:if test="${pageResult.pageNo == pageResult.lastPage}">class='disabled'</c:if> href="${pageResult.lastPage }">&raquo;&raquo;</a>
            </li>
        </ul>
    </nav>
    
    <script>
	$("nav > ul.pagination > li > a").click (function(e) {
		e.preventDefault();
		
		var pageNo = $(this).attr("href")
		
		if (pageNo == 0 || pageNo == ${pageResult.lastPage + 1}) return false;
		if ($(this).hasClass("disabled")) return false;
		
		$.ajax({
			url: "<c:url value='/hos/petSearch.do'/>",
			data: {
				keyWord : $("#search-name").val(),
				pageNo : pageNo
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
    			$newRow.find(".radio").attr("id", "petList"+i);
    			$newRow.find(".label").attr("for", "petList"+i);
    			$newRow.find(".pet-code").val(petList[i].petCode);
    			$newRow.find(".pet-name").html(petList[i].petName);
    			$newRow.find(".pet-owner").html("보호자 성명 : " + petList[i].member.memberName);
    			$newRow.find(".pet-species").html("동물 종류 : " + petList[i].species);
    			$newRow.find(".pet-breed").html("견/묘종 : " + petList[i].breed);
    			$("#resultTable").append($newRow);
			}
			
			$("#resultTable").append($petPaging.clone());
			$("#pageing").load("petListPage.do?pageNo="+pageNo+"&ListCount="+petMap.listCount);

		})
	})
	
    </script>
</c:if>