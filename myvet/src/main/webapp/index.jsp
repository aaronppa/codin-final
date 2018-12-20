<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
<script src="<c:url value='/resources/js/vendor/foundation.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/css/swiper.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/css/swiper.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/js/swiper.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.5/js/swiper.min.js"></script>

<title>MyVet :: 괜찮🐈-건강하🐕</title>
    <style>
    	html {
    		height:100%
    	}
    
       	#background {
       		width: 100%;
       		height: 100%;
       		position: absolute;
       		top:0;
       		left:0;
       		opacity: 0.5;
    		background-image: url('/myvet/resources/img/common/background.jpg');
    		z-index: -1
    	}
    
        .relative {
            /* border: 1px solid black; */
/*             position: relative; */
        }    
        
        #mapArea {
        	width: 500px;
        	height: 500px;
        }
        
        #bodyContainer {
			margin: auto;
            width: 1100px;
            height: 100%;
            text-align: center;
            padding: 5px;
			padding-top: 80px;
        }
        
        #noticeContainer {
            padding-left: 10px;
            text-align: left;
        }
        
        #leftContainer {
/*             position: absolute; */
/*             top: 0px; */
/*             left: 0px; */
            display: inline-block;
            width: 74%;
            height: 800px;
            overflow: hidden;
            
        }
        
        #rightContainer {
/*             position: absolute; */
/*             top :0px; */
/*             left: 930px; */
            /* position: relative; */
            display: inline-block;
            width: 24%;
            height: 800px;
            overflow: hidden;
        }
        
        #hospitalContainer {
            height:300px
        }
        
        #petContainer {
             height:300px 
        }
        
        #newsContainer {
            height:200px 
        }
        
        #favHosDiv, #myPet {
        	padding-bottom: 30px;
        }
        
        .petImgDiv {
        	display:inline-block;
        	position: relative;
        }
        
        .petImg {
        	width: 100px;
        	height: 100px;
        }
        
        .notice{
        	height: 30px;
        	overflow: hidden;
        }
        
      	#MapSearchlist{
    		background: rgba(255,255,255,0.5);
    	}
    	
    	.favHosSwip,
    	.petSwiper {
    		height: 300px;
    	}
    	
    	.empty {
    		margin: auto;
    		margin-top: 110px;
    		width: 180px;
    		padding: 10px;
    		border: 1px solid black;
    		background: rgba(245, 233, 195, 0.5);
    	}
    	
    	#noticeContainer {
    		margin: 15px 0px;
    		border: 1px solid black;
    		background: rgba(255, 255, 255, 0.5);
    	}
    	
    	a {
    		color: black !important;
    	}
    	
    </style>
	<link rel="stylesheet" href="<c:url value='/resources/css/common/topbar.css'/>"/>
</head>          
<body id="indexBody">

	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="background"></div>
	<div id="bodyContainer">
   	<c:choose>
	   	<c:when test="${not empty user }">
	   		<input type="hidden" id="memberNo" value="${user.memberNo }">
	   	</c:when>
   		<c:otherwise>
	   		<input type="hidden" id="memberNo" value="0">
   		</c:otherwise>
   	</c:choose>
   	
        <div class="relative" id="leftContainer">
            <div class="relative" id="noticeContainer">
            	<div class="swiper-container notice">
				    <div id="noticeDiv" class="swiper-wrapper">
						<div class="swiper-slide noticeRow"><a class="noticeInfo" href="#"></a></div>
				    </div>
				</div>
            </div>
            <div class="relative" id="mapContainer">
                <div class="relative" id="mapArea"><span>지도영역</span></div>
            </div>
        </div>
        <div class="relative" id="rightContainer">
        	<c:if test="${not empty user }">
            <div class="relative" id="hospitalContainer">
            	<div class="swiper-container favHosSwip">
				    <div id="favHosDiv" class="swiper-wrapper">
			          <div class="swiper-slide favHos">
			          	<div class="hosImgDiv">
			          		<img class="hosImg" src="...">
			          	</div>
			          	<div class="hosInfo">
			          		<a class="hosA" href="#"><span class="hosName"></span></a><br>
			          		<span class="telephone"></span>
			          	</div>
			          </div>
				    </div>
				     <!-- Add Pagination -->
				    <div class="swiper-pagination"></div>
				    <!-- Add Arrows -->
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
	    		</div>
            </div>
            </c:if>
           	<c:if test="${not empty user }">
            <div class="relative" id="petContainer">
            	<div class="swiper-container petSwiper">
				    <div id="myPet" class="swiper-wrapper">
			          <div class="swiper-slide pets">
			          	<div class="petImgDiv">
			          		<img class="petImg" src="...">
			          	</div>
			          	<div class="petInfo">
			          		<a class="petA" href="/myvet/pet/petDetail.do?petNo=11"><span class="petName"></span></a>
			          	</div>
			          </div>
				    </div>
				     <!-- Add Pagination -->
				    <div class="swiper-pagination"></div>
				    <!-- Add Arrows -->
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
	    		</div>
            </div>
            </c:if>
            <div class="relative" id="newsContainer">
            	<h4>개꿀팁이냥 인기글</h4>
            	<div id="tipDiv">
            		<a href="#" class="tipRow"></a>
            	</div>
            </div>
        </div>
    </div>
