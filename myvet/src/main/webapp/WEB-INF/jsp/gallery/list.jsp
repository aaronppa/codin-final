<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
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

       /*공지*/
       .sticky {
        -webkit-box-shadow: #DDD 0px 1px 2px;
        position: relative;
        background-color: #F4F39E;
        border-color: #DEE184;
        color: #47576B;
        text-align: center;
        margin: 2.5em 0px;
        padding: 1.5em 1em;
        -webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        -moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        width: 250px;
        font-style: oblique;
        /* font-family: 'Indie Flower', cursive;
        font-family: 'Give You Glory', cursive;
        font-family: 'The Girl Next Door', cursive;
        font-family: 'Gloria Hallelujah', cursive; */
        }
        .post-it {
        display: table;
        margin: 5em auto 0;  
        width:300px;
        height: auto;
        }
        .taped {
        display: table-cell;
        text-align: center;
        vertical-align: middle;
        }
        .sticky.taped:after {
        display: block;
        content: "";
        position: absolute; 
        width: 110px;
        height: 30px;
        top: -21px;
        left: 30%;    
        border: 1px solid #fff;
        background: rgba(254, 254, 254, .6);
        -webkit-box-shadow: 0px 0 3px rgba(0,0,0,0.1);
        -moz-box-shadow: 0px 0 3px rgba(0,0,0,0.1);
        box-shadow: 0px 0 3px rgba(0,0,0,0.1);  
        }

        .note { 
        -webkit-box-shadow: #DDD 0px 1px 2px;
        position: relative;
        background-color: #F4F39E;
        border-color: #DEE184;
        text-align: center;
        margin: 1.5em auto;
        padding: 1.5em 1em;
        -webkit-box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        -moz-box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        box-shadow: 0px 1px 3px rgba(0,0,0,0.25);
        -webkit-transform: rotate(2deg);
        -moz-transform: rotate(2deg);
        -o-transform: rotate(2deg);
        -ms-transform: rotate(2deg);
        transform: rotate(2deg);
        width: 250px;
        font-family: 'The Girl Next Door', cursive; /*originally with brain flower font*/
        font-size: 1em;
        }
        .note:after {
        display: block;
        content: "";
        position: absolute; 
        width: 110px;
        height: 30px;
        top: -21px;
        left: 30%;    
        border: 1px solid #fff;
        background: rgba(254, 254, 254, .6);
        -webkit-box-shadow: 0px 0 3px rgba(0,0,0,0.1);
        -moz-box-shadow: 0px 0 3px rgba(0,0,0,0.1);
        box-shadow: 0px 0 3px rgba(0,0,0,0.1);  
        }
       /*전체*/
        h2{
            text-align: center;
        }
        table{
            margin-left: auto;
            margin-right: auto;
        }

        /**게시글**/
        #title{
            font-style: oblique;
            font-weight: bold;
        }
        #writer{
            text-align: right;
            font-style: oblique;
        }
        .card{
            margin-right: auto;
            margin-left: auto;
        }
        .active{
            background: black;
        }
        .w-100{
            height:200px;
        }
        .w-100:hover{
            transition: .5s;
            transform: scale(1.1);
            opacity: 0.8;
        }
        .card-title{
            text-align: center;
            font-weight: bolder;
        }
        .card-writer{
            text-align: right;
        }
        .card-reg-date{
            text-align: right;
        }
        .etc{
            text-align: center;
        }
    
        /**상세보기**/
        .modal-image{
            height: 200px;
            width:250px;
        }
        /**검색**/

        /*검색분류*/
        .mb-3{
            margin-left: 70%;
        }
        .dropdown-toggle{
            background: none;
        }
        .dropdown-toggle:hover{
            background: saddlebrown;
            opacity: 0.5;
            color:white;
        }
        /*검색입력창*/
        .input-search{
            border:none;
            width: 280px;
            color: saddlebrown;
        }
        /*검색버튼*/
        .btn-outline{
            background: none;
            border:none;
            color: saddlebrown;
        }
        .btn-outline:hover{
            border:none;
            opacity: 0.5;
            background: saddlebrown;
            color: white;
        }
        /*글쓰기*/
        .write-btn-form{
            text-align: center;
        }
        .write-btn{
            color:saddlebrown;
        }
        .write-btn:hover{
            color:white;
            background: saddlebrown;
            opacity: 0.5;
        }
        /*detail*/
        /*프로필 사진*/
        .rounded-circle{
            width: 50px;
            height: 50px;
        }
        td{
        	padding-left: 10px;
        }


        
        


    </style>
    <body>
       	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
    
        <!--검색-->
     <div class="input-group mb-3">
             <div class="input-group-prepend">
               <button class="btn btn-outline dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >Title</button>
               <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">Title</a>
                 <a class="dropdown-item" href="#">Content</a>
                 <div role="separator" class="dropdown-divider"></div>
                 <a class="dropdown-item" href="#">Title + Content</a>
               </div>
             </div>
             <input type="text" class="input-search" placeholder="search">
             <button type="button" class="btn btn-outline">검색</button>
     </div>
    <div id="galleryCount" style="float:right;">전체 ${count } 개</div>
    <br>
    
    <table>
            <!-- 게시글-->
    <c:forEach var="g" items="${gallery}" varStatus="loop">
    <c:if test="${loop.count % 4 == 1}">
    	<tr>
    </c:if>
        <td>
            <br>
            <div class="card" style="width: 18rem;">
                    <input type="hidden" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">
                    <a href="<c:url value='/gallery/detail.do?galleryNo=${g.galleryNo}'/>">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval='false'>
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test2.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test1.jpg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test4.jpg" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </a>
                    <div class="card-body">
                        <div class="etc">
                            <div class="emo" style="position: absolute;top: 80px;left:80px; color:white; font-size:25px;">
                                    <i class="fas fa-heart">123</i>
                                    <i class="fas fa-comments">54</i>
                                    
                                </div>
                                <div class="card-content" >
                                    <p class="card-title">${g.title } </p>
                                    <span data-toggle="tooltip" title="포니, 포돌이">
                                        <i class="fas fa-dog" style="font-size: 20px;"></i>
                                    </span>
                                    <p class="card-writer">by Pony</p>
                                    <p class="card-reg-date">2018-12-26</p>
                                </div>
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
<!--                 <td> -->
                <!-- 게시글-->
