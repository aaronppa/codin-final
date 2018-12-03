<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Messenger</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>
body{
	margin: 0;
}
.main-container{
    width: 1050px;
    height: 620px;
    margin: auto;
    display: flex;
    box-shadow:
      0 0 0 10px hsl(0, 0%, 80%),
      0 0 0 15px hsl(0, 0%, 90%);
  	margin-top: 10px;
}

.header{
    height: 50px;
    border-bottom: 1px solid grey;
}

.headerblock{
    padding-top: 14px;
    padding-bottom: 14px;
    margin: auto;
    width: 280px;
    text-align: center;
}

.side-subcontainer{
    width: 275px;
    border:1px solid #8b787a;
}

.main-subcontainer{
    width: 775px;
    border:1px solid #8b787a;
}

h3{
    display: inline-block;
    margin-left: 50px;
    margin-right: 50px;
    margin-top: 0px;
    margin-bottom: 0px;
    color: #412427;
}

.fas, .far{
    color: #8b787a;
}

.fas:hover, .far:hover{
    color: #412427;
    cursor: pointer;
}

ul{
    list-style-type: none;
    margin: 0;
    padding: 0;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
    <div class="main-container">
        <div class="side-subcontainer">
            <div class="top-side header">
                <div class="headerblock">
                    <i class="fas fa-cog fa-lg"></i>
                    <h3>Messenger</h2>
                    <i class="far fa-edit fa-lg"></i>
                </div>
            </div>
            <div class="left-panel">
                <ul class="conversation list">
                    <li class="converstaion-chatroom">
                        <div>
                        </div>    
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-subcontainer">
            <div class="top-main header"></div>
            <div class="main-panel"></div>
        </div>
    </div>
</body>
</html>