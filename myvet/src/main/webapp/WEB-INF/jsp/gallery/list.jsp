<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/myvet/resources/css/gallery/list.css">
    
    <!-- page -->
        <link rel="stylesheet" href="<c:url value='/resources/js/waitme/waitMe.css'/>"/>
<%--     <script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script> --%>
<%-- 	<script src="<c:url value='/resources/js/waitme/common-waitme.js'/>"></script> --%>
       <link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>
    
    <!---->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script></head>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Give+You+Glory|The+Girl+Next+Door|Gloria+Hallelujah|Indie+Flower);
	.container{
			width:1100px;
			position:relative;
			top:80px;
		}
    </style>
    <body>
    <c:import url="/WEB-INF/jsp/common/topBar.jsp" />    
    <form action="" method="post">        
    <div class="container">
        <!--검색-->
     <div class="input-group mb-3">

     	<select name="sort" id="sort" class="sort">
			<option selected value="0">검색조건</option>
			<option value="1">제목</option>
			<option value="2">내용</option>
			<option value="3">작성자</option>
			<option value="4">제목+내용</option>
		</select>
	   <input type="text" name="keyword" id="keyword" class="input-search" placeholder="search">
	   <input type="submit" class="btn btn-outline" value="검색"></input>
     </div>
    <div id="galleryCount" >전체 ${count} 개</div>
    <br>
                <div class="write-btn-form">
            <a href="<c:url value='/gallery/writeForm.do'/>">
           	    <button type="button" class="btn btn-outline write-btn">글쓰기</button>
            </a>
            </div>
    <table>
    <!-- 공지 게시물 -->
		<tr>
		<c:forEach var="top" items="${topGallery}" varStatus="loop">
			<td>
			 <br>
            <div class="card" >
<!--                     <input type="hidden" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg"> -->
                <a href="<c:url value='/gallery/detail.do?galleryNo=${top.galleryNo}&memberNo=${user.memberNo}'/>">
                <div id="carouselExampleIndicators${top.galleryNo}" class="carousel slide" data-ride="carousel" data-interval='false'>
                    <ol class="carousel-indicators">
                    	<c:if test="${empty top.fileInfoList}">
                    		<li data-target="#carouselExampleIndicators${top.galleryNo}" data-slide-to="0"  class="active"></li>
                    	</c:if>
       					<c:forEach var="f" items="${top.fileInfoList}" varStatus="innerLoop">
                            <li data-target="#carouselExampleIndicators${top.galleryNo}" data-slide-to="${innerLoop.index}"
                            	<c:if test="${innerLoop.first}"> class="active" </c:if>
                            ></li>
         				</c:forEach>
					</ol>
                    <div class="carousel-inner">
                        <c:if test="${empty top.fileInfoList}">
                    		<div class="carousel-item active">
	                            <img class="d-block w-100" src="/myvet/resources/img/gall&tip/myvet.png">
	                        </div>
						</c:if>
						<c:forEach var="f" items="${top.fileInfoList}" varStatus="innerLoop">
                        <div class="carousel-item <c:if test='${innerLoop.first}'>active</c:if>">
                            <img class="d-block w-100" src="/myvet/upload${f.filePath}/${f.sysName}">
                        </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators${top.galleryNo}" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators${top.galleryNo}" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                 </div>
                 
             	 </a>
                 <div class="card-body" style="background:#e6e6e6;">
                     <div class="etc" >
                         <div class="emo" style="position: absolute;top: 80px;left:80px; color:white; font-size:25px;">
                             <i class="fas fa-heart" style="color:#f4e8e6">${top.recomCnt}</i>
                             <i class="fas fa-comments" style="color:#f4e8e6">${top.comCnt}</i>
                         </div>
                         <div class="card-content" >
                             <p class="card-title">${top.title} </p>
                             <span data-toggle="tooltip" title="<c:forEach var="p" items="${top.petList}" varStatus="innerLoop">${p.petName},</c:forEach>">
                                 <i class="fas fa-dog"></i>
                             </span>
