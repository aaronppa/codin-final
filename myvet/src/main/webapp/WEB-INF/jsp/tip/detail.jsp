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
    <link rel="stylesheet" href="/myvet/resources/css/tip&qna/detail.css">
    <!-- 좋아요,싫어요 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></script>
    
    
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
   <!--Comment-->
   
   <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
   <meta name="viewport" content="width=device-width">

    <!--bootstrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    

    <style>

    </style>
</head>

<body>
   	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div class="container">
    <div class="notes-wrapper">
<!--     <input type="hidden" name="boardCode" id="boardCode" value="11"> -->
            <div class="saver-wrap" contenteditable="false">
                <div class="notes-dot" contenteditable="false"></div>
                <div class="rest" contenteditable="false"></div>
            </div>
            <div class="writer" aria-placeholder="writer..">
                <img src="/myvet/resources/img/gall&tip/pony01.jpg" class="rounded-circle">&nbsp;PONY
            </div>
            <div class="information">
           		<c:if test="${tip.categoryCode eq 1 }">
           			<i id="category">category : 건강</i>
           		</c:if>
           		<c:if test="${tip.categoryCode eq 2 }">
           			<i id="category">category : 생활</i>
           		</c:if>
           		<c:if test="${tip.categoryCode eq 3 }">
           			<i id="category">category : 용품</i>
           		</c:if>
           		<c:if test="${tip.categoryCode eq 4 }">
           			<i id="category">category : 기타</i>
           		</c:if>
               <i class="fas fa-heart" id="tipRecomHeart">&nbsp;</i><span id="tipRecomCnt">${sumRecommend}</span> 
                <i class="far fa-eye" >&nbsp; ${tip.viewCnt}</i>
                <i class="far fa-clock">&nbsp;<fmt:formatDate value="${tip.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></i>
              </div>
		  <div class="report" data-toggle="modal" data-target="#exampleModal">
               		<i class="fas fa-exclamation-triangle" id="tipReport">신고하기</i>
               
		  </div>
            <div class="title" aria-placeholder="title..">
				${tip.title }
            </div>
            <div class="content" >
				${tip.content }
            </div>
            <span data-toggle="tooltip" title="포니, 포돌이">
            </span>
          <!-- 좋아요,싫어요 -->
			 <div class="rating">
			 <input type="hidden" name="memberNo" id="memberNo" value="8">
			 <input type="hidden" name="recommend" id="recommend" value="${recom}">
			  <!-- Thumbs up -->
			  <div class="like grow">
			    <i id="like" class="fa fa-thumbs-up fa-3x like <c:if test='${recom == 1}'>active</c:if>"
			     aria-hidden="true" data-like=""></i>
			  </div>
			  <!-- Thumbs down -->
			  <div class="dislike grow">
			    <i id="dislike" class="fa fa-thumbs-down fa-3x dislike <c:if test='${recom == -1}'>active</c:if>" aria-hidden="true" data-dislike=""></i>
			  </div>
			</div>
		  
          <!-- 삭제, 수정 -->
            <div id="delete-update">
	            <a href="<c:url value='/tip/list.do'/>">
	                <span id="list" data-toggle="tooltip" title="LIST" class="btn btn-primary">
		                  <strong>List</strong>
	                </span>
	            </a>
                 <a href="<c:url value='/tip/updateForm.do?tipNo=${tip.tipNo }'/>" class="btn btn-primary">
	               <span id="update" data-toggle="tooltip" title="UPDATE">
	                  		<strong>Update</strong>
	               </span>
                 </a>
                <a href="<c:url value='/tip/delete.do?tipNo=${tip.tipNo }'/>" class="btn btn-danger">
    	            <span id="delete" data-toggle="tooltip" title="DELETE">
						<strong>Delete</strong>
	                </span>
                </a>
            </div>
            
            <!--Comment-->
            <div class="comment">
                <div class="comments">
