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
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/js/waitme/waitMe.css'/>"/>
<script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script>
<script src="<c:url value='/resources/js/waitme/common-waitme.js'/>"></script>
<style>
body{
	margin: 0;
}
.main-container{
    width: 1050px;
    height: 620px;
    margin: 30px auto;
    display: flex;
    position:relative;
    -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
       -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
  	margin-top: 10px auto;
  	background:#FFF;
  	border-radius: 5px;
}

.main-container:before, .main-container:after
{
    content:"";
    position:absolute;
    z-index:-1;
    -webkit-box-shadow:0 0 20px rgba(0,0,0,0.8);
    -moz-box-shadow:0 0 20px rgba(0,0,0,0.8);
    box-shadow:0 0 20px rgba(0,0,0,0.8);
    top:10px;
    bottom:10px;
    left:0;
    right:0;
    -moz-border-radius:100px / 10px;
    border-radius:100px / 10px;
}
.main-container:after
{
    right:10px;
    left:auto;
    -webkit-transform:skew(8deg) rotate(3deg);
       -moz-transform:skew(8deg) rotate(3deg);
        -ms-transform:skew(8deg) rotate(3deg);
         -o-transform:skew(8deg) rotate(3deg);
            transform:skew(8deg) rotate(3deg);
}

.header{
    height: 50px;
    border-bottom: 1px solid grey;
}

.headerblock{
    padding-top: 11px;
    padding-bottom: 11px;
    margin: auto;
    width: 273px;
    text-align: center;
}

.side-subcontainer{
    width: 272px;
    border-right:1px solid #8b787a;
}

.main-subcontainer{
    width: 775px;
}

.left-panel, .main-panel{
	overflow-y: auto;
	height: 570px;
}

.scrollable::-webkit-scrollbar{
	width: 2px;
}
.scrollable::-webkit-scrollbar-thumb{
	background-color: darkgrey;
  outline: 1px solid slategrey;
}

h5{
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

#chatroomlist{
    list-style-type: none;
    margin: 0;
    padding: 0;
    height: auto;
}

.rounded-circle{
    width: 50px;
    height: 50px;
}

.conversation.list{
	height: 64px;
    position: relative;
}

.chatroom > div *{
	border: 1px solid lightgray;
	padding: 0;
	margin: 0;
}

.converstaion-chatroom{
	height: inherit;
}
.chatroom,.recipients-input{
	height: inherit;
	display: flex;
}
.profile{
	height: inherit;
	width: 64px;
	padding: 7px;
}
.chat-info{
	height: inherit;
	width: 204px;
	padding-top: 10px;
}
.recipients,.lastmsg.brief{
	position: relative;
	height: 22px;
	width: 204px;
	line-height: 20px;;
}

.nodisplay{
	display: none;
}

.converstaion-chatroom:hover{
	background: #f4e8e6;
}	

input.recipient{
	width: 300px;
	border: none;
}

.recipients-input{
    padding: 11px;
}

.recipients-input > div:first-child{
	line-height: 27px;
}

.recipientSearchLayer{
	position: absolute;
	left: 527px;
	top: 150px;
	width: 300px;
	min-height: 200px;
	max-height: 400px;
	border: 1px solid grey;
	border-radius: 5px;
	background: #fff;
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
                    <h5>Messenger</h5>
                    <i class="far fa-edit fa-lg" id="writemsgbtn"></i>
                </div>
            </div>
            <div class="left-panel scrollable">
                <ul class="conversation list" id="chatroomlist">
                <c:forEach begin="0" end="20" step="1" var="hi">
                    <li class="converstaion-chatroom">
                       <div class='chatroom'>
                       	<div class='profile'>
                       	<img src="<c:url value='/resources/img/test_image/test4.jpg'/>" class="rounded-circle">
                       	</div>
                       	<div class='chat-info'>
	                   		<div class='recipients'>
	                   		원래 있는 대화방
	                   		</div>
	                   		<div class='lastmsg brief'>
	                   		</div>
                   		</div>
                   		</div>
                    </li>
                   </c:forEach>
                </ul>
            </div>
        </div>
        <div class="main-subcontainer">
            <div class="top-main header">
           	 <div class="recipients-input">
            	
            </div>
            </div>
            <div class="main-panel scrollable">
            </div>
        </div>
    </div>
    
    <div class="recipientSearchLayer nodisplay">
    	<div class="recipientSearchBox scrollable">
    		<div class="recipientResultType">
    		<ul class="recipientSearchList">
    		</ul>
    		</div>
  			<div class="recipientResultType">
  			</div>
    	</div>
    </div>
<script>

/* Write Button Action */
/* 신규메세지 버튼 한번만 작동시키기 위한 스위치 */
var newMsgSwitch = false;

$("#writemsgbtn").on("click", function(){
	if(newMsgSwitch===false){
		var chatRoomHtml = `<li class="converstaion-chatroom">
					        <div class='chatroom'>
					       	<div class='profile'>
					       	<img src="<c:url value='/resources/img/test_image/test4.jpg'/>" class="rounded-circle">
					       	</div>
					       	<div class='chat-info'>
					       		<div class='recipients'>
					       		신규 대화방
					       		</div>
					       		<div class='lastmsg brief'>
					       		</div>
					   		</div>
					   		</div>
					   		 </li>`;
		$("#chatroomlist").prepend(chatRoomHtml);
		
		var recipientInputHtml = ` <div class="recipients-input">
							        	<div>수신자:&nbsp;</div>
							        	<div>
							        		<input autocomplete="off" id="recipientSearch" class="recipient" placeholder="수신자 닉네임 또는 수신단체명을 입력해주세요" spellcheck="false" type="text">
							       	 	</div>
							        </div>`;
		
		$(".top-main.header").html(recipientInputHtml);
		
		newMsgSwitch = true;
	}
})

/* 수신자 검색 */
$(".top-main.header").on("keyup","#recipientSearch",function(){
	$(".recipientSearchLayer.nodisplay").removeClass("nodisplay");
	console.log("Recipient Search Input Keyup this:",$(this).val());
	
	$.post({
		
	});
	
});

$(".top-main.header").on("blur","#recipientSearch",function(){
	$(".recipientSearchLayer").addClass("nodisplay");
});
</script>
</body>
</html>