</body>

<script>
	var $favHos = $(".favHos").clone();
	var $myPet = $(".pets").clone();
	var $noticeRow = $(".noticeRow").clone();
	var $tipRow = $(".tipRow").clone();
	$(".favHos").remove();
	$(".pets").remove();
	$(".noticeRow").remove();
	$(".tipRow").remove();
	
	if($("#memberNo").val() != 0) {
		$.ajax({
			url: "/myvet/hos/indexFavHos.do",
			data: {memberNo: $("#memberNo").val()}
		}).done(function(result) {
			console.dir(result);
			var favHos = result.favHos;
			var pets = result.myPet
			
			console.dir(pets);
			
			if (favHos.length == 0) {
				var $newFavHos = $favHos.clone();
				$newFavHos.html("<div class='empty'>즐겨찾는 병원이<br>없습니다.</div>")
				$("#favHosDiv").append($newFavHos);
				
			} else {
			
				for (let i = 0; i < favHos.length; i++) {
					var $newFavHos = $favHos.clone();
					$newFavHos.find(".hosImg").attr("src", "...");
					$newFavHos.find(".hosA").attr("href", "/myvet/hos/hospital.do?hosCode="+favHos[i].hosCode);
					$newFavHos.find(".hosName").html(favHos[i].hospital.title);
					$newFavHos.find(".telephone").html(favHos[i].hospital.telephone);
					$("#favHosDiv").append($newFavHos);
				}
			}

			swiper(".favHosSwip");
			
			if (pets.length == 0) {
				var $pets = $myPet.clone();
				$pets.html("<div class='empty'>등록된 반려동물이<br>없습니다.</div>")
				$("#myPet").append($pets);
				
			} else {
			
				for (let i = 0; i < pets.length; i++) {
					var $newPet = $myPet.clone();
					$newPet.find(".petImg").attr("src", "/myvet/upload"+pets[i].petFilePath+"/"+pets[i].petSysName);
					$newPet.find(".petA").attr("href", "/myvet/pet/petDetail.do?petNo="+pets[i].petNo);
					$newPet.find(".petName").html(pets[i].petName);
					$("#myPet").append($newPet);
				}
			}
			swiper(".petSwiper")
		})
		
	}
	
	$.ajax({
		url: "/myvet/notice/indexNotice.do"
	}).done(function(noticeList) {
		console.dir(noticeList);
		
		if(noticeList.length == 0) {
			$newNotice = $noticeRow.clone();
			$newNotice.html("등록된 공지사항이 없습니다.")
			$("#noticeDiv").append($newNotice);
		}
		for (let i = 0; i < noticeList.length; i++) {
			$newNotice = $noticeRow.clone();
			$newNotice.find(".noticeInfo").attr("href", "/myvet/notice/detail.do?noticeNo="+noticeList[i].noticeNo);
			$newNotice.find(".noticeInfo").html("[공지] " + noticeList[i].noticeTitle + "</div>");
			$("#noticeDiv").append($newNotice);
		}
		notice();
	})
	
	$.ajax({
		url: "/myvet/hos/indexTip.do"
	}).done(function(tipList) {
		console.dir(tipList);
		
		if(tipList.length == 0) {
			$newTip = $tipRow.clone();
			$newTip.html("등록된 게시글이 없습니다.")
			$("#tipDiv").append($newTip);
		}
		for (let i = 0; i < tipList.length; i++) {
			$newTip = $tipRow.clone();
			$newTip.attr("href", "/myvet/tip/detail.do?tipNo="+tipList[i].tipNo);
			$newTip.text(tipList[i].title);
			$("#tipDiv").append($newTip);
			$("#tipDiv").append($("<br>"));
		}

	})
	
	function swiper(swiper) {
		var swiper = new Swiper(swiper, {
			slidesPerView: 1,
			spaceBetween: 30,
			loop: true,
			autoplay: {
		        delay: 5000,
		        disableOnInteraction: false,
		    },
		    navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		    },
		    pagination: {
	          el: '.swiper-pagination',
	          dynamicBullets: true,
	        },
	})
	}
	
	function notice() {
		var swiper = new Swiper('.notice', {
			slidesPerView: 1,
			spaceBetween: 30,
			loop: true,
			direction: 'vertical',
			autoplay: {
		        delay: 5000,
		        disableOnInteraction: false,
		    }
	})
	}
	
	$("#mapArea").load("/myvet/map/map.do")
	
</script>

</html>