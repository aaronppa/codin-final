<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반려동물 추가 페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  
<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<style>
    table, tr, td{
        border-collapse: collapse;
    }

    .basics {
        width: 80%;
        margin-right : auto;
        margin-left : auto;

    }

    .form-control {
        width: 150px;
    }

    .career {
        width: 80%;
        margin-right : auto;
        margin-left : auto;
        
    }

    #tools {
        margin-left: 50px;
    }

    .imgTd {
        width: 170px;
    }
    th{
        font-size:large;
        width: 200px;
        height: 40px;
        padding-left: 20px;
    }
    td {
        padding-left: 20px;
        width: 250px;
    }
    
    a {
    	text-decoration: none !important;
    	color: white;
    }
    
    .update-delete {
    	text-align: right;
    	margin-top: 50px;
    }
    
    .career {
    	text-align: right;
    }
    
    #container {
    	margin-top: 50px;
    	margin-left: 50px;
    	margin-right: 50px;
    	margin-bottom: 50px;
    	font-size: 18px;
    }
    
    #top-menu {
    	height: 50px;
    }
</style>
</head>
<body>
	
	<div id="top-menu">
		<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	</div>
	
	<form id="petForm" action="petAdd.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberNo" value="${user.memberNo}" />
		<div id="container">
			<h2><input type="text" name="petName" placeholder="아이 이름을 적어주세요." /></h2>
		    <hr>
		    <div>
		        <table class="info basics">
		            <tr>
		                <td rowspan="4" class="imgTd">
		                    <input type="file" name="fileP" style="width:150px; height:150px" />
		                </td>
		                <th>등록번호</th>
		                <td colspan="3"><input type="text" name="petRegNo" id="petRegNo" /></td>
					</tr>
					<tr>
						<th>멍냥</th>
		                <td>
		                	<select name="species">
								<option value="dog">강아지</option>
								<option value="cat">고양이</option>
							</select>
		                </td>
						<th>
							품종
						</th>
						<td>
							<input type="text" name="breed" />
						</td>
					</tr>
		            <tr>
		                <th>사이즈</th>
		                <td>
		                	<select name="size">
								<option value="s">소형</option>
								<option value="m">중형</option>
								<option value="l">대형</option>
							</select>
		                </td>
		                <th>성별</th>
		                <td>
							<select name="petGender">
								<option value="m">왕자님</option>
								<option value="f">공주님</option>
							</select>
						</td>
		            </tr>
		            <tr>
		                <th>나이</th>
		                <td><input type="text" name="petAge" />살</td>
		                <th>몸무게</th>
		                <td>
		                    <input type="text" name="weight" /> kg
		                </td>
		            </tr>
		            <tr>
		                <th>특이사항</th>
		                <td colspan="4">
		                	<textarea rows="3" cols="120" name="remark"></textarea>
		                </td>
		            </tr>
		        </table>
		    </div>
	    </div>
	    <div class="offset-md-9">
		    <button type="button" class="btn btn-outline-secondary">취소</button>
	        <button type="submit" class="btn btn-outline-primary">작성 완료</button>
	    </div>
	</form>
</body>
</html>