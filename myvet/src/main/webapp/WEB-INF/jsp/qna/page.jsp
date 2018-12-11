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
            <li id="startPage"><a <c:if test="${pageResult.pageNo == 1}">class='disabled'</c:if> id="first" href="1">&laquo;First</a></li>
            <li id="LiprevPage" ><a <c:if test="${i == 1}">class='disabled'</c:if>href="<c:url value='${i-1}'/>">&laquo;Previous</a></li>
            
            
           	<c:choose>
           		<c:when test="${endPage<10}">
           			<c:forEach var="i" begin="${location.search.substring(8)/10 +1 }" end="${endPage}">
		    				<li <c:if test="${i eq pageResult.pageNo }">class="current"</c:if> ><a href="<c:url value='${i}'/>">${i}</a></li>
					</c:forEach>
           		</c:when>
           		<c:otherwise>
           			<c:forEach var="i" begin="${location.search.substring(8)/10 +1 }" end="${location.search.substring(8)/10 +10}">
		    				<li <c:if test="${i eq pageResult.pageNo }">class="current"</c:if> ><a href="<c:url value='${i}'/>">${i}</a></li>
					</c:forEach>
           		</c:otherwise>
           	</c:choose>
			
            
            <li id="Linextpage"  <c:if test="${i == ''}">class='disabled'</c:if>><a href="<c:url value='${i+1}'/>">Next&raquo;</a></li>
            <li id="LiendPage" <c:if test="${pageResult.pageNo + 10 > pageResult.lastPage}">class='disabled'</c:if>><a href="${pageResult.lastPage }">End&raquo;</a>
            </li>
        </ul>
    </nav>
    
    <script>
    console.log("----------------------------");
    console.log(${totalCnt});
    alert(location.search.substring(8));
    alert(location.search.substring(8).length);
	$("nav > ul.pagination > li > a").click (function(e) {
		e.preventDefault();
	//	alert(location.search.substring(8));
		//alert(${endPage});
		var pageNo = $(this).attr("href")
	//	alert(pageNo);
	//	if (pageNo == 0 || pageNo == ${pageResult.lastPage + 1}) return false;
	//	if ($(this).hasClass("disabled")) return false;
	//	alert(pageNo);
		if(location.search.substring(8) == ''){
			pageNo = 1;
		}
		if(location.search.substring(8) == 1){
			$("#LiprevPage").css("display","none");$("#startPage").css("display","none") ;
		}
		if(location.search.substring(8) == '${endPage}'){
			$("#Linextpage").css("display","none");$("#LiendPage").css("display","none") ;
		}
		location.href = "list.do?pageNo=" + pageNo;
	})
	
    </script>
</c:if>