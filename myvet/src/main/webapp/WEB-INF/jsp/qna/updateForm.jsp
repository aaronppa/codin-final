<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!--     include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <style>
 
        /*글제목*/
     /*    .title{
            font:bolder;
            font-size: 60px;
            text-align: center;
        } */
        /*글쓴이 사진*/
 /*        #writer-img{
            width: 60px;
            height: 60px; */
        }
        /*글 작성자 id*/
   /*      .writer-id{
            font-weight: bold; */
        }
        /*글 정보*/
    /*     .information{
            text-align: center;
        }
        .write-btn-form{
            text-align: center;
        }
 */
 	.Updatecontainer{
			width:1100px;			
/* 			top:120px; */
			margin-top: 40px;
			position:absolute;
		
	
		}
       .picture{
       	height:60px;
       	width:60px;
       
       }
       .information{
       	text-align:center;
       }
        .innerDiv{
	       	width:1100px; 
	       	/* margin-left: 23%; */
	   
       } 
       .form{
       	margin-top:40px;
       	width:80%;
       	margin-left:150px;
       }
    </style>
</head>
<body>
<%--    	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />             --%>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	<div class="Updatecontainer">
	    <form class="form" action="<c:url value='/qna/update.do' />" method="post">
	    <br>
	    <input name=qnaNo value="${qna.qnaNo }" id="qnaNo" type="hidden">
	    <input name="boardCode" id="writerNo" type="hidden" value="10">
	<!--     <input name="categoryCode" type="hidden" value="1"> -->
	    <input name="memberNo" type="hidden" value="33">
	    
	<!--     <div id="titleForm" style="text-align:center;"> -->
	<!-- 	    <input name="title" type="text" style="width:500px;"> -->
	<!--     </div> -->
		<br>
	    <div class="information">
	        <img id="writer-img" src="/myvet/images/pony01.jpg" onerror="this.src='/myvet/resources/img/gall&tip/myvet.png'"  class="picture rounded-circle">
	        <span>${user.memberNickname}</span>
	    </div>
	    <!-- 제목 -->
	    <br>
		<div class="input-group mb-3 innerDiv" style="width:60%;margin-left: 23%;">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">Title</span>
		  </div>
		  <input name="writerNo" type="hidden" value="${qna.writerNo }"/>
		  <input name="title" id="title" type="text" class="form-control" aria-label="Sizing example input" value="${qna.title}" aria-describedby="inputGroup-sizing-default">
			<select name="categoryCode" class="categoryCode">
				
					<option selected value="" >Category</option>
					
				<c:forEach var="c" items="${category}" varStatus="loop">
					 
					<option value="${c.categoryCode }">${c.categoryName }</option>
					
				</c:forEach>
				
			</select>
			
		</div>
		<!-- 카테고리 -->
		
	    <hr>
	        <div style="margin-left:8%;">
	          <textarea name="content" id="summernote">${qna.content }</textarea>
	          <input id="fileId" name="fileId" style="visibility:hidden;" value="${fileId}">
	        </div>
	        <br>
	    <div style="text-align: center;margin-left: 5%;">
			<input class="btn btn-primary" id="updateSubmit" type="submit" value="Update">
			<a href="<c:url value='/qna/list.do'/>">
				<button type="button" class="btn btn-outline-primary">List</button>			
			</a>
			
	    </div>    
		<br>
		<br>
	    </form>
    </div>
	<script>
    
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 330,                 // set editor height
            placeholder: "내용을 입력해주세요",
            focus: true,                  // set focus to editable area after initializing summernote
            callbacks: {
                onImageUpload: function(files, editor, welEditable) {
                  for (var i = files.length - 1; i >= 0; i--) {
                    sendFile(files[i], this);
                  }
                }
              } // callbacks
        });
    });
    
    function sendFile(file, ele) {
    	var formData = new FormData();
    	console.log("----------------------")
    	console.log(file);
    	console.log($("#qnaNo").attr("value"));
    	console.log($("#fileId").attr("value"));
    	console.log("-----------------------")
    	//console.log("formData", formData)
    		formData.append('file', file);
    	if($("#fileId").attr("value").length != 0 ){
    		console.log("여기옴");
    		formData.append('fileId', $("#fileId").attr("value"));	
    		
    	}else{
    		console.log("else");
    		formData.append('fileId', 0);	
    		
    	}
    	
    	formData.append("qnaNo",$("#qnaNo").attr("value"));
   
  
    	console.log(file)
    	console.log(ele)
    	$.ajax({
    		data : formData, 
    		type : "POST",
    		url : "/myvet/qna/updateFileinfo.do",
    		cache : false,
    		contentType : false,
    		enctype : "multipart/form-data",
    		processData : false,
    		//매개변수가 파일경로
    		success : function(file) {
    			console.log(file);
    			console.log("----------------");
    			console.log($(ele))
    			console.log("----------------");
    			console.log("upload-success");
    			console.log("file.url : "+ '${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName)
    			
    			$("input#url").val('${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName)
    			$("input#oriName").val(file.name)
    			$("input#sysName").val(file.name)
    			$("input#filePath").val(file.filePath)
    			$("input#fileSize").val(file.fileSize)
    			$(ele).summernote("editor.insertImage", '${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName);
    	
    		
    		},
    		error:function(e){
    			console.log("실패");
    		}
    	})//ajax
    }


$("#updateSubmit").click(function(){
	console.log("updateSubmit!")
	if($("#title").val() == ""){
		event.preventDefault();
		alert("제목을 입력해 주세요")
		
	}else if( $(".categoryCode").val() == ""){
		console.log($(".categoryCode").val());
		console.log("카테고리없음");
		event.preventDefault();
		alert("카테고리를 입력해 주세용");
	}else if($("#summernote").val() == ""){
		console.log($("#summernote").val());
		event.preventDefault();
		alert("내용을 입력해주세요")
	}
});
</script>
</body>
</html>