<!--                 <form action="" method="post"> -->
                    <div class="comment-wrap">
                        <div class="photo">
                			<img src="/myvet/resources/img/gall&tip/pony01.jpg" class="rounded-circle">&nbsp;PONY
                        </div>
                        <input type="hidden" name="tipNo" id="tipNo" value="${tip.tipNo}">
                        <input type="hidden" class="commenterNo"name="commenterNo" id="commenterNo" value="7">
                        <div class="comment-block">                            
                           <textarea name="comment" id="comment" cols="30" rows="4" placeholder="300자 이내..." ></textarea>
                           <span id="counter">###</span>
                           <input type="submit" class="commentSubmit" >
                       </div>
                     </div>
<!--                 </form> -->
                <!-- 댓글 목록-->
                <i class="far fa-comments">&nbsp;${countComment}</i>
                </div>
                <br>
				<div class="comment-list" >
				</div>
                </div>
                
            </div> 
    </div>  
     
            <br>   
  		  
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
	
        //신고하기 팝업창
        $('#tipReport').click(function(){
        	window.open("/myvet/report/reportTipForm.do?tipNo=${tip.tipNo}","report","width=1000, height=600, left=500, top=10")
        })
        
        //리스트 이전
//         $('.btn-primary').click(function(){
//         	window.history.back();
//         })


