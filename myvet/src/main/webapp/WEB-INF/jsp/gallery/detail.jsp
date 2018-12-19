<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="/myvet/resources/css/gallery/detail.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
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
/*   .container{ */
/* 		position:relative; */
/* 		top:80px; */
/* 	} */
/* 	@media */
/* 	.container { */
/* 	    max-width: 100% !important; */
/* 	} */
    .carousel-3d-slide {
      height: auto !important;
      background-color: rgba(0, 0, 0, 0.25) !important;
     }
     .information{
  	 text-align: right;
  
    }
    .regDate{
    	text-align: right;
    }
	.fa-heart{
    	margin-left: 5%;
    }
	.photo{
		text-align: center;
	}

    .updateDel{
    	text-align: right;
    }
      .comActive{
		color: blue;
		transition:.5s;
	}

    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	            
	<input type="hidden" name="memberNo" id="memberNo" value="${user.memberNo}">
    <div class="container">
           <div class="writer" style="text-align: center;">
				<img src="/myvet/resources/img/gall&tip/profile.png" class="rounded-circle" id="writer-img">
             	<span class="writerNick">${gallery.memberNickname}</span>
			</div>
			<hr>
            <div id="title" style="text-align: center;"><strong>${gallery.title}</strong></div>
<!--         <div id="row"> -->
            <hr>
			<div class="regDate">
		       <i class="far fa-clock">&nbsp;<fmt:formatDate value="${gallery.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></i>
			</div>
            <!-- <div class="col-md-7 col-md-offset-1"> -->
             <div id="pic-form">
                <!-- carousel -->
                <div id="carousel">
			    <carousel-3d :autoplay="true" :autoplay-timeout="100000">
			      
         <c:forEach var="f" items="${gallery.fileInfoList}" varStatus="loop">
			      <slide :index="${loop.index}"><img src="/myvet/upload${f.filePath}/${f.sysName}"/></slide>
         </c:forEach>

			    </carousel-3d>
			  </div>
              <div id="content" style="text-align: center;font-size:20px;">${gallery.content}</div>
			<br>
			<br>
	        <div class="information">
		         <span class="view">view : ${gallery.viewCnt}</span>
		         <i class="fas fa-heart" id="galleryRecomHeart"></i><span id="galleryRecomCnt">${sumRecommend}</span> 
	         </div>
			<hr>
                    <div class="pet">
                    <c:forEach var="p" items="${gallery.petList}" varStatus="loop">
                        <span data-toggle="tooltip" title="${p.petName}">
                            <img class="petImg rounded-circle" id="petImg" src="/myvet/upload${p.petFilePath}/${p.petSysName}" onerror="this.src='/myvet/resources/img/gall&tip/myvet.png'" style="margin-right: 10px;">
                        </span>
                    </c:forEach>
<!--                         <span data-toggle="tooltip" title="PODOL"> -->
<!--                             <img class="petImg rounded-circle" src="/myvet/resources/img/gall&tip/pony02.jpg" id="pet-img"> -->
<!--                         </span> -->
                    </div>
                    <hr>
                    <br>
                   	<div>
                   	<input type="hidden" name="recommend" id="recommend" value="${recommend}">
                            <div id="thumbs" >
                           	  <i id="like" class="fa fa-thumbs-up fa-3x like <c:if test='${recommend == 1}'>active</c:if>"
							     aria-hidden="true" data-like=""></i>
							  <i id="dislike" class="fa fa-thumbs-down fa-3x dislike <c:if test='${recommend == -1}'>active</c:if>" 
							     aria-hidden="true" data-dislike=""></i>
                            </div>
               		<div class="updateDel">
               			<c:if test="${gallery.writerNo == user.memberNo}">
	                        <a href="<c:url value='/gallery/updateForm.do?galleryNo=${gallery.galleryNo}'/>" id="updateGall">
	                           	<button type="button" class="btn btn-success">수정</button>
							</a>
               			</c:if>
               			<c:if test="${gallery.writerNo == user.memberNo}">
	                        <a href="<c:url value='/gallery/delete.do?galleryNo=${gallery.galleryNo}'/>" id="deleteGall">
	                           	<button type="button" class="btn btn-danger">삭제</button>
	                        </a>
                        </c:if>
                        <a href="<c:url value='/gallery/list.do'/>">
                           	<button type="button" class="btn btn-light">목록</button>
                        </a>
                                     
                	</div>
                </div>
                <br>
                    
