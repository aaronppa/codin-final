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
<!--     include libraries(jQuery, bootstrap) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- include summernote css/js-->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
        <style>
        html,body{
        	width:80%;
        	margin-left: auto;
        	margin-right: auto;
        	background-color: none;
        }
        
        /*글제목*/
        .title{
            font:bolder;
            font-size: 60px;
            text-align: center;
        }
        /*글쓴이 사진*/
        #writer-img{
            width: 60px;
            height: 60px;
        }
        /*글 작성자 id*/
        .writer-id{
            font-weight: bold;
        }
        /*글 정보*/
        .information{
            text-align: center; 
        }
        .write-btn-form{
            text-align: center; 
        }


       
    </style>
</head>
<body>
<%--    	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />             --%>

    <form action="<c:url value='/tip/write.do' />" method="post">
    <br>
    <input name="boardCode" type="hidden" value="11">
<!--     <input name="categoryCode" type="hidden" value="1"> -->
    <input name="memberNo" class="memberNo" type="hidden" value="33">
    
<!--     <div id="titleForm" style="text-align:center;"> -->
<!-- 	    <input name="title" type="text" style="width:500px;"> -->
<!--     </div> -->
	<br>
    <div class="information">
        <img id="writer-img" src="/myvet/images/pony01.jpg" class="rounded-circle">
        <span>PONY</span>
    </div>
    <br>
    <!-- 제목 -->
	<div class="input-group mb-3" style="width:60%;margin-left: 23%;">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="inputGroup-sizing-default">Title</span>
	  </div>
	  <input name="title" id="title" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
		<select name="categoryCode" class="categoryCode">
			<option selected value="">Category</option>
			<option value="1">건강</option>
			<option value="2">생활</option>
			<option value="3">용품</option>
			<option value="4">기타</option>
		</select>
	</div>
	<!-- 카테고리 -->
	
    <hr>
        <div style="margin-left: 8%;">
          <textarea name="content" class="content" id="summernote" value="" cols="100" rows="15">
          </textarea>
        </div>
        <div id="hidden-file">
<!--         	<input id="url" name="url" type="hidden"> -->
<!--         	<input id="oriName" name="oriName" type="hidden"> -->
<!--         	<input id="sysName" name="sysName" type="hidden"> -->
<!--         	<input id="filePath" name="filePath" type="hidden"> -->
<!--         	<input id="fileSize" name="fileSize" type="hidden"> -->
        </div>
        <br>
    <div style="text-align: center;margin-left: 5%;">
		<input class="btn btn-primary" id="writeSubmit" type="submit" value="Submit">
		<a href="<c:url value='/tip/list.do'/>">
			<button type="button" class="btn btn-outline-primary">List</button>			
		</a>
    </div>    
    </form>
	<script>
	

// 	$("#summernote").summernote({
// 		toolbar: [
// 		    // [groupName, [list of button]]
// 		    ['style', ['bold', 'italic', 'underline', 'clear']],
// 		    ['font', ['strikethrough', 'superscript', 'subscript']],
// 		    ['fontsize', ['fontsize']],
// 		    ['color', ['color']],
// 		    ['para', ['ul', 'ol', 'paragraph']],
// 		    ['height', ['height']]
// 		  ],
// 		height:500,
// 		minHeight: null,
// 		maxHeight: null,
// 		focus: true,
// 		lang: 'ko-KR',
// 		disableResize: true,            // Does not work
// 		disableResizeEditor: true,      // Does not work either
//       resize: false 
// 	});
//     $(document).ready(function () {
        $('#summernote').summernote({
            width: 1000,
        	height: 500,                 // set editor height
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
//     });
    
    function sendFile(file, ele) {
    	var formData = new FormData();
    	console.log("formData", formData)
    	formData.append('file', file);
    	console.log(file)
    	console.log(ele)
    	$.ajax({
    		data : formData, 
    		type : "POST",
    		url : "/myvet/tip/uploadFile.do",
    		cache : false,
    		contentType : false,
    		enctype : "multipart/form-data",
    		processData : false,
    		//매개변수가 파일경로
    		success : function(file) {
    			console.log($(ele))
    			console.log("upload-success");
    			console.log("file.url : "+ '${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName)
    			$("input#url").val('${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName)
    			$("input#oriName").val(file.oriName)
    			$("input#sysName").val(file.sysName)
    			$("input#filePath").val(file.filePath)
    			$("input#fileSize").val(file.fileSize)
    			$(ele).summernote("editor.insertImage", '${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName);
    		
    		
    		}
    	})//ajax
    }

	



$("#writeSubmit").click(function(){
	
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