// 		$("#list").click(function(){
// 			$.ajax(function(){
// 				url: "/myvet/tip/list.do",
// 				data: "keyword="++
// 			})
// 		})
        
        //댓글 글자 입력수
		$(function typing() {
		      $('#comment').keyup(function (e){
		          var content = $(this).val();
		          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		          $('#counter').html(content.length + '/300');
		      });
		      $('#comment').keyup();
		});
        
        //댓글 글자 입력수 끝
        
        
        var typingTimer;
        var doneTypingInterval = 10;
        var finaldoneTypingInterval = 2000;

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        };

        var today = new Date();
        var m = today.getMonth();
        var d = today.getDate();

        m = checkTime(m);
        d = checkTime(d);

        $('.content, .title').keydown(function() {
            clearTimeout(typingTimer);
            if ($('.content, .title').val) {
                typingTimer = setTimeout(function() {
                $(".rest").removeClass('active');
                    $(".notes-dot").removeClass('saved');
                }, doneTypingInterval);
            }
        });

        $('.content, .title').keyup(function() {
            clearTimeout(typingTimer);
            typingTimer = setTimeout(function() {
                $('.rest').addClass('active');
                $('.notes-dot').addClass('saved');
                $('.comment').html('Last updated by you on ' + d + '/' + m +'')
            }, finaldoneTypingInterval);
        });

        function previewFile() {
            var file = document.querySelector('input[type=file]').files[0];
            var reader  = new FileReader();

            reader.onloadend = function () {
                reader.result;
                console.log(reader.result);
                $('.content').append('<img src="' + reader.result + '" />');
            }

            if (file) {
                reader.readAsDataURL(file);
                clearTimeout(typingTimer);
                typingTimer = setTimeout(function() {
                    $('.rest').addClass('active');
                    $('.notes-dot').addClass('saved');
                    $('.comment').html('Last updated by you on ' + d + '/' + m +'')
                }, finaldoneTypingInterval);
            } else {
            }
        }

        document.onpaste = function(event){
            var items = (event.clipboardData || event.originalEvent.clipboardData).items;
            console.log(JSON.stringify(items)); // will give you the mime types
            for (index in items) {
                var item = items[index];
                if (item.kind === 'file') {
                var blob = item.getAsFile();
                var reader = new FileReader();
                reader.onload = function(event){
                        console.log(event.target.result); // data url!
                        $('.content').append('<img src="' + event.target.result + '" />');
                        $('.comment').html('Last updated by you on ' + d + '/' + m +'')
                    };
                reader.readAsDataURL(blob);
                }
            }
        }
        
        
        //댓글 등록
        	$(".commentSubmit").click(function(){
			console.log("function")
			$.ajax({
				url: "/myvet/tip/writeComment.do",
				data: "tipNo="+$("#tipNo").val()+"&commenterNo="+$(".commenterNo").val()+"&comment="+$("#comment").val()

			}).done(function(result){
				console.log("성공:"+result);
				$("#comment").val('')
				$(".comment-list").children().remove();
				list();
				$("#counter").val().remove();
				typing();
				
			}).fail(function(result){
				console.log($("#tipNo").val());
				console.log($("#commenterNo").val());
				console.log($("#comment").val());
				console.log("실패"+result);
			});
		});
	
        
        
        
        //댓글 목록
        
        $(function(){
        	list();
        })
        
        function list(){
        	$.ajax({
        		url:"/myvet/tip/commentList.do",
        		type: "post",
        		data: {tipNo : $("#tipNo").val()},
        		datatype:"json"
        	}).done(function(result){
        		console.log("성공 tipNo"+result);
//         		console.log(result[1].comment)
               for (let i = 0; i < result.length; i++) {
            	   let likeRecommend = "", dislikeRecommend = "";
            	   if(result[i].recommend == 1){
            		   likeRecommend = "comActive";
            	   }else if(result[i].recommend == -1){
            		   dislikeRecommend = "comActive";
		     	   }
                $(".comment-list").append(
                "<img src='/myvet/resources/img/gall&tip/pony01.jpg' class='rounded-circle'/>&nbsp;"
              	+"<button class='com-like "+likeRecommend+"' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-up'></i>"
              	+"</button><button class='com-dislike "+dislikeRecommend+"' data-comno='"+result[i].commentNo+"'>"+"<i class='far fa-thumbs-down'></i>"+"</button>"	
            	+"<i class='fas fa-heart'></i><span id='recommendCnt"+result[i].commentNo+"'>"+result[i].recommendCnt+"</span>"
            	
            	+"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"'></div>"
                +"<div class='comment-content'>" 
	                +"<input type='hidden' class='commentval' data-commentval='"+result[i].commentNo+"' value='"+result[i].comment+"'/>"
	                +"<div class='comment' data-comment='"+result[i].comment+"' height:auto;'>"+result[i].comment+"</div>"
              	+"</div>"
              	+"<button class='deleteCommentBtn' data-deletecombtn='"+result[i].commentNo+"' type='button'>DELETE</button>"
              	+"<button class='updateCommentBtn' data-updatecombtn='"+result[i].comment+"' data-updatecomno='"+result[i].commentNo+"' type='button' >UPDATE</button>"
              	+"<hr>"
                );
			}
        	}).fail(function(result){
        		console.log("실패 tipNo"+result.val())
        	})
        
        }
        	
        function detail(){
        	$.ajax({
        		url:"/myvet/tip/detail.do",
        		data:"tipNo=${tip.tipNo}"
        	}).done(function(){
        		console.log("detail!");
        	})
        }
        //추천
        
       	$("#like").on('click',function(){
       		var isActive = $(this).hasClass('active');
       		//$("#tipRecomCnt").remove();
       		var tipRecomCnt = $('#tipRecomCnt');
       		console.log(tipRecomCnt.text());
       		
       		detail();
       		if($('#dislike').hasClass('active')){
       			alert('이미 싫어요를 눌렀어요')
       			return false;
       		}
       		if(isActive == true){
       			tipRecomCnt.text(parseInt(tipRecomCnt.text()) - 1) ;
       			insertRecommend(0);
       		}else{
       			tipRecomCnt.text(parseInt(tipRecomCnt.text()) + 1) ;
       			
       			insertRecommend(1);

       		}
       		$(this).toggleClass('active')
       	})
        
       function insertRecommend(recommend){
        	$.ajax({
        		url:"/myvet/tip/insertRecommend.do",
        		data:"tipNo=${tip.tipNo}&recommend="+recommend
        	}).done(function(){
        		console.log("insertRecommend-success")
        	})
        }
        
        $('#dislike').on('click',function(){
        	var isActive = $(this).hasClass('active');
        	var tipRecomCnt = $('#tipRecomCnt');
       		detail();
       		if($('#like').hasClass('active')){
       			alert('이미 좋아요를 눌렀어요')
       			return false;
       		}
//         	alert(isActive);
			//싫어요 취소
        	if(isActive == true){
        		insertRecommend(0);
       			tipRecomCnt.text(parseInt(tipRecomCnt.text()) + 1) ;

   			//싫어요 
        	}else{
        		insertRecommend(-1);
       			tipRecomCnt.text(parseInt(tipRecomCnt.text()) - 1) ;

        	}
        	$(this).toggleClass('active')
        })
       	//댓글 추천
       	//댓글 좋아요
    	$('.comment-list').on('click', '.com-like', function(){
//     		alert('com-like!')
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
	    		url:"/myvet/tip/insertCommentRecommend.do",
	    		data:"commentNo="+commentNo+"&recommend="+recommend
	    	}).done(function(){
	    		console.log("insertCommentRecommend-success")
	    		
	    	})
	    }
    
    
        	
        	//댓글 삭제
        	$(".comment-list").on("click", ".deleteCommentBtn", function(){
        		console.log("delete!");
        		console.log("작성자 : "+$(".commenterNo").val());
        		console.log("댓글 번호 : "+$(this).data("deletecombtn"));
        		$.ajax({
        			url: "/myvet/tip/deleteComment.do",
        	/* 		data: {
        				commentNo: $(this).data("deletecombtn"),
        				commenterNo: $(".commenterNo").val()
        				},
 					dataType:"json" */
 					data:"commentNo="+$(this).data("deletecombtn")+"&commenterNo="+$(".commenterNo").val()
        		})
        		.done(function(){
        			console.log("deleteComplete");
        			$(".comment-list").children().remove();
        			list();
        		})
        		.fail(function(){
        			console.log("deleteFail")
        		})
        	});
        
       	
        
        
       		 //수정 폼
        	$(".comment-list").on("click", ".updateCommentBtn",  function(){
        		console.log("updateForm!");
        		console.log("작성자 : "+$(".commenterNo").val());
        		console.log("댓글 번호 : "+$(this).data("updatecomno"));
        		console.log("댓글 내용 : "+ $(this).data("updatecombtn"));
        		console.dir($(this).prev().prev());
        		$(this).prev().prev().replaceWith(
           		"<textarea id='updateCommentForm'placeholder='댓글수정..' cols='100' rows='2' >"+$(this).data('updatecombtn')+"</textarea>"
        		)
        		$(this).prev().replaceWith(
        		"<button class='cancelupdatecom'>취소</button>"		
        		)
        		$(this).replaceWith(
        		"<button class='submitupdatecom'>제출<button>"		
        		)
        	})
        		
       			$(".comment-list").on("click", ".cancelupdatecom", function(){
        			console.log("cancel");
     				console.log("textarea : "+$(this).prev().val());
     		        console.dir("this : "+$(this).prev().prev());
     		        $(".comment-list").children().remove();
       				list();
        		})
        		
        		$(".comment-list").on("click", ".submitupdatecom", function(){
        			console.log("submitcom")
        			console.dir($(this).prev().prev())//댓글내용 경로
        			console.log($(this).prev().prev().val())//댓글 내용
        			console.log($(".commenterNo").val())//작성자
					console.log($(this).prev().prev().prev().data("commentno"))//댓글번호        
					$.ajax({
						url : "/myvet/tip/updateComment.do",
						data : "commentNo="+$(this).prev().prev().prev().data("commentno")
							   +"&commenterNo="+$(".commenterNo").val()
							   +"&comment="+$(this).prev().prev().val()
						}).done(function(){
							console.log("success")
							$(".comment-list").children().remove();
							list();
						}).fail(function(){
							console.log("fail")
						})
						
        		})
						
						
        
        //like-dislike
// 		$("#like").toggle(
// 		    function(){$("i").css({"color": "red"})}
// 		});
        
// 		if($("#layer").css("display") == "none"){
// 			$("#layer").show();
// 		}else{
// 			$("#layer").hide();
// 		}
// 	}
        
        //tooltip
//         $(function(){
// 	        $('[data-toggle="tooltip"]').tooltip()
        	
//         })

        </script>
</body>
</html>