<!--                 </div> -->
<!-- 				<div class="w-100"></div> -->
                <div id="comment"> 
                        <div class="detail-content"  >
                            <br>
      
<!--                             <i class="fas fa-exclamation-triangle" id="galleryReport">신고하기</i> -->
<!--                             <br> -->
<!--                             <br> -->
<!--                             <br> -->
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
                                                    <img src="/myvet/resources/img/gall&tip/profile.png" id="writer-pic" class="rounded-circle" >
                                                	<p class="commenter"><strong>${user.memberNickname}</strong></p>
                                            </div>&nbsp;&nbsp;
                                            <!-- 댓글 등록 -->
                                        	<div class="comment-block">
                                            <input type="hidden" id="commenterNo" name="commenterNo" value="${user.memberNo}">
                                            <input type="hidden" id="galleryNo" name="galleryNo" value="${gallery.galleryNo}">
                                                <textarea name="comment" id="input-comment" cols="30" rows="3" placeholder="Add comment..."></textarea>
                                            	<span id="counter">###</span>
                                            </div>
                                        </div>
                                            <ul class="comment-actions">
                                                <li class="registration">등록</li>
                                            </ul>
                                            <br>
									<!-- 댓글 수 -->
                                    <i class="far fa-comments"></i><span id="">&nbsp;${countComment}</span>
                                            <hr>
                                    <!-- 댓글 목록-->
                                     
                                        <div class="comment-wrap comment-list" id="comment-list">
                                        
                                        <!-- 댓글목록 끝 -->
                                    </div>
                                </div>
                        </div>
                    </div>
<!--                 </div> -->
        </div>
        </div>
  
    </div>

  <!-- Swiper JS -->
  <!-- <script src="../dist/js/swiper.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.7/vue.js"></script>
  <script src="https://rawgit.com/Wlada/vue-carousel-3d/master/dist/vue-carousel-3d.min.js"></script>
    <script>
    //petImg
//     $("#updateGall").click(function(){
//     	if()
//     })
    
    
    //carousel
      //https://github.com/Wlada/vue-carousel-3d
    new Vue({
    el: '#carousel',
    data: {
        slides: 7
    },
    components: {
        'carousel-3d': Carousel3d.Carousel3d,
        'slide': Carousel3d.Slide
    }
    })
    //end carousel
    function detail(){
    	$.ajax({
    		url:"/myvet/gallery/detail.do",
    		data:"galleryNo=${gallery.galleryNo}"
    	}).done(function(){
    		console.log("detail!");
    	})
    }
//     console.log($('#writerNick').val())
    //게시글 추천
    $("#like").on('click',function(){
       		var isActive = $(this).hasClass('active');
//        		$("#galleryRecomCnt").remove();
       		var galleryRecomCnt = $('#galleryRecomCnt');
       		console.log(galleryRecomCnt.text());
       		detail();
       		if($('#dislike').hasClass('active')){
       			alert('이미 싫어요를 눌렀어요')
       			return false;
       		}
       		if(isActive == true){
       			galleryRecomCnt.text(parseInt(galleryRecomCnt.text()) - 1) ;
       			insertRecommend(0);
       		}else{
       			galleryRecomCnt.text(parseInt(galleryRecomCnt.text()) + 1) ;
       			
       			insertRecommend(1);

       		}
       		$(this).toggleClass('active')
       	})
       	
       	 function insertRecommend(recommend){
        	$.ajax({
        		url:"/myvet/gallery/insertRecommend.do",
        		data:"galleryNo=${gallery.galleryNo}&memberNo=${user.memberNo}&recommend="+recommend
        	}).done(function(){
        		console.log("insertRecommend-success")
        	})
        }
    //게시글 비추
    $('#dislike').on('click',function(){
    	var isActive = $(this).hasClass('active');
    	var galleryRecomCnt = $('#galleryRecomCnt');
   		detail();
   		if($('#like').hasClass('active')){
   			alert('이미 좋아요를 눌렀어요')
   			return false;
   		}
//     	alert(isActive);
		//싫어요 취소
    	if(isActive == true){
    		insertRecommend(0);
   			galleryRecomCnt.text(parseInt(galleryRecomCnt.text()) + 1) ;

			//싫어요 
    	}else{
    		insertRecommend(-1);
   			galleryRecomCnt.text(parseInt(galleryRecomCnt.text()) - 1) ;

    	}
    	$(this).toggleClass('active')
    })
       	
       	
       	
    
    //게시글 신고
     $('#galleryReport').click(function(){
     	window.open("/myvet/report/reportGalleryForm.do?galleryNo=${gallery.galleryNo}","report","width=1000, height=600, left=500, top=10")
     })
    
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
    		$('#comment-list').children().remove();
    		list();
