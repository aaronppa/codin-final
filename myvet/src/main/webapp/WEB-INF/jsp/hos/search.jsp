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
        #body {
            width: 80%;
            margin: auto;
        }
        table{
            border: 1px black solid;
        }
        .td1 {
            text-align: center;
            width: 40px;
        }
        .td2 {
            text-align: center;
            width: 20%;
        }
        table {
            border-radius: 3px;
        }
    </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            

    <div id="body">
    <h1>동물병원 찾기</h1>
       	<input type="radio" name="searchType" id="type-name" value="1">
       	<label for="type-name">병원 이름으로 검색</label>
       	<input type="radio" name="searchType" id="type-addr" value="2">
       	<label for="type-addr">주소로 가까운 병원 검색</label><br>
       	<span>검색어 : </span><input type="text" name="keyWord" id="key-word"/>
    <h2>검색 결과</h2>
    <h3>MyVet 인증병원</h3>
    <table>
        <tr>
            <th>
                <h3><a href="#">aaa 동물병원</a></h3>
            </th>
            <td>
                <span>경기도 성남시 분당구 어쩌고 저쩌고</span><br>
                <span>경기도 성남시 분당구 어쩌고 저쩌고</span><br>
                <span>031-123-4567</span>
            </td>
            <td>
            	즐겨찾는 고객 수 : 891
            </td>
        </tr>
    </table>
    <h3>미등록 병원</h3>
    	<div>
	       <tr>
	           <th>
	               <h4>bbb 동물병원</h4>
	           </th>
	           <td>
	               <span>경기도 성남시 분당구 어쩌고 저쩌고</span><br>
	               <span>031-123-4567</span>
	           </td>
	  	    </tr>
  	    </div>
    </div>
</body>
</html>