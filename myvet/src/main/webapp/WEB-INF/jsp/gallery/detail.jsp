<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script></head>
    <!-- Link Swiper's CSS -->
    <!-- <link rel="stylesheet" href="../dist/css/swiper.min.css"> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.bundle.js"></script> -->
  <style>
    #thumbs { 
        padding-top: 10px; 
        overflow: hidden; 
    }
    #thumbs img, #largeImage {
    cursor: pointer;
    width: 500px;
    height: 400px;
    }
    #thumbs img {
    float: left;
    margin-right: 6px;
    width:120px;
    height: 120px;
    }
    #description {
    background: black;
    color: white;
    position: absolute;
    bottom: 0;
    padding: 10px 20px;
    margin: 5px;
    }
    #panel {
        position: relative;
    }
    #gallary{
        float: left;
        width: 300px;

    }
    .content{
        text-align: left;
    }
    #writer-img{
        width: 60px;
        height: 60px;
    }
    #user-img{
        width: 50px;
        height: 50px;
    }
    .content{
        border: none;
        
    }
    #comment{
		height: 590px;
		overflow: hidden;
		overflow: scroll;
		overflow: auto;
    }

    /*swiper*/
/*     html, body { */
/*       position: relative; */
/*       height: 100%; */
/*     } */
/*     body { */
/*       font-family: Helvetica Neue, Helvetica, Arial, sans-serif; */
/*       font-size: 14px; */
/*       color:#000; */
/*       margin: 0; */
/*       padding: 0; */
/*     } */
    .swiper-container {
      width: 100%;
      height: 300px;
      margin-left: auto;
      margin-right: auto;
    }
    .swiper-slide {
      background-size: cover;
      background-position: center;
    }
    .gallery-top {
      height: 400px;
      width: 600px;
    }
    .gallery-thumbs {
      height: 25%;
      width: 600px;
      box-sizing: border-box;
      padding: 10px 0;
    }
    .gallery-thumbs .swiper-slide {
      height: 100%;
      opacity: 0.4;
    }
    .gallery-thumbs .swiper-slide-thumb-active {
      opacity: 1;
    }
    .top-img{
        width: 600px;
        height: 400px;
    }
    .thumbs-img{
        width:150px;
        height: 100px;
    }

    /*comment*/

    /* html, body {
    background-color: #f0f2fa;
    font-family: "PT Sans", "Helvetica Neue", "Helvetica", "Roboto", "Arial", sans-serif;
    color: #555f77;
    -webkit-font-smoothing: antialiased;
    } */

    input, textarea {
    outline: none;
    border: none;
    display: block;
    margin: 0;
    padding: 0;
    -webkit-font-smoothing: antialiased;
    font-family: "PT Sans", "Helvetica Neue", "Helvetica", "Roboto", "Arial", sans-serif;
    font-size: 1rem;
    color: #555f77;
    }
    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
    color: #ced2db;
    }
    input::-moz-placeholder, textarea::-moz-placeholder {
    color: #ced2db;
    }
    input:-moz-placeholder, textarea:-moz-placeholder {
    color: #ced2db;
    }
    input:-ms-input-placeholder, textarea:-ms-input-placeholder {
    color: #ced2db;
    }

    p {
    line-height: 1.3125rem;
    }

    .comments {
    margin: 2.5rem auto 0;
    max-width: 60.75rem;
    padding: 0 1.25rem;
    }

    .comment-wrap {
    margin-bottom: 1.25rem;
    display: table;
    width: 100%;
    min-height: 5.3125rem;
    }

    #writer-pic{
        width:60px;
        height: 60px;
    }
    #user-pic{
        width:45px;
        height:45px;
    }
    .photo {
    padding-top: 0.625rem;
    display: table-cell;
    width: 3.5rem;
    }
    .photo .avatar {
    height: 2.25rem;
    width: 2.25rem;
    border-radius: 50%;
    background-size: contain;
    }

    .comment-block {
    padding: 1rem;
    background-color: #fff;
    display: table-cell;
    vertical-align: top;
    border-radius: 0.1875rem;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08);
    }
    .comment-block textarea {
    width: 100%;
    resize: none;
    }

    .comment-text {
    margin-bottom: 1.25rem;
    }

    .bottom-comment {
    color: #acb4c2;
    font-size: 0.875rem;
    }

    .comment-date {
    float: left;
    }

    .comment-actions {
    float: right;
    }
    .comment-actions li {
    display: inline;
    margin: -2px;
    cursor: pointer;
    }
    .comment-actions li.registration{
    color : 1px solid gray;
    }
    .comment-actions li.complain {
    padding-right: 0.75rem;
    border-right: 1px solid #e1e5eb;
    }
    .comment-actions li.reply {
    padding-left: 0.75rem;
    padding-right: 0.125rem;
    }
    .comment-actions li:hover {
    color: #0095ff;
    }
    .active{
    	color: red;
    }


    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <div class="container-fluid">
        <div class="row">
         
            <!-- <div class="col-md-7 col-md-offset-1"> -->
                <div class="col-md-6" id="pic-form">
                <!-- Swiper -->
                <div class=" swiper-container gallery-top">
                        <div class="swiper-wrapper">
                        <div class="swiper-slide"><img class = "top-img" src="/myvet/resources/img/gall&tip/pic1.jpg"></div>
                        <div class="swiper-slide"><img class = "top-img" src="/myvet/resources/img/gall&tip/pic2.jpg"></div>
                        <div class="swiper-slide"><img class = "top-img" src="/myvet/resources/img/gall&tip/pic3.jpg"></div>
                        <div class="swiper-slide"><img class = "top-img" src="/myvet/resources/img/gall&tip/pic4.jpg"></div>

                        </div>
                        <!-- Add Arrows -->
                        <div class="swiper-button-next swiper-button-white"></div>
                        <div class="swiper-button-prev swiper-button-white"></div>
                    </div>
                    <div class="swiper-container gallery-thumbs">
                        <div class="swiper-wrapper">
                                <div class="swiper-slide"><img class = "thumbs-img" src="/myvet/resources/img/gall&tip/pic1.jpg"></div>
                                <div class="swiper-slide"><img class = "thumbs-img" src="/myvet/resources/img/gall&tip/pic2.jpg"></div>
                                <div class="swiper-slide"><img class = "thumbs-img" src="/myvet/resources/img/gall&tip/pic3.jpg"></div>
                                <div class="swiper-slide"><img class = "thumbs-img" src="/myvet/resources/img/gall&tip/pic4.jpg"></div>
                        </div>
                    </div>
                    <div class="pet" style="margin-left: 10%; text-align: center;">
                        <span data-toggle="tooltip" title="PONY">
                            <img src="/myvet/resources/img/gall&tip/pony01.jpg" id="pet-img" class="rounded-circle" style="width:80px;height:80px;margin-right: 10px;">
                        </span>
                        <span data-toggle="tooltip" title="PODOL">
                            <img src="/myvet/resources/img/gall&tip/pony02.jpg" id="pet-img" class="rounded-circle" style="width:80px;height:80px;">
                        </span>
                    </div>
                </div>

                <div class="col-md-6" id="comment"> 
                        <div class="detail-content"  >
                            <br>
                            <img src="/myvet/resources/img/gall&tip/pic2.jpg" class="rounded-circle" id="writer-img">
                            
                            <span style="font-weight:bolder">복순이</span>
                            <a href="<c:url value='/gallery/delete.do?galleryNo=${gallery.galleryNo}'/>" id="deleteGall" style="font-size:20px;float:right;margin-right:2%;cursor:pointer;">삭제</a>
                            <a href="<c:url value='/gallery/updateForm.do?galleryNo=${gallery.galleryNo}'/>" id="updateGall" style="font-size:20px;float:right;margin-right:5%;cursor:pointer;">수정</a>
                            <br>
                            <br>
                            <i class="fas fa-heart" style="color:red;">&nbsp;123</i> 
                            <span style="margin-left:10px;">view : ${gallery.viewCnt}</span>
                            <!-- <i class="far fa-comments" style="margin-left: 5%;">&nbsp;458</i> -->
                            <i class="far fa-clock"style="margin-left: 70%;">&nbsp;<fmt:formatDate value="${gallery.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></i>
                            <hr>
                            <i class="fas fa-exclamation-triangle" style="margin-left: 88%;">신고하기</i>
                            <br>
                            <br>
                            <div id="title" style="font-size:20px;"><strong>${gallery.title}</strong></div>
                            <br>
                            <br>
                            <div id="content">${gallery.content}</div>
                            <br>
                            <!--유저 댓글-->
                            <!-- <img src="/myvet/resources/img/gall&tip/pic3.jpg" class="rounded-circle" id="user-img">
                            <span style="font-weight:bolder">복돌이</span>
                            <br>
                            <br>
                            <div>홓홓ㅎ홓</div>
                            <hr> -->
                            <div class="comment">
                                    <div class="comments">
                                        <div class="comment-wrap writeComment">
                                            <div class="photo">
                                                    <img src="/myvet/resources/img/gall&tip/pic2.jpg" id="writer-pic" class="rounded-circle" >
                                                </div>
                                                <!-- 댓글 등록 -->
                                            	<div class="comment-block">
                                                <input type="hidden" id="commenterNo" name="commenterNo" value="8">
                                                <input type="hidden" id="galleryNo" name="galleryNo" value="${gallery.galleryNo}">
                                                    <textarea name="comment" id="input-comment" cols="30" rows="3" placeholder="Add comment..."></textarea>
                                                	<span id="counter">###</span>
                                                </div>
                                            </div>
                                            <ul class="comment-actions">
                                                <li class="registration">등록</li>
                                            </ul>
									<!-- 댓글 수 -->
                                    <i class="far fa-comments" style="margin-left: 5%; font-size: 20px;">&nbsp;458</i>
                                    <!-- 댓글 목록-->
                                     
                                        <div class="comment-wrap comment-list" id="comment-list">
