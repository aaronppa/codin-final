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
            <li ><a <c:if test="${pageResult.pageNo-5 < 1}">class='disabled'</c:if>href=${pageResult.beginPage-1 }>&laquo;</a></li>
            
			<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		    	<li <c:if test="${i eq pageResult.pageNo }">class="current"</c:if> ><a href="${i}">${i}</a></li>
			</c:forEach>
            
            <li <c:if test="${pageResult.pageNo == pageResult.lastPage}">class='disabled'</c:if>><a href="${pageResult.endPage+1 }">&raquo;</a></li>
            <li <c:if test="${pageResult.pageNo + 5 > pageResult.lastPage}">class='disabled'</c:if>><a href="${pageResult.lastPage }">&raquo;&raquo;</a>
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
			url: "<c:url value='/hos/hosSearch.do'/>",
			data: {
				keyWord : $("#search-name").val(),
				pageNo : pageNo
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
			$("#pageing").load("hosListPage.do?pageNo="+pageNo+"&ListCount="+hosMap.listCount);

		})
	})
	
    </script>
</c:if>