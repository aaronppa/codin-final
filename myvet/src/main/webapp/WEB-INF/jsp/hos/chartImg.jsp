<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 상세보기 - MyVet</title>
	<script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<style>
		#bodyContainer {
			width: 1100px;
			margin: auto
		}
		
		.carousel {
			width: 100%;
			height: 800px;
			overflow: hidden;
		}
		
		.img {
			width: 100%;
			margin: auto
		}
	</style>
</head>
<body>
<div id="bodyContainer">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	  	<c:forEach items="${chartImgs }" varStatus="status1">
		    <li data-target="#carousel-example-generic" data-slide-to="${status1.index }" class="carouselLi"></li>
	    </c:forEach>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	  <c:forEach items="${chartImgs }" var="chartImg" varStatus="status2" >
	    <div class="item">
	      <img class="img" src="/myvet/upload${chartImg.filePath }/${chartImg.sysName}"  >
	    </div>
	  </c:forEach>
	    ...
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div>

<script>
	$(".carouselLi:first").addClass("active");
	$(".item:first").addClass("active");
</script>
</body>
</html>