<!--                              <span data-toggle="tooltip" title="PONY!"> -->
<!--                                  <i class="fas fa-dog"></i> -->
<!--                              </span> -->
                             <p class="card-writer">${top.memberNickname}</p>
                             <p class="card-reg-date"><fmt:formatDate value="${top.regDate}" pattern="yyyy-MM-dd"/></p>
                         </div>
                     </div>
                    </div>
                </div>
			</td>
		</c:forEach>	
		</tr>
    <!-- 공지 게시물 끝 -->
    <hr>
 
    <!-- 게시글-->
    <c:forEach var="g" items="${gallery}" varStatus="loop">
    <!-- 일반게시물 -->
    <c:if test="${loop.count % 4 == 1}">
    	<tr>
    </c:if>
        <td>
            <br>
            <div class="card" >
<!--                     <input type="hidden" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg"> -->
                <a href="<c:url value='/gallery/detail.do?galleryNo=${g.galleryNo}&memberNo=${user.memberNo}'/>">
                <div id="carouselExampleIndicators${g.galleryNo}" class="carousel slide" data-ride="carousel" data-interval='false'>
                    <ol class="carousel-indicators">
                    	<c:if test="${empty g.fileInfoList}">
                    		<li data-target="#carouselExampleIndicators${g.galleryNo}" data-slide-to="0"  class="active"></li>
                    	</c:if>
       					<c:forEach var="f" items="${g.fileInfoList}" varStatus="innerLoop">
                            <li data-target="#carouselExampleIndicators${g.galleryNo}" data-slide-to="${innerLoop.index}"
                            	<c:if test="${innerLoop.first}"> class="active" </c:if>
                            ></li>
         				</c:forEach>
					</ol>
                    <div class="carousel-inner">
                        <c:if test="${empty g.fileInfoList}">
                    		<div class="carousel-item active">
	                            <img class="d-block w-100" src="/myvet/resources/img/gall&tip/myvet.png">
	                        </div>
						</c:if>
						<c:forEach var="f" items="${g.fileInfoList}" varStatus="innerLoop">
                        <div class="carousel-item <c:if test='${innerLoop.first}'>active</c:if>">
                            <img class="d-block w-100" src="/myvet/upload${f.filePath}/${f.sysName}">
                        </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators${g.galleryNo}" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators${g.galleryNo}" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                 </div>
                 
             	 </a>
                 <div class="card-body">
                     <div class="etc">
                         <div class="emo" style="position: absolute;top: 80px;left:80px; color:white; font-size:25px;">
                             <i class="fas fa-heart" style="color:#f4e8e6">${g.recomCnt}</i>
                             <i class="fas fa-comments" style="color:#f4e8e6">${g.comCnt}</i>
                         </div> 
                         <div class="card-content" >
                             <p class="card-title">${g.title} </p>
                             <span data-toggle="tooltip" title="<c:forEach var="p" items="${g.petList}" varStatus="innerLoop">${p.petName},</c:forEach>">
                                 <i class="fas fa-dog"></i>
                             </span>
<!--                              <span data-toggle="tooltip" title="PONY!"> -->
<!--                                  <i class="fas fa-dog"></i> -->
<!--                              </span> -->
                             <p class="card-writer">${g.memberNickname}</p>
                             <p class="card-reg-date"><fmt:formatDate value="${g.regDate}" pattern="yyyy-MM-dd"/></p>
                         </div>
                     </div>
                    </div>
                </div>
                </td>
             <c:if test="${loop.count % 4 == 0}">
             </tr>
           	</c:if>
           </c:forEach>
           <c:if test="${gall.size() % 4 != 0}">
           </tr>
           </c:if>

                </td>
            </tr>
        </table>
    <br><br><br><br>
        <!-- 글쓰기 -->
        <!--페이징-->
    <div id="pagination">
   		 <c:import url="page.jsp"></c:import>
    </div>
       </div>
      </form>  
    <script>
//     $('.write-btn-form').click(function(){
//     	window.open("/myvet/gallery/writeForm.do","gallery","width=1300, height=700, right=100, top=10")
//     })

    console.log('${gallery}');
    console.log("img : "+$('.no1').val())
    //carousel interval
	   $('.carousel').carousel({
	  interval: 0
	})
    $("#carouselExampleIndicators").hover(function (e) {
         $(".emo").toggle();
             //TransitionEvent("1s")
    })

  $('[data-toggle="tooltip"]').tooltip()
        


   
    </script>
</body>
</html>