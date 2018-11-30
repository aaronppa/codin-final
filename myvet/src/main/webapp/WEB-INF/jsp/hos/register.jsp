<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>병원 등록 - MyVet</title>
<link rel="stylesheet" href="<c:url value='/resources/css/hos/register.css'/>"/>
<script src="<c:url value='/resources/js/vendor/jquery.js'/>"></script>
<script src="<c:url value='/resources/js/sweet/sweetalert2.all.js'/>"></script>

<style>
	.wideInput {
		width: 80%
	}
</style>
</head>
<body>
    <div id="body">
	    <form id="form" method="POST" enctype="multipart/form-data">
	    <h1>병원 등록</h1>
	    <table>
	        <tr>
	            <th colspan="2" class="thead">
	                병원 이름 : 
	            </th>
	            <td>
	                <input type="hidden" name="hosCode" id="hos-code">
	                <input type="text" class ="wideInput" id="hos-name" disabled="disabled">
	                <button type="button" id="search-hos">병원 검색</button>
	            </td>
	            <th>
	                추가정보 등록
	            </th>
	        </td>
	    </tr>
	    <tr>
	        <th rowspan="2" class="thead">
	            병원 주소 : 
	        </th>
	        <th>
	            도로명
	        </th>
	        <td>
	            <input class="wideInput" type="text" id="hos-road-address" disabled="disabled">
	        </td>
	        <td id="facilityList" rowspan="8">
	        <c:forEach var="facility" items="${facilityList }">
		        <input type="checkbox" name="hosFacility" id="hos-facility${facility.facilityCode }" value="${facility.facilityCode}">
		        <label for="hos-facility${facility.facilityCode }">${facility.facilityName}</label><br>
			</c:forEach>
	        </td>
	        </tr>
	        <tr>
	        <th>
	            지번
	        </th>
	            <td>
	                <input class="wideInput" type="text" id="hos-address" disabled="disabled">
	            </td>
	        </tr>
	        <tr>
	            <th colspan="2" class="thead">
	                정기 휴무일
	            </th>
	            <td>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-mon" name="dayoff" value="1"><br>
	                    <label for="dayoff-mon">월요일</label>
	                </div>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-tue" name="dayoff" value="2"><br>
	                    <label for="dayoff-tue">화요일</label>
	                </div>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-wed" name="dayoff" value="3"><br>
	                    <label for="dayoff-wed">수요일</label>
	                </div>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-thu" name="dayoff" value="4"><br>
	                    <label for="dayoff-thu">목요일</label>
	                </div>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-fri" name="dayoff" value="5"><br>
	                    <label for="dayoff-fri">금요일</label>
	                </div>
	                <div class="text-center margin-right">
	                    <input class="dayoff" type="checkbox" id="dayoff-sat" name="dayoff" value="6"><br>
	                    <label for="dayoff-sat">토요일</label>
	                </div>
	                <div class="text-center">
	                    <input class="dayoff" type="checkbox" id="dayoff-sun" name="dayoff" value="7"><br>
	                    <label for="dayoff-sun">일요일</label>
	                </div>
	            </td>
	        </tr>
	        <tr>
	            <th colspan="2" class="thead">
	                병원 소개글
	            </th>
	            <td>
	                <textarea name="hosComment" rows="5" cols="75" style="resize: none;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <th colspan="2" class="thead">
	                병원 이미지 등록
	            </th>
	            <td>
	                <input type="file" name="hosImg" id="hos-img" multiple>
	            </td>
	        </tr>
	    </table>
	    </form>
	    <div>
		    <button type="button" id="submit">등록</button>
		    <button type="button" id="debug">검사</button>
	    </div>
    </div>
    <script>
    	var $snsDiv = $(".sns-div").clone()
    	
    	// 병원 검색 버튼 스크립트
    	$("#search-hos").click(function(){
    		window.open("/myvet/hos/hosList.do", "hosList", "width=850, height=1000, location=no")
    	}) 
    	
    	function inputInfo(hosCode, hosTitle, hosAddr1, hosAddr2) {
    		$("#hos-code").val(hosCode);
    		$("#hos-name").val(hosTitle);
    		$("#hos-road-address").val(hosAddr1);
    		$("#hos-address").val(hosAddr2);
    	}
    	
    	// 병원 SNS 추가 - 등록 관련 스크립트
    	$("#add-sns").click(function() {
    		$("#sns-container").append($snsDiv.clone());
	    	$(".del-sns").click(function() {
	    		$(this).parent().remove()
	    	})
    	})

    	$(".del-sns").click(function() {
    		$(this).parent().remove()
    	})
    	
    	// 병원 등록 버튼 스크립트
        $("#submit").click(function() {
   			console.log($("#form").serialize())
            $.ajax({
            	url: "<c:url value='/hos/registerHos.do'/>",
            	processData: false,
                contentType: false,
            	type: 'POST',
            	beforeSend: emptyCheck,
            	data: new FormData($("#form")[0])
            }).done(function(){
            	swal({
					  type: 'success',
					  title: 'OK!',
					  text: '정상적으로 등록되었습니다.'
				})
            })
        })
        
        $("#debug").click(function() {
	        console.dir(new FormData($("#form")[0]));
    	})
        
        function emptyCheck() {
        	console.dir($("#hos-code").val());
			if(!$("#hos-code").val()) {
				swal({
					  type: 'error',
					  title: 'ERROR!!',
					  text: '병원이 선택되지 않았습니다.'
				})
				return false;
			}
			if($("#sns-name").length > 1) {
				for (let i = 0; i < $("#sns-name").length; i++) {
					console.log($("#sns-name")[i].value)
					if($("#sns-name")[i].value) {
						swal({
							  type: 'error',
							  title: 'ERROR!!',
							  text: 'SNS 이름이 않았습니다.'
						})
						return false
					}
				}
			}
        }

    </script>
</body>
</html>