<!--                                             <div class="photo"> -->
<!--                                                 <img src="/myvet/resources/img/gall&tip/pony01.jpg" id="user-pic" class="rounded-circle" > -->
<!--                                             </div> -->
<!--                                             <div class="comment-block"> -->
<!--                                                 <p class="comment-text">개같네여</p> -->
<!--                                                 <div class="bottom-comment"> -->
<!--                                                     <div class="comment-date">2018-08-12 18:32:09</div> -->
<!--                                                     <ul class="comment-actions"> -->
<!--                                                         <li class="complain">삭제</li> -->
<!--                                                         <li class="reply">신고</li> -->
<!--                                                     </ul> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
                                        
                                        <!-- 댓글목록 끝 -->
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
             <a href="<c:url value='/gallery/list.do'/>">
             <button style="float:right;">목록</button>
             </a>         
        </div>
    </div>

  <!-- Swiper JS -->
  <!-- <script src="../dist/js/swiper.min.js"></script> -->

    <script>
        $('#thumbs img').click(function(){
        $('#largeImage').attr('src',$(this).attr('src').replace('thumb','large'));
        $('#description').html($(this).attr('alt'));
    });

    //swiper
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      loop: true,
      freeMode: true,
      loopedSlides: 5, //looped slides should be the same
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      loop:true,
      loopedSlides: 5, //looped slides should be the same
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs,
      },
    });
    
	$(function typing() {
	      $('#input-comment').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter').html(content.length + '/300');
	      });
	      $('#input-comment').keyup();
	});
    
    //댓글 글자 입력수 끝

    //댓글 등록
    $('.registration').click(function(){
    	
    	$.ajax({
    		url : '/myvet/gallery/writeComment.do',	
    		data : "galleryNo="+$('#galleryNo').val()+"&commenterNo="+$('#commenterNo').val()+"&comment="+$('#input-comment').val()
    	}).done(function(){
    		console.log('댓글 등록!')
    		$('#input-comment').val('');
    	})
    })
    
    $(function(){
    	list();
    })
    
    //댓글 조회
    function list(){	
	    $.ajax({
	    	url : '/myvet/gallery/commentList.do',
	    	type : 'post',
	    	data: {galleryNo : $('#galleryNo').val()}
// 	    	dataType : 'json'
	    }).done(function(result){
	    	console.log('댓글 불러오기')
	    	for(let i=0; i < result.length; i++){
	    		let likeRecommend = "", dislikeRecommend = "";
			$('#comment-list').append(
				//작성자 이미지
// 				"<div class='photo'>"
// 				+"<div class='commenter-pic' ><img src='/myvet/resources/img/gall&tip/pony01.jpg' class='rounded-circle' width='60px' height='60px'></div>"
// 				+"<div class='comment-block'/>"
// 				//댓글내용
// 				+"<p class='comment-text'>"+result[i].comment+"</p>"
// 				//댓글 정보 폼
// 				+"<div class='bottom-comment'>"
// 				//댓글 작성일
// 				+"<div class='comment-date'>"+result[i].regDate+"</div>"
// 				//댓글 삭제, 신고
// 				+"<ul class='comment-actions'>"
// 				+"<li class='delete-comment'>삭제</li>"
// 				+"<li class='report-comment'>신고</li>"
// 				+"</ul>"
// 				+"</div>"
// 				+"</div>"
	                "<img src='/myvet/resources/img/gall&tip/pony01.jpg' class='rounded-circle'style='width:45px;height:45px;'/>&nbsp;"
	              	+"<button class='com-like "+likeRecommend+"' style='background:none; border:none; margin-left:55%;cursor:pointer;' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-up' style='font-size:25px;'></i>"+"</button><button class='com-dislike "+dislikeRecommend+"' style='background:none; border:none; margin-left:5%;cursor:pointer;' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-down' style='font-size:25px;'></i>"+"</button>"	
	            	+"<i class='fas fa-heart' style='margin-left: 5%;color:red;'></i><span id='recommendCnt"+result[i].commentNo+"'>"+result[i].recommendCnt+"</span>"
	                
	            	+"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"'></div>"
	                +"<div class='comment-content'>" 
		                +"<input type='hidden' class='commentval' data-commentval='"+result[i].commentNo+"' value='"+result[i].comment+"'/>"
		                +"<div class='comment' style='width:400px;height:auto;font-size:20px;font-style:normal;' data-comment='"+result[i].comment+"' height:auto;'>"+result[i].comment+"</div>"
	              	+"</div>"
// 	              	+"<button class='deleteCommentBtn' data-deletecombtn='"+result[i].commentNo+"' type='button' style='cursor:pointer;margin-right:20%;'>DELETE</button>"
// 	              	+"<button class='updateCommentBtn' data-updatecombtn='"+result[i].comment+"' data-updatecomno='"+result[i].commentNo+"' type='button' style='cursor:pointer;'>UPDATE</button>"
	              	+"<button type='button' class='btn btn-outline-success' data-updatecombtn='"+result[i].comment+"' data-updatecomno='"+result[i].commentNo+"' style='margin-left:70%;'>UPDATE</button>"
	              	+"<button type='button' class='btn btn-outline-danger' data-deletecombtn='"+result[i].commentNo+"' style='margin-left:5%;'>DELETE</button>"
	              	+"<hr>"
			);
	    	}
	    })
    }
    
    
    
    
    
    //tooltip
//     $('[data-toggle="tooltip"]').tooltip()

    </script>
</body>
</html>