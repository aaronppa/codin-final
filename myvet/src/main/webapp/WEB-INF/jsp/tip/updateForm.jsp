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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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

    <form action="<c:url value='/tip/update.do' />" method="post">
    <br>
    <input name="tipNo" value="${tip.tipNo }" type="hidden">
    <input name="boardCode" type="hidden" value="10">
<!--     <input name="categoryCode" type="hidden" value="1"> -->
    <input name="memberNo" type="hidden" value="33">
    
<!--     <div id="titleForm" style="text-align:center;"> -->
<!-- 	    <input name="title" type="text" style="width:500px;"> -->
<!--     </div> -->
	<br>
    <div class="information">
        <img id="writer-img" src="/myvet/images/pony01.jpg" class="rounded-circle">
        <span>PONY</span>
        <div class="recommend">
        </div>
    </div>
    <!-- 제목 -->
	<div class="input-group mb-3" style="margin-left: 41%;">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="inputGroup-sizing-default">Title</span>
	  </div>
	  <input name="title" type="text" style="width:300px"class="form-control" aria-label="Sizing example input" value="${tip.title }" aria-describedby="inputGroup-sizing-default">
		<select name="categoryCode">
			<option selected>Category</option>
			<option value="1">건강</option>
			<option value="2">생활</option>
			<option value="3">용품</option>
		</select>
	</div>
	<!-- 카테고리 -->
	
    <hr>
        <div style="margin-left:26%;">
          <textarea name="content" id="summernote">${tip.content }</textarea>
        </div>
    <div style="text-align: center;">
		<input class="btn btn-primary" type="submit" value="Update">
		<a href="<c:url value='/tip/list.do'/>">
			<button type="button" class="btn btn-outline-primary">List</button>			
		</a>
		
    </div>    

    </form>
	<script>
    
$(document).ready(function() {
     $('#summernote').summernote({
            
             width: 800,
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
});
</script>
</body>
</html>