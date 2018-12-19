<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<c:if test="${totalCnt > 10}">

    <nav id="nav" aria-label="Pagination">
        <ul class="pagination">
            <li value="1" ><a <c:if test="${pageResult.pageNo == 1}">class='disabled'</c:if>  id="first" href="#">&laquo;&laquo;</a></li>
            <li value="${prev}"><a <c:if test="${pageResult.pageNo-5 < 1}">class='disabled'</c:if> href='#'>&laquo;</a></li>
            
			<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		    	<li  class="pagingAtag${i}" value='${i}' <c:if test="${i eq pageResult.pageNo }">class="current"</c:if> ><a href="#">${i}</a></li>
			</c:forEach>
            
            <li value="${next }"><a <c:if test="${pageResult.pageNo == pageResult.lastPage}">class='disabled'</c:if> href="#1">&raquo;</a></li>
            <li class="PLastpage" value="${endPage}"><a <c:if test="${pageResult.pageNo + 5 > pageResult.lastPage}">class='disabled'</c:if> href="#">&raquo;&raquo;</a>
            </li>
        </ul>
    </nav>
    
    <script>
    
    
	//console.log("${searchQuery}");
	
	
	alert("${pageNo}")
	alert("${pageResult.lastPage}")
	if()
	$(".pagination > li").click(function(e){
		//alert("dd");
		//alert($(this).val());
		var pageNo = $(this).val();
		
		
		$("#pageNo").val(pageNo);
		$(".searchForm").submit();
		//alert("${i}");
		
		/* alert($(this).attr("action")); */
		/* $(".searchForm").on("submit",function(){
			var searchQuery = "${searchQuery}";
			
			var url =$(this).attr("action");
			alert(url);
			var order=$("#order").val();
			var answered = $("#answered").val();
			var categoryCode =$("#categoryCode").val();
			var sort = $("#sort").val();
			var keyword= $("#keyword").val();
			$.post(url, order , answered, categoryCode, sort, keyword, pageNo).done(function(data){
				console.log("ㅋㅋ");
			})
		}) */
		
	})

    </script>
</c:if>