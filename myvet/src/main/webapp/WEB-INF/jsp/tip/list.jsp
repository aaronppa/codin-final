<%@page import="kr.co.codin.repository.domain.Tip"%>
<%@page import="kr.co.codin.repository.mapper.TipMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/js/waitme/waitMe.css'/>"/>
    <script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script>
	<script src="<c:url value='/resources/js/waitme/common-waitme.js'/>"></script>
    <!--bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>
   
    <style>
/*         body { */
/*             padding:30px 30px; */
/*         } */
		
        /*category*/
        @import "compass/css3";
        .container{
        	width:1100px;
        	margin-left: auto;
        	margin-right: auto;
        }
        select[disabled]{
        color:#aaa;
        }
        h1{color:#563d7c;}


        /*search*/
        .mb-3{
            margin-left: 65%;
        }
        .dropdown-toggle{
            background: none;
        }
        .dropdown-toggle:hover{
            opacity: 0.5;
            /* color:white; */
        }
        /*검색입력창*/
        .input-search{
            border:none;
            width: 18%;
            color: saddlebrown;
        }
        /*검색버튼*/
        .btn-outline{
            background: none;
            border:none;
        }
        .btn-outline:hover{
            border:none;
            opacity: 0.5;
        }
        
        /*writeBtn*/
        .btn-light:hover{
            background: black;
            color: white;
            transition: .5s;
        }
        
        /*table*/
        tr:hover{
            background: gray;
            opacity: 0.8;
        }
        .no{
            width:10%;
        }
        .writer{
            width:15%;
        }
        .reg_date{
            width:15%;
        }
        .view_cnt{
            width:15%;
        }
        /*pagenation*/
   		#pagination{
   			vertical-align: middle;
   		}

    </style>
    <script src="<c:url value="../resources/js/vendor/jquery.js"/>"></script>
    
   	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
</head>
<body>
    <div class="container">
    <!--search-->
    <!--category-->
    <form action="<c:url value='/tip/list.do'/>" method="post">
	    <div class="input-group mb-3">
	      		<select name="sort" id="sort" class="sort">
					<option selected value="0">검색조건</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">작성자</option>
					<option value="4">제목+내용</option>
				</select>
	      		<select name="category" id="category" class="category">
					<!--<option selected value="">Category</option>  -->
					<option selected value="0">카테고리 전체</option>
					<option value="1">건강</option>
					<option value="2">생활</option>
					<option value="3">용품</option>
					<option value="4">기타</option>
				</select>
				
	            <input type="text" name="keyword" id="keyword" class="input-search" placeholder="search">
	            <input type="submit" class="btn btn-outline" value="검색"></input>
	    </div>
    </form>
    <!--count-->
    
    <!--list-->
    <table class="table">
            <div style="text-align: right;">전체 ${count} 개</div>
            <!-- <caption>List of users</caption> -->
            <thead>
                <tr style="text-align: center;">
	                <th scope="col" style="width:5%;"class="no">글 번호</th>
	                <th scope="col" style="width:20%;"class="writer">작성자</th>
	                <th scope="col" style="width:25%;"class="title">제목</th>
	                <th scope="col" style="width:10%;"class="category">카테고리</th>
	                <th scope="col" style="width:10%;"class="reg_date">작성일</th>                
	                <th scope="col" style="width:10%;"class="view_cnt">조회수</th>
	                <th scope="col" style="width:10%;"class="view_cnt">추천수</th>
            	</tr>
        </thead>
        <tbody>
     		<c:forEach var="t" items="${tip}" varStatus="loop">
	            <tr style="text-align: center;">
	                <th scope="row"> ${t.tipNo} </th>
	                <td>Mark</td>
	                <td><a href="<c:url value='/tip/detail.do?tipNo=${t.tipNo}'/>">${t.title }</a><span id="countComment"></span></td>
					<c:if test="${t.categoryCode eq 1}">
		                <td>건강</td>
					</c:if>
					<c:if test="${t.categoryCode eq 2}">
		                <td>생활</td>
					</c:if>
					<c:if test="${t.categoryCode eq 3}">
		                <td>용품</td>
					</c:if>
					<c:if test="${t.categoryCode eq 4}">
		                <td>기타</td>
					</c:if>
	                <td><fmt:formatDate value="${t.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	                <td>${t.viewCnt}</td>
	                <td><i class="fas fa-heart" style="color:red;">&nbsp;${t.recomCnt }</i> 
	                </td>
	           	</tr>
     		</c:forEach>   	
	                
        </tbody>
    </table>
    <!--writeBtn-->
    <div class="writeBtn"style="text-align: right;">
        <a href="<c:url value='/tip/writeForm.do'/>">
            <button type="button" class="btn btn-light">글쓰기</button>
        </a>
    </div>
    <!--pagenation-->
    <div id="pagination">
   		 <c:import url="page.jsp"></c:import>
    </div>
    </div>
</body>
<script>

//search
// function search(){
// 	$('.input-search').click(function(){
// 		$.ajax({
// 			url:'/myvet/tip/list.do',
// 			type:'post',
// 			data:{sort : $('#sort').val(), category:$('#category').val(), keyword:$('keyword').val()}
// 		}).done(function(result){
// 			console.log('검색 성고옹')
// 		})
// 	})
// }


/*category*/
function chainSelect(current, target){
  var value1 = $(current).on('change', function(){
    if($(this).find(':selected').val() != ''){
      $(target).removeAttr('disabled');
      var value = $(this).find(':selected').text();
    }else{
      $(target).prop('disabled', 'disabled').val(null);
    }
  return value;
  });
  return value1;
}
size = chainSelect('select#size', '#color');
color = chainSelect('select#color', '#qty');
qty = chainSelect('select#qty', '#submit');



$('#addToCart').submit(function(){
  event.preventDefault();
  alert('Size: ' + size + '\nColor: ' + color + '\nQuantity: ' + qty);
});




</script>
</html>