<!--                 <br> -->
<!--                 <div class="card" style="width: 18rem;"> -->
<!--                         <input type="hidden" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg"> -->
<!--                         <a href="./detail.html"> -->
<!--                             <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"> -->
<!--                                 <ol class="carousel-indicators"> -->
<!--                                     <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
<!--                                     <li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
<!--                                     <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> -->
<!--                                 </ol> -->
<!--                                 <div class="carousel-inner"> -->
<!--                                     <div class="carousel-item active"> -->
<!--                                         <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test2.jpg" alt="First slide"> -->
<!--                                     </div> -->
<!--                                     <div class="carousel-item"> -->
<!--                                         <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test1.jpg" alt="Second slide"> -->
<!--                                     </div> -->
<!--                                     <div class="carousel-item"> -->
<!--                                         <img class="d-block w-100" src="/myvet/resources/img/gall&tip/test4.jpg" alt="Third slide"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> -->
<!--                                     <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!--                                     <span class="sr-only">Previous</span> -->
<!--                                 </a> -->
<!--                                 <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> -->
<!--                                     <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!--                                     <span class="sr-only">Next</span> -->
<!--                                 </a> -->
<!--                             </div> -->
<!--                         </a> -->
<!--                     </div> -->
                </td>
            </tr>
        </table>
    <br><br><br>
        <!-- 글쓰기 -->
            <div class="write-btn-form">
            <a href="<c:url value='/gallery/writeForm.do'/>">
           	    <button type="button" class="btn btn-outline write-btn">글쓰기</button>
            </a>
            </div>
        <br>
        
        <!--페이징-->
<!--     <nav aria-label="Page navigation example"> -->
<!--         <ul class="pagination justify-content-center"> -->
<!--             <li class="page-item disabled"> -->
<!--             <a class="page-link" href="#" tabindex="-1">Previous</a> -->
<!--             </li> -->
<!--             <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--             <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--             <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--             <li class="page-item"> -->
<!--             <a class="page-link" href="#">Next</a> -->
<!--             </li> -->
<!--         </ul> -->
<!--     </nav> -->
    <div id="pagination">
   		 <c:import url="page.jsp"></c:import>
    </div>
    <script>
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