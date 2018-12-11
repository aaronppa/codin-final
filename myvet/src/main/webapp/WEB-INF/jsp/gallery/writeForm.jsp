<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="/myvet/resources/css/gallery/writeForm.css">
	<!--  -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script></head>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="../dist/css/swiper.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.esm.bundle.js"></script>
  <style>

 

    </style>
</head>
<body>
<form action="<c:url value='/gallery/write.do'/>" method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="row">
            <div class="col-sm-7" >
                <div class="swiper-container gallery-top">
                     <div class="swiper-wrapper">
                     <div class="swiper-slide"><img class = "top-img" src=""></div>
                     </div>
                     <div class="swiper-button-next swiper-button-white"></div>
                     <div class="swiper-button-prev swiper-button-white"></div>
                 </div>
                 <div class="swiper-container gallery-thumbs">
                     <div class="swiper-wrapper">
                           <div class="swiper-slide"><img class = "thumbs-img" src=""></div>
                     </div>
                 </div>
<!-- 		<div id="imgprev"> -->
<!-- 			<img type="hidden"id="prev" src=''/> -->
<!-- 		</div> -->
                    <!--file-->
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text" id="inputGroupFileAddon01"><i class="fas fa-camera-retro"></i></span>
                        </div>
                        <div class="custom-file">
                          <input  type="file" name="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
                          <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                        </div>
                    </div>
                    <div class="pet-add">
                        <i class="fas fa-plus" ></i>
                        <span data-toggle="tooltip" title="PONY">
                          <img src="/myvet/resources/img/gall&tip/pony01.jpg" class="petImg rounded-circle">
                        </span>
                    </div>

            </div>
            <div class="col-sm-5" > 
                <div class="detail-content" >
                    <br>
                    <img src="/myvet/resources/img/gall&tip/pic2.jpg" class="rounded-circle" id="writer-img">
                    <input type="hidden" name="writerNo" value="12">
                    <input type="hidden" name="boardCode" value="2">
                    <span class="writerNick">복순이</span>
                    <hr>
                    <br>
                    <!--제목-->
                    <textarea cols="50" rows="1" name="title" placeholder="제목을 입력..."></textarea>
                    <br>
                    <br>
                    <!--내용-->
                    <textarea cols="50" rows="5" name="content" placeholder="내용을 입력..."></textarea>
                </div>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <a href="<c:url value='/gallery/list.do'/>">
                    <button type="button" class="btn btn-secondary">목록</button>
                  </a>
                    <input type="submit" class="btn btn-secondary">
                </div>
            </div>
        </div>
    </div>
</form>

  <!-- Swiper JS -->
  <script src="../dist/js/swiper.min.js"></script>

    <script>
    //슬라이드 사진첨부
    var file = document.querySelector('#inputGroupFile01');
    
    file.onchange = function(){
    	var fileList = file.files;
    	
    	var reader = new FileReader();
    	reader.readAsDataURL(fileList[0])
    	
	    reader.onload = function  () {
    		document.querySelector('.thumbs-img').src = reader.result ;
// 	        $("#prev").css("width","400px");
// 	    	$("#prev").css("height","300px");
	    }; 
// 	    reader.onload = function  () {
// 	        document.querySelector('.top-img').src = reader.result ;
// // 	        $("#preview1").css("width","400px");
// // 	    	$("#preview1").css("height","300px");
// 	    }; 
    }
    //파일첨부
    
     function sendFile(file, ele) {
    	var formData = new FormData();
    	console.log("formData", formData)
    	formData.append('file', file);
    	console.log(file)
    	console.log(ele)
    	$.ajax({
    		data : formData, 
    		type : "POST",
    		url : "/myvet/gallery/uploadFile.do",
    		cache : false,
    		contentType : false,
    		enctype : "multipart/form-data",
    		processData : false,
    		//매개변수가 파일경로
    		success : function(file) {
    			console.log($(ele))
    			console.log("upload-success");
    		}
    	}
    }
    
    
    //슬라이드 사진첨부 끝
    
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
    //tooltip
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()

})


    </script>
</body>
</html>