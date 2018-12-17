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
  	.container{
			width:1100px;
			position:relative;
			top:80px;
		}
/*********************************
   CUSTOM INPUT FILES FOR IMAGES
 *********************************/
/*** GENERAL STYLES ***/
* {
  box-sizing: border-box;
}

#page {
  text-align: center;
}
#page h1 {
  margin-bottom: 4rem;
  font-family: 'Lemonada', cursive;
  text-transform: uppercase;
  font-weight: normal;
  color: #fff;
  font-size: 2rem;
}

/*** CUSTOM FILE INPUT STYE ***/
.wrap-custom-file {
  position: relative;
  display: inline-block;
  width: 150px;
  height: 150px;
  margin: 0 0.5rem 1rem;
  text-align: center;
}
.wrap-custom-file input[type="file"] {
  position: absolute;
  top: 0;
  left: 0;
  width: 2px;
  height: 2px;
  overflow: hidden;
  opacity: 0;
}
.wrap-custom-file label {
  z-index: 1;
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  overflow: hidden;
  padding: 0 0.5rem;
  cursor: pointer;
  background-color: #fff;
  border-radius: 4px;
  transition: -webkit-transform 0.4s;
  transition: transform 0.4s;
  transition: transform 0.4s, -webkit-transform 0.4s;
}
.wrap-custom-file label span {
  display: block;
  margin-top: 2rem;
  font-size: 1.4rem;
  color: #777;
  transition: color 0.4s;
}
.wrap-custom-file label .fa {
  position: absolute;
  bottom: 1rem;
  left: 50%;
  -webkit-transform: translatex(-50%);
  transform: translatex(-50%);
  font-size: 1.5rem;
  color: lightcoral;
  transition: color 0.4s;
}
.wrap-custom-file label:hover {
  -webkit-transform: translateY(-1rem);
  transform: translateY(-1rem);
}
.wrap-custom-file label:hover span, .wrap-custom-file label:hover .fa {
  color: #333;
}
.wrap-custom-file label.file-ok {
  background-size: cover;
  background-position: center;
}
.wrap-custom-file label.file-ok span {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 0.3rem;
  font-size: 1.1rem;
  color: #000;
  background-color: rgba(255, 255, 255, 0.7);
}
.wrap-custom-file label.file-ok .fa {
  display: none;
}

 

    </style>
</head>
<body>
   	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
<br>
<form action="<c:url value='/gallery/write.do'/>" method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="row">
            <div class="col" >
                <!---------------------------------
  CUSTOM FILE INPUTS FOR IMAGES
 ---------------------------------->
		
		  <!-- Our File Inputs -->
           <img src="/myvet/resources/img/gall&tip/pic2.jpg" class="rounded-circle" id="writer-img">
           <input type="hidden" name="writerNo" value="${user.memberNo}">
           <input type="hidden" name="boardCode" value="10">
           <span class="writerNick">${user.memberNickname}</span>
           <hr>
		  <div class="wrap-custom-file">
		    <input type="file" name="file" id="image1" accept=".gif, .jpg, .png" />
		    <label  for="image1">
		      <span>One</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
		  
		  <div class="wrap-custom-file">
		    <input type="file" name="file" id="image2" accept=".gif, .jpg, .png" />
		    <label  for="image2">
		      <span>Two</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
		  
		  <div class="wrap-custom-file">
		    <input type="file" name="file" id="image3" accept=".gif, .jpg, .png" />
		    <label  for="image3">
		      <span>Three</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
		  
		   <div class="wrap-custom-file">
		    <input type="file" name="file" id="image4" accept=".gif, .jpg, .png" />
		    <label  for="image4">
		      <span>Four</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
		   <div class="wrap-custom-file">
		    <input type="file" name="file" id="image5" accept=".gif, .jpg, .png" />
		    <label  for="image5">
		      <span>Five</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
		   <div class="wrap-custom-file">
		    <input type="file" name="file" id="image6" accept=".gif, .jpg, .png" />
		    <label  for="image6">
		      <span>Six</span>
		      <i class="fa fa-plus-circle"></i>
		    </label>
		  </div>
          <div class="pet-add">
              <i class="fas fa-plus" ></i>
              <span data-toggle="tooltip" title="PONY">
                <img src="/myvet/resources/img/gall&tip/pony01.jpg" class="petImg rounded-circle">
              </span>
          </div>
		</div>
		</div>
            <div class="col" > 
                <div class="detail-content" >
                    <br>
                    <!--제목-->
                    <textarea cols="150" rows="1" name="title" placeholder="제목을 입력..."></textarea>
                    <br>
                    <br>
                    <!--내용-->
                    <textarea cols="150" rows="5" name="content" placeholder="내용을 입력..."></textarea>
                </div>
                <div class="btn-group" role="group" aria-label="Basic example">
                  <a href="<c:url value='/gallery/list.do'/>">
                    <button type="button" class="btn btn-secondary">목록</button>
                  </a>
                    <input type="submit" class="btn btn-secondary">
                </div>
            </div>
        </div>
</form>


    <script>
    //
    /**
 * CUSTOM FILE INPUTS FOR IMAGES
 *
 * Version: 1.0.0
 *
 * Custom file inputs with image preview and 
 * image file name on selection.
 */
$('input[type="file"]').each(function(){
  // Refs
  var $file = $(this),
      $label = $file.next('label'),
      $labelText = $label.find('span'),
      labelDefault = $labelText.text();
  
  // When a new file is selected
  $file.on('change', function(event){
    var fileName = $file.val().split( '\\' ).pop(),
        tmppath = URL.createObjectURL(event.target.files[0]);
    //Check successfully selection
		if( fileName ){
      $label
        .addClass('file-ok')
        .css('background-image', 'url(' + tmppath + ')');
			$labelText.text(fileName);
    }else{
      $label.removeClass('file-ok');
			$labelText.text(labelDefault);
    }
  });
  
// End loop of file input elements  
});

    //tooltip
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()

})


    </script>
</body>
</html>