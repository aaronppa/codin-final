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
</head>
<body>
    <div id="body">
    <h1>병원 등록</h1>
    <table>
        <tr>
            <th colspan="2" class="thead">
                병원 이름 : 
            </th>
            <td>
                <input type="text" name="hos-name" id="hos-name">
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
            <input type="text" name="hos-road-address" id="hos-road-address">
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
                <input type="text" name="hos-road-address" id="hos-road-address">
            </td>
        </tr>
        <tr>
            <th colspan="2" class="thead">
                정기 휴무일
            </th>
            <td>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-mon" name="dayoff" value="mon"><br>
                    <label for="dayoff-mon">월요일</label>
                </div>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-tue" name="dayoff" value="tue"><br>
                    <label for="dayoff-tue">화요일</label>
                </div>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-wed" name="dayoff" value="wed"><br>
                    <label for="dayoff-wed">수요일</label>
                </div>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-thu" name="dayoff" value="thu"><br>
                    <label for="dayoff-thu">목요일</label>
                </div>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-fri" name="dayoff" value="fri"><br>
                    <label for="dayoff-fri">금요일</label>
                </div>
                <div class="text-center margin-right">
                    <input type="checkbox" id="dayoff-sat" name="dayoff" value="sat"><br>
                    <label for="dayoff-sat">토요일</label>
                </div>
                <div class="text-center">
                    <input type="checkbox" id="dayoff-sun" name="dayoff" value="sun"><br>
                    <label for="dayoff-sun">일요일</label>
                </div>
            </td>
        </tr>
        <tr>
            <th colspan="2" class="thead">
                병원 SNS
                <button type="button" id="add-sns">추가</button>
            </th>
            <td id="sns-td" class="middle">
            	<div id="sns-container">
	                <div class="sns-div">
	                    <select name="hos-sns" id="hos-sns">
	                        <option>선택</option>
	                        <option value="facebook">페이스북</option>
	                        <option value="instargram">인스타그램</option>
	                        <option value="kakao">카카오톡</option>
	                        <option value="blog">블로그</option>
	                    </select>
		                <input type="text" name="snsName" id="sns-name" placeholder="SNS 계정 이름">
		                <input type="text" name="snsAddress" id="sns-address" placeholder="SNS 주소">
		                <button type="button" class="del-sns">삭제</button>
	                </div>
                </div>
            </td>
        </tr>
        <tr>
            <th colspan="2" class="thead">
                병원 홈페이지
            </th>
            <td>
                <input type="text" name="hosHomePage" id="hos-home-page">
            </td>
        </tr>
        <tr>
            <th colspan="2" class="thead">
                병원 소개글
            </th>
            <td>
                <textarea name="hos-content" rows="5" cols="70"></textarea>
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
    </div>
    <script>
    	var $snsDiv = $(".sns-div").clone()
    	
    	$("#add-sns").click(function() {
    		$("#sns-container").append($snsDiv.clone());
	    	$(".del-sns").click(function() {
	    		$(this).parent().remove()
	    	})
    	})

    	$(".del-sns").click(function() {
    		$(this).parent().remove()
    	})

    </script>
</body>
</html>