<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="/myvet/resources/css/tip&qna/detail.css">

<!-- 좋아요,싫어요 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></script>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<!--Comment-->

<link
	href='https://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic'
	rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width">

<!--bootstrap-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>


<style>
.defaultHidden {
	visibility: hidden;
}
/* 
.answer {
	visibility: hidden;
} */
.container{
		width:100%;
	postion:absolute;
	margin-top: 110px;
	
}
.answerPosition {
	margin-left: 88%;
	
	position: absolute;
}
.pickPicture{
	margin-left: 80%;
	
	position: absolute;
}
</style>
</head>


<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	<div class="container">
		<div class="notes-wrapper">
			<div class="saver-wrap" contenteditable="false">
				<div class="notes-dot" contenteditable="false"></div>
				<div class="rest" contenteditable="false"></div>
			</div>
			<div class="writer" aria-placeholder="writer..">
				<img src="/myvet/upload${qna.filePath }/${qna.sysname}" onerror="this.src='/myvet/resources/img/gall&tip/myvet.png'" class="rounded-circle">&nbsp;${qna.memberNickname}
			</div>
			<div class="information">

				<i class="category">category : ${qna.categoryName}</i> <i
					class="fas fa-heart" id="tipRecomHeart">&nbsp;</i><span
					id="qnaRecomCnt"><%-- ${qna.recomCnt} --%>${recommend }</span>

				<%--  <i class="fas fa-heart" id="tipRecomCnt" style="margin-left: 5%;color:red;">&nbsp;${countRecomment}</i>  --%>
				<i class="far fa-eye">&nbsp; ${qna.viewCnt}</i> <i
					class="far fa-clock">&nbsp;<fmt:formatDate
						value="${qna.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /></i>
			</div>
			<div class="report qnaReportBtn">
			<!-- 	<i class="fas fa-exclamation-triangle">신고하기</i> -->
			</div>
			<div class="title" aria-placeholder="title..">${qna.title }</div>
			<div class="content">${qna.content }</div>
			<span data-toggle="tooltip" title="포니, 포돌이"> </span>
			<!-- 좋아요,싫어요 -->
			<div class="rating">
				<input type="hidden" name="memberNo" id="memberNo" value="8">
				<input type="hidden" name="recommend" id="recommend"
					value="${recom}">
				
				<!-- Thumbs up -->
				<div class="like grow">
					<i id="like"
						class="fa fa-thumbs-up fa-3x like <c:if test='${recom == 1}'>active</c:if>"
						aria-hidden="true" data-like=""></i>
				</div>
				<!-- Thumbs down -->
				<div class="dislike grow">
					<i id="dislike"
						class="fa fa-thumbs-down fa-3x dislike <c:if test='${recom == -1}'>active</c:if>"
						aria-hidden="true" data-dislike=""></i>
				</div>
			</div>

			<!-- 삭제, 수정 -->
			<div id="delete-update">

				<a
					href="<c:url value='/qna/updateForm.do?qnaNo=${qna.qnaNo }&writerNo=${qna.writerNo }'/>">
					<span id="update" data-toggle="tooltip" title="UPDATE"
					class="btn btn-primary defaultHidden"> <strong>Update</strong>
				</span>
				</a> <a
					href="<c:url value='/qna/delete.do?qnaNo=${qna.qnaNo }&writerNo=${qna.writerNo }'/>"
					class="btn btn-danger defaultHidden"> <span id="delete"
					data-toggle="tooltip" title="DELETE"> <strong>Delete</strong>
				</span>
				</a> <a href="<c:url value='/qna/list.do'/>"> <span id="list"
					data-toggle="tooltip" title="LIST" class="btn btn-primary">
						<strong>List</strong>
				</span>
				</a>
			</div>

			<!--Comment-->
			<div class="comment">
				<div class="comments">
					<!--                 <form action="" method="post"> -->
					<div class="comment-wrap">
						<div class="photo">
							<div class="avatar"
								style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg')"></div>
						</div>
						<input type="hidden" name="qnaNo" id="qnaNo" value="${qna.qnaNo}">
						<input type="hidden" class="commenterNo" name="commenterNo"
							id="commenterNo" value="${user.memberNo}">
						<div class="comment-block">
							<textarea name="comment" id="comment" cols="30" rows="4"
								placeholder="300자 이내..."></textarea>
							<span id="counter">###</span> <input type="submit"
								class="commentSubmit">
						</div>
					</div>
					<!--                 </form> -->
					<!-- 댓글 목록-->
					<i class="far fa-comments">&nbsp;${countComment}</i>
				</div>
				<br>
				<div class="comment-list"></div>
			</div>

		</div>
		<br>
	</div>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>

 let CommentList =null;
	if("${qna.writerNo}" == "${user.memberNo}" ){
		
		$(".defaultHidden").css("visibility","visible");
 
	} 
	
	
	
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
                //////console.log(reader.result);
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
            //////console.log(JSON.stringify(items)); // will give you the mime types
            for (index in items) {
                var item = items[index];
                if (item.kind === 'file') {
                var blob = item.getAsFile();
                var reader = new FileReader();
                reader.onload = function(event){
                        //////console.log(event.target.result); // data url!
                        $('.content').append('<img src="' + event.target.result + '" />');
                        $('.comment').html('Last updated by you on ' + d + '/' + m +'')
                    };
                reader.readAsDataURL(blob);
                }
            }
        }
        
        

        
        //댓글 등록
        
        
           $(".commentSubmit").click(function(){
         //////console.log("function");
        
         if($("#comment").val() ==''){
        	 alert("댓글을 입력해주세요")
         }else{
	         $.ajax({
	            url: "/myvet/qna/writeComment.do",
	            type:"post",
	            dataType:"json",
	            header:
	               "content-type:text/html;charset=utf-8"
	            ,
	            data: /* "tipNo="+$("#tipNo").val()+"&commenterNo="+$(".commenterNo").val()+"&comment="+$("#comment").val() */
	               {qnaNo : location.search.substring(6).substring(1), commenterNo: $("#commenterNo").val(),content:$("#comment").val()}
	         }).done(function(result){
	 
	            list();
	    
	         }).fail(function(result,textStatus){
	 
	         });
         }//if-else
      });
   
        //댓글 목록
        
        list();
      
        let commenterNo=null;
        function list(){

           $.ajax({
              url:"/myvet/qna/commentList.do",
              type: "post",
              data: {qnaNo : location.search.substring(6).substring(1)},
              dataType:"json",
              header:
               "content-type:text/html;charset=utf-8"
            ,
           }).done(function(result){// 341~ 526까지가 done임
        	   
        	   console.log(result);

              $("#comment").val("");//댓글 입력창 초기화
         
               $(".comment-list").empty();
             for (let i = 0; i < result.length; i++) {
                  let likeRecommend = "", dislikeRecommend = "";
                  if(result[i].recommend == 1){
                     likeRecommend = "comActive";
                  }else if(result[i].recommend == -1){
                     dislikeRecommend = "comActive";
                  }
               
               //댓글 리스트
                  if(result[0].pick=="N"){
		                $(".comment-list").append(
		                		
		                "<img src='/myvet/upload"+result[i].filePath+"/"+result[i].sysname+"' onerror=\"this.src=\'\/myvet\/resources\/img\/gall&tip\/myvet.png'\" class='rounded-circle'/>&nbsp;"+result[i].memberNickname
		                 +"<button class='com-like "+likeRecommend+"'data-comno='"+result[i].commenterNo+"'>"
		                 +"<i style='display:none;' class='far fa-thumbs-up'></i>"+"</button><button style='display:none;' class='com-dislike "
		                 +dislikeRecommend+"' data-comno='"
		                 +result[i].commentNo
		                 +"'>"
		                 +"<i style='display:none;' class='far fa-thumbs-down'></i>"+"</button>"
		               +"<i style='display:none;' class='fas fa-heart'></i><span style='display:none;' id='recommendCnt"+result[i].commentNo+"'>"+result[i].recommendCnt+"</span>"
		                +"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"'   data-commenterno='"+result[i].commenterNo+"'></div>"
		                +"<div class='comment-content'>"  +
		                "<button class='answer answerPosition checking"+i+"' value='"+result[i].pick+"'><i >채택</i> </button>" 
		                   +"<input type='hidden' class='commentval' data-commentval='"+result[i].commentNo+"' value='"+result[i].content+"'/>"
		                   +"<div class='comment' data-comment='"+result[i].commentNo+"' height:auto;'>"+result[i].content+"</div>"
		                 +"</div>"
		                 
		                 +"<div class='updateData' style='hidden' data-commentNo="+result[i].commentNo+" data-qnaNo="+result[i].qnaNo+" data-commenterNo="+result[i].commenterNo+"></div>"
		                 +"<button class='deleteCommentBtn recomDefaultHidden"+i+"' value='"+result[i].commenterNo+"' data-deletecombtn='"+result[i].commentNo+"' type='button'>DELETE</button>"
		                 +"<button class='updateCommentBtn recomDefaultHidden"+i+"' value='"+result[i].commenterNo+"' data-updatecombtn='"+result[i].content+"' data-updatecomno='"+result[i].commentNo+"' type='button'>UPDATE</button>"
		                 +"<hr>"
		                );
		                
		                
		                
                  }else{
                	   
		                $(".comment-list").append(
		                		
		                		"<img src='/myvet/upload"+result[i].filePath+"/"+result[i].sysname+"' onerror=\"this.src=\'\/myvet\/resources\/img\/gall&tip\/myvet.png'\" class='rounded-circle'/>&nbsp;"+result[i].memberNickname
		                 +"<button class='com-like "+likeRecommend+"'data-comno='"+result[i].commenterNo+"'>"
		                 +"<i style='display:none;' class='far fa-thumbs-up'></i>"+"</button><button style='display:none;' class='com-dislike "
		                 +dislikeRecommend+"' data-comno='"
		                 +result[i].commentNo
		                 +"'>"
		                 +"<i style='display:none;' class='far fa-thumbs-down'></i>"+"</button>"
		               +"<i style='display:none;' class='fas fa-heart'></i><span style='display:none;' id='recommendCnt"+result[i].commentNo+"'>"+result[i].recommendCnt+"</span>"
		                +"<div class='commentNo' name='commentNo' data-commentno='"+result[i].commentNo+"' data-commenterno='"+result[i].commentorNo+"'></div>"+"<span class='checkedPick"+i+"'></span>"
		                +"<div class='comment-content'>" 
		                   +"<input type='hidden' class='commentval' data-commentval='"+result[i].commentNo+"' value='"+result[i].content+"'/>"
		                   +"<div class='comment' data-comment='"+result[i].commentNo+"' height:auto;'>"+result[i].content+"</div>"
		                 +"</div>"
		                 +"<div class='data' data-commenterNo='"+result[i].commenterNo+"' data-commentNo='"+result[i].commentNo+"'></div>"//$(this).data("deletecombtn")
		                 +"<div class='updateData' style='hidden' data-commentNo="+result[i].commentNo+" data-qnaNo="+result[i].qnaNo+" data-commenterNo="+result[i].commenterNo+"></div>"
		                 +"<button class='deleteCommentBtn recomDefaultHidden"+i+"' value='"+result[i].commenterNo+"' data-deletecombtn='"+result[i].commentNo+"' type='button'>DELETE</button>"
		                 +"<button class='updateCommentBtn recomDefaultHidden"+i+"' value='"+result[i].commenterNo+"' data-updatecombtn='"+result[i].content+"' data-updatecomno='"+result[i].commentNo+"' type='button'>UPDATE</button>"
		                 +"<hr>"
		                );
		                
                  }
                  
                  	/*
                  		접속자 아이이와 댓글 등록 아이디가 같지 않은 경우 댓글 수정,삭제 버튼을 hidden으로 바꿈
                  	*/
	                if("${user.memberNo}" !=  result[i].commenterNo   ){
	            		
	            		$(".recomDefaultHidden"+i).css("visibility","hidden");
	            		
	            		
	            	}
                  	
                  	
             
	                 CommentList =result; 
	                $(".checking"+i).click(function(e){
	                //	alert($(this));
	                	//채택을 위해서 보낼 값: 글번호, 댓글번호, 
	                /* 	alert(${qna.qnaNo});
	                	alert(result[i].commentNo); */
	                	$.ajax({
	                		url:"/myvet/qna/selectAnswer.do",
	                		data:{qnaNo:${qna.qnaNo},commentNo:result[i].commentNo},
	                		type:"post"
	                	}).done(function(result){
	                		//alert("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ")
	                	//	alert(result);
	                		//////console.log(result);
	                		//////console.log("------------------");
	                		 $(".comment-list").empty();
	                		 list();
	                	
	                	}).fail(function(result){//ajax
	                		
	                	})
	                	
	                })
	                
	                
	                
	                
	              
         		}//for
         		

         		
         /*
         	댓글 채택 여부에 따라서 글의 수정 삭제 버튼을 숨기고 
         	해당 채택된 댓글 또한 수정,삭제 불가능
         	채택마커 표시
         */
         console.log(result);
         	if(result[0].pick=="Y"){	
	         	if(result[0].memberGrade == "V"){
	         		$(".defaultHidden").css("visibility","hidden");
	         		$(".checkedPick0").addClass("pickPicture");
	             	$(".checkedPick0").append("<img src='/myvet/resources/img/qna/DoctorMark.jpeg'/>");

            		$(".recomDefaultHidden0").css("visibility","hidden");
            		
	         	}else{
	         		$(".defaultHidden").css("visibility","hidden");
	         		$(".checkedPick0").addClass("pickPicture");
	             	$(".checkedPick0").append("<img src='/myvet/resources/img/qna/adopted.jpg'/>");

            		$(".recomDefaultHidden0").css("visibility","hidden");
            		
	         		
	         	}
         	}	
           }).fail(function(result){
              //////console.log("실패 tipNo"+result)
           })
        
        }
      

        
          $("#like").on("click",function(){
      
         
             var isActive = $(this).hasClass('active');
         
             if(parseInt($("#recommend").attr("value")) == "1"){
            	
            	 $("#recommend").attr("value","0");
            
                insertRecommend(0, $('#qnaNo').val());
                $("#tipRecomCnt").val();
                $(this).toggleClass('active')
             }else if(parseInt($("#recommend").attr("value")) == "0"){
            	 $("#recommend").attr("value","1");
                insertRecommend(1, $('#qnaNo').val());
                $("#tipRecomCnt").val();
                $(this).toggleClass('active')
             }else{
            	
            	 alert('이미 싫어요를 누르셨잖아여');
             }
     
          })
          
          
          let qnaNo = $("#qnaNo").val();
          //  let commenterNo1 = ${user.memberNo};
       function insertRecommend(recommend ){
    	
           var recom=new Array();
           var qnaRecomInfo = new Object();
           
           qnaRecomInfo.qnaNo=parseInt(qnaNo);
           qnaRecomInfo.recommend=parseInt(recommend);
           var memberNo = '${user.memberNo}';
           
           qnaRecomInfo.memberNo=parseInt('${user.memberNo}');
           
           recom.push(qnaRecomInfo);
        
           
           
           recom = JSON.stringify(recom[0]);
            recom = JSON.parse(recom);
  
           $.ajax({
              url:"/myvet/qna/insertRecommend.do",   
              data:{qnaNo : qnaNo, recommend:recommend, memberNo :memberNo},
                
              type:"post"
           }).done(function(result){
              //////console.log("insertRecommend-success")
              console.log(result);
              console.log('${recommend}');
              $("#qnaRecomCnt").empty();
              $("#qnaRecomCnt").html(result); 
              console.log("--------------------");
            
           }).fail(function(result){
        	   
     
           })
        }
        
        $('#dislike').on('click',function(){
           var isActive = $(this).hasClass('active');
           $("#tipRecomCnt").remove();
         //    detail();
//            alert(isActive);
			
           if(parseInt($("#recommend").attr("value")) == -1){
        	   $("#recommend").attr("value","0");
              insertRecommend(0, $('#qnaNo').val());
              $(this).toggleClass('active');
           }else if(parseInt($("#recommend").attr("value"))  == 0){
        	   $("#recommend").attr("value","-1");
              insertRecommend(-1, $('#qnaNo').val());
              $(this).toggleClass('active');
           }else{
        	   alert("이미 좋아요를 누르셨잖아요")
           }
          
        })
        
        
        
          //댓글 추천
          //댓글 좋아요
       $('.comment-list').on('click', '.com-like', function(){
//           alert('com-like!')
         var recomCnt = $('#recommendCnt'+$(this).data('comno'));
             var isActive = $(this).hasClass('comActive');
//              alert(recomCnt);
             if($('.com-dislike').hasClass('comActive')){
                if($(this).data('comno') == $('.com-dislike').data('comno')){                   
                alert('이미 싫어요를 누르셨잖아여')
            return false;
                }
         }
             if(isActive == true){
                recomCnt.text(parseInt(recomCnt.text()) - 1) ;
                insertCommentRecommend(0, $(this).data('comno'));
             }else{
                recomCnt.text(parseInt(recomCnt.text()) + 1) ;
                insertCommentRecommend(1, $(this).data('comno'));
             }
             $(this).toggleClass('comActive')
          
       })
       //댓글 싫어요
          $('.comment-list').on('click', '.com-dislike', function(){
//           alert('com-like!')
         var recomCnt = $('#recommendCnt'+$(this).data('comno'));
             var isActive = $(this).hasClass('comActive');
//              alert(isActive);
         if($('.com-like').hasClass('comActive')){
            if($(this).data('comno') == $('.com-like').data('comno')){               
            alert('이미 좋아요를 누르셨잖아여')
            return false;
            }
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
                //////console.log(recommend, commentNo)
          $.ajax({
             url:"/myvet/qna/insertCommentRecommend.do",
             data:"commentNo="+commentNo+"&recommend="+recommend
          }).done(function(result){
        	// console.log(result);
        	  //detail();
             //////console.log("insertCommentRecommend-success")
          })
       }
    
    	
           
           //댓글 삭제
           $(".comment-list").on("click", ".deleteCommentBtn", function(){
          
              $.ajax({
                 url: "/myvet/qna/deleteComment.do",
    
                data:{commentNo:$(this).data("deletecombtn"),commenterNo:$(".commenterNo").val(),qnaNo:$("#qnaNo").val()},
                dataType:"text",
                type:"post",
                
              })
              .done(function(result){
                 //////console.log("deleteComplete");
                 $(".comment-list").children().remove();
                 list();
              })
              .fail(function(result){
                 //////console.log("deleteFail");
                 //////console.log(result);
              })
           });
        
       //수정 폼
           $(".comment-list").on("click", ".updateCommentBtn",  function(){
          
             
              $(this).prev().prev().replaceWith(
                 "<textarea id='updateCommentForm' placeholder='댓글수정..' cols='100' rows='2'>"+$(this).data('updatecombtn')+"</textarea>"
                 
              )
              $(this).prev().replaceWith(
              "<button class='cancelupdatecom'>취소</button>"      
              )
              $(this).replaceWith(
              "<button class='submitupdatecom'>제출</button>"      
              )
           })
              
             $(".comment-list").on("click", ".cancelupdatecom", function(){
               
                   $(".comment-list").children().remove();
                   list();
              })
            
     
              $(".comment-list").on("click", ".submitupdatecom", function(){
				
		               $.ajax({
		                  url : "/myvet/qna/updateComment.do",              
		                  data : 
		                  		{
			                	  	commentNo:$(this).prev().prev().prev().prev().data("commentno"),
			                        commenterNo:$(this).prev().prev().prev().prev().data("commenterno"),
			                        content:$(this).prev().prev().val()
		                        },
		                  type:"post"    
		            
		                  }).done(function(result){
		                     //////console.log("success");
		                     $(".comment-list").children().remove();
		                     list();
		                  }).fail(function(result){
		                    console.log(result);
		                  })                  
              })
                  
        
      //신고버튼 (게시글)        
      $('.qnaReportBtn').click(function(){
        window.open("/myvet/report/reportQnaForm.do?qnaNo="+location.search.substring(6).substring(1),"report","width=1000, height=600, left=500, top=10")
     })
        

        </script>
</body>
</html>