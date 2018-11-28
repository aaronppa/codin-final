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
    .notes-wrapper .saver-wrap {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}

*, *:before, *:after, h2, p {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border: none;
  background-color: transparent;
}
*:focus, *:before:focus, *:after:focus, h2:focus, p:focus {
  outline: none;
}

html, body {
  width: 100%;
  height: 100%;
  padding: 10px 0;
  margin: 0;
  background-color: #eee;
  /* background-color: none; */
  font-family: 'Source Sans Pro';
  padding-bottom: 50px;
  overflow: none;
  
}

.notes-wrapper {
  max-width: 1000px;
  width: 100%;
  margin: 0 auto;
  height: 700px;
  background-color: #fff; 
  border-radius: 5px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  position: relative;
  z-index: 999;
  overflow-y: scroll;
  overflow-x:hidden;
}

.notes-wrapper .saver-wrap {
  width: 60px;
  height: 60px;
  position: absolute;
  right: 0;
  top: 0;
}
.notes-wrapper .saver-wrap .notes-dot {
  width: 10px;
  height: 10px;
  background-color: #D1D3D6;
  border-radius: 50px;
  transition: .1s ease-in-out;
}
.notes-wrapper .saver-wrap .notes-dot.saved {
  background-color: #66cc8f;
  transition: .1s ease-in-out;
  transition-delay: 2.10s;
}
.notes-wrapper .saver-wrap .rest {
  -webkit-transform: scale(0);
          transform: scale(0);
  clip: rect(0, 30px, 30px, 15px);
  height: 30px;
  width: 30px;
  position: absolute;
  left: calc(50% - 15px);
  top: calc(50% - 15px);
}
.notes-wrapper .saver-wrap .rest.active {
  -webkit-animation: animate 1.05s linear 2;
          animation: animate 1.05s linear 2;
}
.notes-wrapper .saver-wrap .rest.active:after {
  -webkit-animation: animate2 1.05s linear 2;
          animation: animate2 1.05s linear 2;
}
.notes-wrapper .saver-wrap .rest:after {
  -webkit-transform: scale(0);
          transform: scale(0);
  clip: rect(0, 30px, 30px, 15px);
  content: '';
  border-radius: 50%;
  height: 30px;
  width: 30px;
  position: absolute;
}
.notes-wrapper .writer {
  padding: 25px 30px;
  padding-right: 60px;
  font-weight: 600;
/*   color: #000C2F; */
  font-size: 13px;
  text-transform: uppercase;
  position: relative;
}
.notes-wrapper .title {
  padding: 25px 30px;
  padding-right: 60px;
  font-weight: 600;
/*   color: #000C2F; */
  font-size: 13px;
  text-transform: uppercase;
  position: relative;
}
.notes-wrapper .content {
  padding: 10px 30px;
  padding-bottom: 15px;
  font-weight: 400;
/*   color: #666D82; */
  line-height: 1.4;
  font-size: 14px;
  
}
.notes-wrapper .content span.bold {
  font-weight: 700;
}
.notes-wrapper .content img {
  width: 90%;
  border-radius: 5px;
  margin: 15px 5%;
}
.notes-wrapper .comment {
  height: 60px;
  line-height: 60px;
  text-align: left;
  font-size: 13px;
/*   color: #999EAC; */
  position: relative;
}
.notes-wrapper .getImg {
  width: 60px;
  height: 60px;
  /* position: left; */
  /* position: absolute; */
  bottom: 0;
  /* right: -15px; */
  text-align: center;
  cursor: pointer;
}
.notes-wrapper {
  line-height: 60px;
  /* color: #999EAC; */
  color:black;
  font-size: 30px;
  text-align: left;
}

.listnsub {
  max-width: 800px;
  width: 100%;
  text-align: center;
  
  height: auto;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  /* position: relative; */
  z-index: 999;
  font-size: 25px;
}
.rounded-circle{
    width: 50px;
    height: 50px;
}


@-webkit-keyframes animate {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
    -webkit-transform: rotate(220deg);
            transform: rotate(220deg);
  }
}

@keyframes animate {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
    -webkit-transform: rotate(220deg);
            transform: rotate(220deg);
  }
}
@-webkit-keyframes animate2 {
  0% {
    box-shadow: inset #D1D3D6 0 0 0 2px;
    -webkit-transform: rotate(-140deg);
            transform: rotate(-140deg);
  }
  100% {
    box-shadow: inset #D1D3D6 0 0 0 2px;
    -webkit-transform: rotate(140deg);
            transform: rotate(140deg);
  }
}
@keyframes animate2 {
  0% {
    box-shadow: inset #D1D3D6 0 0 0 2px;
    -webkit-transform: rotate(-140deg);
            transform: rotate(-140deg);
  }
  100% {
    box-shadow: inset #D1D3D6 0 0 0 2px;
    -webkit-transform: rotate(140deg);
            transform: rotate(140deg);
  }
}

/*Comment*/
html, body {
  background-color: #f0f2fa;
  font-family: "PT Sans", "Helvetica Neue", "Helvetica", "Roboto", "Arial", sans-serif;
  color: #555f77;
  -webkit-font-smoothing: antialiased;
}

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

/*댓글 제출*/
.commentSubmit:hover{
	background:gray;
	color: white;
	transition: .5s;
}

#deleteCommentBtn:hover{
	background: gray;
	color:white;
	transition: .5s;
}
#comment::-webkit-scrollbar{
	display: none;
	}
	

<!-- 좋아요 -->
.rating {
  text-align: center;
}

.like,
.dislike {
  font-size: 30px;
  display: inline-block;
  cursor: pointer;
  margin: 10px;
/*   color: gray; */
}

