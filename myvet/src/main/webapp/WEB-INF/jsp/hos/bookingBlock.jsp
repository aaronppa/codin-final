<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 블럭 관리</title>
    <style>
    #bodyContainer {
        width: 80%;
        margin: auto;
    }

    .inline {
        display: inline-block;
    }

    .marginLeft{
        margin-left: 50px;
    }

    #blockTable {
        width: 100%;
    }

    #blockTable td,
    .center{
        text-align: center;
    }
    .picker {
        width: 50px;
    }
    </style>
    <link rel="stylesheet" href="js/jonthornton-jquery-timepicker-1.11.14-0-gb53338c/jonthornton-jquery-timepicker-b53338c/jquery.timepicker.css">
    <script src="js/vendor/jquery.js"></script>
    <script src="js/jonthornton-jquery-timepicker-1.11.14-0-gb53338c/jonthornton-jquery-timepicker-b53338c/jquery.timepicker.js"></script>
</head>
<body>
    <div id="bodyContainer">
        <div>
            <h1 class="inline">예약 블럭 관리</h1>
            <span class="marginLeft">ooo동물병원</span>
        </div>
        <div>
            <input type="checkbox" name="blockType" id="medical" value="1">
            <label for="medical">진료</label>
            <input type="checkbox" name="blockType" id="beauty" value="1">
            <label for="beauty">미용</label>
        </div>
        
        <div>
            <h3 class="center">2018/12/03 ~ 2018/12/09</h3>
        </div>
        <table id="blockTable">
            <tr>
                <th></th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
                <th>일</th>
            </tr>
            <tr>
                 <th></th>
           		 <c:forEach begin="0" end="6" var="i">
	                 <th><fmt:formatDate value="${monday. }" pattern="MM/dd"/></th>
                 </c:forEach>
                 <th>12/04</th>
                 <th>12/05</th>
                 <th>12/06</th>
                 <th>12/07</th>
                 <th>12/08</th>
                 <th>12/09</th>
            </tr>
            <tr>
                <th>
                    휴무일
                </th>
                <td>
                	
                    <input type="checkbox" name="dayOff" id="">
                </td>
            </tr>
            <tr>
                <th>
                    진료시간
                </th>
                <td>
                    <input class="picker" type="text" name="openTime" id="test" > ~ 
                    <input class="picker" type="text" name="closeTime" id="test" >
                </td>
            </tr>
            <tr>
                <th>
                    예약간격
                </th>
                <td>
                    <select name="" id="">
                        <option value="1">15분</option>
                        <option value="2">30분</option>
                        <option value="3">1시간</option>
                    </select>
                </td>
            </tr>
            <tr class="breakTime">
                <th>
                    휴게시간
                </th>
                <td>
                    <input class="picker" type="text" name="openTime" id="test" > ~ 
                    <input class="picker" type="text" name="closeTime" id="test" >
                </td>
            </tr>
            <tr>
                <th>
                    일괄적용
                </th>
                <td>
                    <button>평일 일괄 적용</button> <br>
                    <button>주말 일괄 적용</button> <br>
                    <button>모두 일괄 적용</button> <br>
                </td>
            </tr>
        </table>
        <button>저장</button>
    </div>
    <script>
        $('.picker').timepicker({'timeFormat' : 'H:i'})
    </script>
</body>
</html>