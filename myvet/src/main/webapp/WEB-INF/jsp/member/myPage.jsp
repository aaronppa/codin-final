<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반려인 마이페이지</title>
<!-- font awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>
    img { 
        border: 1px solid black;
        width: 200px;
        height: 200px;
    }
    .fa-camera {
        font-size: 2em;
    }
    table {
        width: 70%;
    }
    #profile {
        width: 250px;
    }
    .pet-div {
        width: 250px;
        height: 250px;
        margin-top: 50px;
        float: left;
        padding-top: 25px;
        text-align: center;
        border: 1px solid black;
    }
    .inner-div {
        border: 1px solid black;
        width: 200px;
        height: 200px;
        margin: auto;
    }
</style>
</head>
<body>
	<table>
        <tr>
            <td rowspan="6" id="profile">
                <img src="../../../../app/myVet/profile.jpg" />
                <i class="fas fa-camera"></i>
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>kim@bit.camp</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td>*******&nbsp;&nbsp;&nbsp;&nbsp;<button>변경</button></td>
        </tr>
        <tr>
            <th>이름</th>
            <td>김멍멍</td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td>김야옹&nbsp;&nbsp;&nbsp;&nbsp;<button>변경</button></td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>010-4567-1234</td>
        </tr>
    </table>
    <div class="pet-div">
        <img src="../../../../app/myVet/profile.jpg" />
    </div>
    <div class="pet-div">
        <img src="../../../../app/myVet/profile.jpg" />
    </div>
    <div class="pet-div">
        <div class="inner-div">
            
        </div>
    </div>
</body>
</html>