.dislike:hover,
.like:hover {
  color:red;
  transition: all .2s ease-in-out;
  transform: scale(1.1);
}

.active {
  color: red;
}
    </style>
</head>
   	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

<body style="overflow-y:hidden; overflow-y:hidden;">
    <div class="notes-wrapper">
            <div class="saver-wrap" contenteditable="false">
                <div class="notes-dot" contenteditable="false"></div>
                <div class="rest" contenteditable="false"></div>
            </div>
            <div class="writer" aria-placeholder="writer..">
                <img src="/myvet/images/pony01.jpg" class="rounded-circle">&nbsp;PONY
            </div>
            <div class="information" style="font-size: 20px;">
           		<c:if test="${tip.categoryCode eq 1 }">
           			<i style="margin-left:5%;">category : 건강</i>
           		</c:if>
           		<c:if test="${tip.categoryCode eq 2 }">
           			<i style="margin-left:5%;">category : 생활</i>
           		</c:if>
           		<c:if test="${tip.categoryCode eq 3 }">
           			<i style="margin-left:5%;">category : 용품</i>
           		</c:if>
                <i class="fas fa-heart" style="margin-left: 5%;color:red;">&nbsp;123</i> 
                <i class="far fa-eye" style="margin-left: 5%;">&nbsp; ${tip.viewCnt}</i>
                <i class="far fa-clock"style="margin-left: 34%;">&nbsp;<fmt:formatDate value="${tip.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/></i>
              </div>
		  <div class="report" style="text-align: right; font-size: 15px;">
               <i class="fas fa-exclamation-triangle" >신고하기</i>
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
			 <div class="rating" style="text-align: center;">
			  <!-- Thumbs up -->
			  <div class="like grow">
			    <i class="fa fa-thumbs-up fa-3x like" aria-hidden="true"></i>
			  </div>
			  <!-- Thumbs down -->
			  <div class="dislike grow">
			    <i class="fa fa-thumbs-down fa-3x like" aria-hidden="true"></i>
			  </div>
			</div>
		  
          <!-- 삭제, 수정 -->
            <div id="delete-update" style="text-align: center;">
                <span data-toggle="tooltip" title="LIST" style="margin-left: 60px;">
	                <a href="<c:url value='/tip/list.do'/>">
	                  <i class="fas fa-list"></i>
	                </a>
                </span>
                <span data-toggle="tooltip" title="UPDATE" style="margin-left: 60px;">
                   <a href="<c:url value='/tip/updateForm.do?tipNo=${tip.tipNo }'/>">
                    <i class="fas fa-pencil-alt"></i>
                   </a>
                </span>
                <span data-toggle="tooltip" title="DELETE" style="margin-left: 60px;">
	                <a href="<c:url value='/tip/delete.do?tipNo=${tip.tipNo }'/>">
	                  <i class="fas fa-trash-alt"></i>
	                </a>
                </span>
            </div>
            
            <!--Comment-->
            <div class="comment">
                <div class="comments">
<!--                 <form action="" method="post"> -->
                    <div class="comment-wrap">
                        <div class="photo">
                            <div class="avatar" style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg')"></div>
                        </div>
                        <input type="hidden" name="tipNo" id="tipNo" value="${tip.tipNo}">
                        <input type="hidden" class="commenterNo"name="commenterNo" id="commenterNo" value="1">
                        <div class="comment-block" style="-ms-overflow-style: none;">                            
                           <textarea name="comment" id="comment" cols="30" rows="4" placeholder="300자 이내..." ></textarea>
                           <span id="counter">###</span>
                           <input type="submit" class="commentSubmit" style="float: right; cursor: pointer; font-style: ">
                       </div>
                     </div>
<!--                 </form> -->
                <!-- 댓글 목록-->
                <i class="far fa-comments" style="margin-left: 5%; font-size: 20px;">&nbsp;${countComment}</i>
                </div>
                <br>
				<div class="comment-list" style="text-align: left;">
				
				</div>
                </div>
                
            </div> 
            <br>   
  		  
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
        //좋아요, 싫어요 토글
		    $('.like, .dislike').on('click', function() {
			    event.preventDefault();
			    $('.active').removeClass('active');
			    $(this).addClass('active');
			});
        
        
        
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
                console.log(reader.result)
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
                $(".comment-list").append(
                "<img src='/myvet/images/pony01.jpg' class='rounded-circle'style='width:45px;height:45px;'/>&nbsp;"
                +"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"'></div>"
                +"<div class='comment-content'>" 
	                +"<input type='hidden' class='commentval' data-commentval='"+result[i].commentNo+"' value='"+result[i].comment+"'/>"
	                +"<div class='comment' style='width:400px;font-size:20px;font-style:italic;' data-comment='"+result[i].comment+"' height:auto;'>"+result[i].comment+"</div>"
              	+"</div>"
              	+"<button class='deleteCommentBtn' data-deletecombtn='"+result[i].commentNo+"' type='button' style='cursor:pointer;margin-right:20%;'>DELETE</button>"
              		+"<button class='updateCommentBtn' data-updatecombtn='"+result[i].comment+"' data-updatecomno='"+result[i].commentNo+"' type='button' style='cursor:pointer;'>UPDATE</button>"
              	+"<hr>"
                );
			}
        	}).fail(function(result){
        		console.log("실패 tipNo"+result.val())
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
           		"<textarea placeholder='댓글수정..' cols='100' rows='2' style='border: gray;'>"+$(this).data('updatecombtn')+"</textarea>"
        		)
        		$(this).prev().replaceWith(
        		"<button class='cancelupdatecom' style='cursor:pointer;'>취소</button>"		
        		)
        		$(this).replaceWith(
        		"<button class='submitupdatecom' style='cursor:pointer;margin-left:20%;'>제출<button>"		
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