//     		$('#counter').val().empty();
//     		typing();
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
	    	console.log(result)
	    		let likeRecommend = "", dislikeRecommend = "";
	    	for(let i=0; i < result.length; i++){
	    		if(result[i].recommend == 1){
	    			likeRecommend = "comActive";
	    		}else if(result[i].recommend == -1){
	    			dislikeRecommend = "comActive";
	    		}
	    		console.log(likeRecommend)
			$('#comment-list').append(
				//작성자 이미지
					"<img src='/myvet/resources/img/gall&tip/profile.png' class='commenterImg rounded-circle'/>&nbsp;"+"<p>"+result[i].member.memberNickname+"</p>"
// 					+"<span>"+result[i].member.memberNickname+"</span>"
// 	              	+"<div class='recommendForm'>"
// 	              	+"<button class='com-like "+likeRecommend+"' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-up'></i>"
// 	              	+"</button><button class='com-dislike "+dislikeRecommend+"' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-down'></i>"+"</button>"	
// 	            	+"</div>"
// 	              	+"<div class='comheartform'>"
// 	              	+"<i class='fas fa-heart comheart'></i><span id='recommendCnt"+result[i].commentNo+"'>"+(result[i].recommendCnt == true?result[i].recommendCnt:0)+"</span>"
// 	            	+"</div>"
// 	            	+"<i class='fas fa-exclamation-circle' data-comno='"+result[i].commentNo+"' style='margin-left:10px;'></i>"
	            	+"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"' data-commenterno="+result[i].commenterNo+"></div>"
	                +"<div class='comment-content'>" 
		                +"<input type='hidden' class='commentval' data-commentno='"+result[i].commentNo+"'/>"
		                +"<input type='hidden' class='commentval' data-commenterno='"+result[i].commenterNo+"'/>"		                
		                +"<div class='comment' data-comment='"+result[i].comment+"' height:auto;'>"+result[i].comment+"</div>"
	              	+"</div>"
// 	              	+"<div class='btnForm'>"

	              	+"<button type='button' id='updateCom' class='btn btn-outline-primary up"+result[i].commenterNo+"' data-updatecombtn='"+result[i].comment+"' data-updatecomno='"+result[i].commentNo+"'>UPDATE</button>"
		            +"<button type='button' id='deleteCom' class='btn btn-outline-danger del"+result[i].commenterNo+"' data-deletecombtn='"+result[i].commentNo+"' >DELETE</button>"	              		
// 	              	+"</div>"
		            +"<hr>"
			);
	    		console.log("memberNo : "+$("#memberNo").val());
	    		console.log("commenterNo : "+result[i].commenterNo);
	    		if($("#memberNo").val() != result[i].commenterNo){

					console.log("ininin")
					$('.up'+result[i].commenterNo).css('visibility','hidden');
					$('.del'+result[i].commenterNo).css('visibility','hidden');
	    		}
	    	}
	    })
    }
	
   
    
	$(".comment-list").on("click",".fa-exclamation-circle",function(){
		window.open("/myvet/report/reportCommentForm.do?boardCode=10&commentNo="+$(this).data("comno"),"report","width=1000, height=600, left=500, top=10")
	})
	
	//댓글 수정폼
	$("#comment-list").on("click","#updateCom",function(){
		console.dir($(this).prev())
		$(this).prev().replaceWith(
         "<textarea id='textcom' placeholder='댓글수정..' cols='70' rows='3'>"+$(this).data('updatecombtn')+"</textarea>"		
		)
		$(this).next().replaceWith(
		"<button class='btn btn-outline-dark' id='cancelupdatecom'>취소</button>"		
		)
		$(this).replaceWith(
		"<br><br>"
		+"<button class='btn btn-outline-primary' id='submitupdatecom'>제출<button>"		
		)
	})

	//댓글 삭제
    $("#comment-list").on("click","#deleteCom",function(){
    	$.ajax({
    		url: "/myvet/gallery/deleteComment.do",
    		data: "commentNo="+$(this).data("deletecombtn")+"&commenterNo="+$("#commenterNo").val()
    	}).done(function(result){
    		console.log("댓글삭제 완료")
    		$("#comment-list").children().remove();
    		list();
    	})
    })
    //댓글 수정 취소
    $("#comment-list").on("click","#cancelupdatecom",function(){
		$("#comment-list").children().remove();
    	list();
    })
    //댓글 수정 제출
   $("#comment-list").on("click","#submitupdatecom",function(){
		console.dir($(this).prev().prev().prev())//댓글수정내용
		console.dir($(this).prev().prev().prev().prev())//댓글 번호
		console.log($(this).prev().prev().prev().prev().data("commenterno"))//댓글 작성자
		console.log($(this).prev().prev().prev().prev().data("commentno"))//댓글 번호
		
		$.ajax({
			url:"/myvet/gallery/updateComment.do",
			data:"commentNo="+$(this).prev().prev().prev().prev().data("commentno")
				+"&commenterNo="+$(this).prev().prev().prev().prev().data("commenterno")
				+"&comment="+$(this).prev().prev().prev().val()
		}).done(function(){
			console.log("댓글 수정..!")
			$("#comment-list").children().remove();
    		list();
		})
		
	//댓글 추천
	
    	$('.comment-list').on('click', '.com-like', function(){
     		alert('com-like!')
			var recomCnt = $('#recommendCnt'+$(this).data('comno'));
       		var isActive = $(this).hasClass('comActive');
//        		alert(recomCnt);
//        		if($('.com-dislike').hasClass('comActive')){
//        			if($(this).data('comno') == $('.com-dislike').data('comno')){       				
//        			alert('이미 싫어요를 누르셨잖아여')
// 				return false;
//        			}
// 				console.log($(this).next())
       			if($(this).next().hasClass('comActive')){       				
       			alert('이미 싫어요를 누르셨잖아여')
				return false;
       			
			}
			//좋아요 
       		if(isActive == true){
       			recomCnt.text(parseInt(recomCnt.text()) - 1) ;
       			insertCommentRecommend(0, $(this).data('comno'));
       		//좋아요 취소
       		}else{
       			recomCnt.text(parseInt(recomCnt.text()) + 1) ;
       			insertCommentRecommend(1, $(this).data('comno'));
       		}
       		$(this).toggleClass('comActive')
    		
    	})
    	//댓글 싫어요
       	$('.comment-list').on('click', '.com-dislike', function(){
//     		alert('com-like!')
			var recomCnt = $('#recommendCnt'+$(this).data('comno'));
       		var isActive = $(this).hasClass('comActive');
//        		alert(isActive);
       		if($(this).prev().hasClass('comActive')){       				
       			alert('이미 좋아요를 누르셨잖아여')
				return false;
       			}
			
			//싫어요 취소
       		if(isActive == true){
       			recomCnt.text(parseInt(recomCnt.text()) + 1) ;
       			insertCommentRecommend(0, $(this).data('comno'));
       		}else{//싫어요
       			recomCnt.text(parseInt(recomCnt.text()) - 1) ;
       			insertCommentRecommend(-1, $(this).data('comno'));
       		}
       		$(this).toggleClass('comActive')
    	})
	 	function insertCommentRecommend(recommend, commentNo){
	       		console.log(recommend, commentNo)
	    	$.ajax({
	    		url:"/myvet/gallery/insertCommentRecommend.do",
	    		data:"commentNo="+commentNo+"&recommend="+recommend
	    	}).done(function(){
	    		console.log("insertCommentRecommend-success")
	    	})
	    }
	
	
	
// 	   $("#comment-list").children().remove();
//     	list();
    })
    
//     tooltip
    $('[data-toggle="tooltip"]').tooltip()
	
    </script>
</body>
</html>