<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#bodyContainer{
			width: 1100px;
			margin: auto;
			margin-top: 110px;
		}
		
		disable {
			display: none;
		}
	</style>
	
<!--     include libraries(jQuery, bootstrap) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<!-- include summernote css/js-->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />     
	       
	<div id="bodyContainer">
		<form id="form" action="/myvet/hos/insertBoard.do" method="post">
		<input type="hidden" name="hosCode" value="${hospital.hosCode }">
		<input type="hidden" name="hosBoardWriterNo" value="${user.memberNo }">
		분류 : 
		<select id="category" name="hosBoardCategoryCode">
			<c:forEach items="${categoryList }" var="category">
				<option class="category" value="${category.hosBoardCategoryCode }">${category.hosBoardCategoryName }</option>
			</c:forEach>
		</select><br>
		제목 : <input type="text" name="hosBoardTitle"><br>
		내용<br>
		<textarea id="summernote" name="hosBoardContent"></textarea>
		<div id="fileinfoContainer">
			<div id="fileInfo">
				<input type="hidden" name="fileId" class="fileId nullFile" value="0">
			</div>
		</div>
		</form>
		<button type="button" id="submit">제출</button>
	</div>
	
	<script>
	var $fileInfo = $(".fileId").clone().removeClass("nullFile");
	var $category = $(".category").clone().removeClass("disable");
	
	$(".disable").remove();
	
    $('#summernote').summernote({
        width: 1000,
    	height: 500,                 // set editor height
        placeholder: "내용을 입력해주세요",
        focus: true,                  // set focus to editable area after initializing summernote
        callbacks: {
            onImageUpload: function(files, editor, welEditable) {
            for (var i = 0; i < files.length; i++) {
                sendFile(files[i], this);
              }
            }
          } // callbacks
    });
// });

	$("#submit").click(function(){
		$("#form")[0].submit();
	})

	function sendFile(file, ele) {
		var formData = new FormData();
		console.log("formData", formData)
		formData.append('file', file);
		console.log(file)
		console.log(ele)
		$.ajax({
			data : formData, 
			type : "POST",
			url : "/myvet/hos/insertBoardImg.do",
			cache : false,
			contentType : false,
			enctype : "multipart/form-data",
			processData : false,
			//매개변수가 파일경로
			success : function(file) {
				console.dir(file.fileId)
				$newFile = $fileInfo.clone()
				$newFile.val(file.fileId);
				$("#fileInfo").append($newFile);
				$(".nullFile").remove()
				$(ele).summernote("editor.insertImage", '${pageContext.request.contextPath}' + "/upload" + file.filePath + "/" + file.sysName);
			}
		})//ajax
	}
	</script>
</body>
</html>