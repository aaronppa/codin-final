<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Messenger</title>

<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<script
	src="https://malihu.github.io/custom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="<c:url value='/resources/js/common/tooltipster/tooltipster.bundle.js'/>"></script>

<link rel="stylesheet"
	href="https://malihu.github.io/custom-scrollbar/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/msg/small-chat-responsive.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/tooltipster/tooltipster.bundle.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/tooltipster/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css'/>" />

<style>
body {
	margin: 0;
	overflow: auto !important;
}

.main-container {
	top: 80px;
	width: 1050px;
	height: 620px;
	margin: 30px auto;
	display: flex;
	position: relative;
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1)
		inset;
	margin-top: 10px auto;
	background: #FFF;
	border-radius: 5px;
}

.main-container:before, .main-container:after {
	content: "";
	position: absolute;
	z-index: -1;
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	-moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	top: 10px;
	bottom: 10px;
	left: 0;
	right: 0;
	-moz-border-radius: 100px/10px;
	border-radius: 100px/10px;
}

.main-container:after {
	right: 10px;
	left: auto;
	-webkit-transform: skew(8deg) rotate(3deg);
	-moz-transform: skew(8deg) rotate(3deg);
	-ms-transform: skew(8deg) rotate(3deg);
	-o-transform: skew(8deg) rotate(3deg);
	transform: skew(8deg) rotate(3deg);
}

.header {
	min-height: 50px;
	border-bottom: 1px solid grey;
}

.top-side.header {
	height: 50px;
}

.headerblock {
	padding-top: 11px;
	padding-bottom: 11px;
	margin: auto;
	width: 273px;
	text-align: center;
}

.side-subcontainer {
	width: 272px;
	border-right: 1px solid #8b787a;
}

.main-subcontainer {
	width: 775px;
}

.left-panel {
	overflow-y: auto;
	height: 570px;
}

.main-panel {
	height: 518px;
}

.scrollable::-webkit-scrollbar {
	width: 2px;
}

.scrollable::-webkit-scrollbar-thumb {
	background-color: darkgrey;
	outline: 1px solid slategrey;
}

h5 {
	display: inline-block;
	margin-left: 50px;
	margin-right: 50px;
	margin-top: 0px;
	margin-bottom: 0px;
	color: #412427;
}

.fas, .far {
	color: #8b787a;
}

.fas:hover, .far:hover {
	color: #412427;
	cursor: pointer;
}

.conversation.list, .recipientSearchList {
	list-style-type: none;
	margin: 0;
	padding: 0;
	height: auto;
}

.rounded-circle {
	width: 50px;
	height: 50px;
}

.profile-multiple .rounded-circle {
	width: 25px;
	height: 25px;
}

.rounded-circle.search-result {
	width: 32px;
	height: 32px;
}

.conversation.list {
	height: 64px;
	position: relative;
}

.chatroom>div * {
	padding: 0;
	margin: 0;
}

.conversation-chatroom {
	height: inherit;
}

.chatroom, .recipients-input {
	height: inherit;
	display: flex;
}

.profile, .profile-multiple {
	border-radius: 50%;
	height: 64px;
	width: 64px;
	padding: 7px;
	overflow: hidden;
}

.profile div{
	display: inline-block;
	float: left;
	background-position: center;
	background-size: cover;
	width: 100%;
	height: 100%;
}

.profile-multiple div{
	display: inline-block;
	flex: left;
	background-position: center;
	background-size: cover;
	width: 25%;
	height: 25%;
}

div.quarter{
	height: 50%;
}

div.half, div.quarter{
	width: 50%;
}

.chat-info {
	height: inherit;
	width: 204px;
	padding-top: 10px;
}

li>.chatroom>.chat-info>.recipient, .lastmsg{
	position: relative;
	height: 22px;
	line-height: 20px;
	width: 204px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.conversation-chatroom:hover {
	background: #f4e8e6;
}

#recipientSearch {
	width: 300px;
	border-radius: 5px;
	border: none;
	margin-left: 10px;
}

#recipientSearch:focus {
	outline: none;
}

.recipients-input {
	padding: 11px;
	overflow: auto;
	padding-bottom: 5px;
	flex-wrap: wrap;
}

.recipientSearchLayer {
	position: absolute;
	top: 148px;
	width: 300px;
	max-height: 400px;
	border: 1px solid grey;
	border-radius: 5px;
	background: #fff;
	display: block;
	overflow-y: auto;
}

.recipientResultType.member, .recipientResultType.hospital {
	width: 298px;
	height: 24px;
	border: 1px solid transparent;
	background: #f5e9c3;
}

.resultList * {
	height: 32px;
	display: inline-flex;
}

.resultList {
	height: 41px;
	display: inline-flex;
}

.resultList:hover {
	background: #f4e8e6;
	cursor: pointer;
}

.profile-search {
	width: 32px;
	height: 32px;
	margin: 4px;
}

.memberNickname, .hospitalName {
	margin: 4px;
	width: 250px;
	height: 32px;
	line-height: 32px;
}

.nodisplay, .nodisplay * {
	display: none !important;
}

span.addedRecipient {
	line-height: 28px;
	padding: 4px;
	background: #f4e8e6;
	border-radius: 3px;
	margin-right: 5px;
}

span.headerRecipient {
	line-height: 28px;
	padding: 4px;
	background: #f4e8e6;
	border-radius: 3px;
	margin-right: 5px;
}

span.addedRecipient:hover {
	background: #8b787a;
	cursor: pointer;
}

li>.chatroom>.chat-info>.recipient>span.addedRecipient {
	border: none;
	background: unset;
	padding: 0;
	border-radius: unset;
	margin: 0;
	line-height: 22px;
}

.messages-content {
	overflow-y: auto;
	height: 518px;
}

.recipients-input>div:first-child {
	line-height: 32px;
	width: 60px;
}

.close-chat {
	text-align: center;
	width: 9px;
	height: 9px;
	position: relative;
	top: 6px;
	left: -15px;
	line-height: 9px;
	border-radius: 9px;
}

.close-chat:hover {
	font-size: 150%;
	font-weight: 500px;
	width: 15px;
	height: 15px;
	border-radius: 15px;
	cursor: pointer;
}

.btnarea {
	text-align: center;
	height: 49px;
	width: 85px;
	margin: auto;
}

#send {
	background-color: #8b787a;
	border-radius: 5px;
	color: white;
	padding: .5em;
	text-decoration: none;
	width: 30px;
	height: 20px;
	text-align: center;
	line-height: 49px;
}

.msgtextinput {
	line-height: 50px;
	border-top: 1px solid #8b787a;
	width: 775px;
	height: 50px;
	display: flex;
	overflow: hidden;
	position: absolute;
}

#msgtextarea {
	line-height: 18px;
	margin: 9px 0;
	resize: none;
	width: 700px;
	height: 32px;
	padding: 5px;
	border-style: none;
	/* border-color: black; */
	overflow: hidden;
	box-sizing: border-box;
}

.newmsg{
font-weight: 900;
background: #f5e9c3;
}

.tooltip-container{
	display: none;
}

.button{
	border-radius: 5px;
	padding: 5px;
}

.button.member-recipient-option{
	margin-right: 10px;
}

.lastmsg{
	font-weight: 100;
	font-size: smaller;
	overflow: 
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	<div class="container">
	<div class="main-container">
		<div class="side-subcontainer">
			<div class="top-side header">
				<div class="headerblock">
					<i class="fas fa-cog fa-lg"></i>
					<h5>Messenger</h5>
					<i class="far fa-edit fa-lg" id="writemsgbtn" data-tooltip-content="#recipientOption"></i>
				</div>
			</div>
			<div class="left-panel scrollable">
				<ul class="conversation list" id="chatroomlist">
				
				<c:forEach var="myChat" items="${myChat}">
					<li class='conversation-chatroom <c:if test="${myChat.myDateRead==null}">newmsg</c:if>' data-chatid='${myChat.chatId}'>
				        <div class='chatroom'>
				        	
				        	<c:choose>
				        		<c:when test="${myChat.recipients[0].recipientType=='0'}">
				        			<c:choose>
								       	<c:when test="${fn:length(myChat.recipients)==1}">
								       	<div class='profile'>
								       	<c:choose>
									       	<c:when test="${myChat.recipients[0].memberSysName==null}">
									       		<div><img src="<c:url value='/upload/profile/default-profile.jpg'/>" class="rounded-circle single" data-memberno='${myChat.recipients[0].recipientNo}' data-recipienttype='${myChat.recipients[0].recipientType}'></div>
									       	</c:when>
									       	<c:otherwise>
									       		<div><img src="<c:url value='/upload${myChat.recipients[0].memberFilePath}/${myChat.recipients[0].memberSysName}'/>" class="rounded-circle single" data-memberno='${myChat.recipients[0].recipientNo}' data-recipienttype='${myChat.recipients[0].recipientType}'></div>
									       	</c:otherwise>
									       	</c:choose>
								       	</c:when>
								       	<c:when test="${fn:length(myChat.recipients)>1}">
 								       	<div class='profile-multiple'>
				 						    <c:forEach var="profiles" items="${myChat.recipients}" begin="0" end="6">
				 						    	<c:choose>
										       		<c:when test="${profiles.memberSysName==null}">
											       		<div><img src="<c:url value='/upload/profile/default-profile.jpg'/>" class="rounded-circle multiple" data-memberno='${profiles.recipientNo}' data-recipienttype='${profiles.recipientType}'></div>
											       	</c:when>
											       	<c:otherwise>		
											      		<div><img src="<c:url value='/upload${profiles.memberFilePath}/${profiles.memberSysName}'/>" class="rounded-circle multiple" data-memberno='${profiles.recipientNo}' data-recipienttype='${profiles.recipientType}'></div>
									       			</c:otherwise>
									       		</c:choose>
									       	</c:forEach>
								       	</c:when>
							       	</c:choose>
 						       	</c:when>
						       	<c:when test="${myChat.recipients[0].recipientType=='1'}">
						       	<div class='profile'>
						       		<c:choose>
							       		<c:when test="${myChat.recipients[0].hosSysName==null}">
							       			<div><img src="<c:url value='/upload/profile/Logo-Vet-02.png'/>" class="rounded-circle single" data-memberno='${myChat.recipients[0].recipientNo}' data-recipienttype='${myChat.recipients[0].recipientType}'></div>
							       		</c:when>
						       			<c:otherwise>		
								      		<div><img src="<c:url value='/upload${myChat.recipients[0].hosFilePath}/${myChat.recipients[0].hosSysName}'/>" class="rounded-circle single" data-memberno='${myChat.recipients[0].recipientNo}' data-recipienttype='${profiles.recipientType}'></div>
						       			</c:otherwise>
					       			</c:choose>
						       	</c:when>
				        	</c:choose>
					       	</div>
					     
					       	<div class='chat-info'>
					       	
					       		<div class='recipient'>
					       		<c:forEach var="recipients" items="${myChat.recipients}">
					       		
					       			<c:choose>
						       			<c:when test="${recipients.recipientType=='0' }">
						       				<span class="addedRecipient" data-recipientno="${recipients.recipientNo}" data-recipienttype="${recipients.recipientType}" data-recipientname="${recipients.recipientNickname }">${recipients.recipientNickname }</span>
						       			</c:when>
						       			<c:when test="${recipients.recipientType=='1' }">
						       				<span class="addedRecipient" data-recipientno="${recipients.recipientNo}" data-recipienttype="${recipients.recipientType}" data-recipientname="${recipients.hosTitle }">${recipients.hosTitle }</span>
						       			</c:when>
					       			</c:choose>
					       		</c:forEach>
					       		</div>
					       		<div class='lastmsg brief'>
					       			<span class='lastmsg' data-memberno='${myChat.recipients[0].recipientNo}' data-recipienttype='${myChat.recipients[0].recipientType}'>${myChat.msgBody}</span>
					       		</div>
					   		</div>
					   		<div class="close-chat nodisplay" data-chatid='${myChat.chatId}'>
					   		x
					   		</div>
				   		</div>
			   		</li>
			   	
			 	</c:forEach>
				
				</ul>
			</div>
		</div>
		<div class="main-subcontainer">
			<div class="top-main header">
				<div class="recipients-input"></div>
			</div>
			<div class="main-panel">
				<div class="messages">
					<div class="messages-content">
						
					</div>
				</div>
				<div class="msgtextinput">
					<div class="msg-input">
						<textarea id="msgtextarea"></textarea>
					</div>
					<div class="btnarea">
						<a class="button send" id="send" href="#" data-chatid="">전송</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="recipientSearchLayer nodisplay">
		<div class="recipientSearchBox scrollable"></div>
	</div>
	</div>
	<form action="/myvet/msg/insert.do" id="msgform">
		
	</form>
	


   <div class="tooltip-container">
   	<div id="recipientOption" >
   		<button class="button member-recipient-option" id="member-recipient-option" data-type="member">회원</button>
   		<button class="button hospital-recipient-option" id="hospital-recipient-option" data-type="hospital">병원</button>
   	</div>
   	</div>

<script src="<c:url value='/resources/js/datetime/jquery-dateformat.js'/>"></script>
<script>
/* 첫 로딩시 */ 
var $messages = $('.messages-content'), 
	form = $('form#msgform'), 
	d = new Date(),
	m = d.getMinutes(),
	todayDate = $.format.date(d,'yyyy-MM-dd'),
	h,
	me,
i = 0;

<c:if test="${ not empty user.memberNo}">
 me =${user.memberNo};
</c:if>

$(document).ready(function(){
	console.log("Docu Ready")
	$("#writemsgbtn").tooltipster({
		theme: 'tooltipster-shadow',
		animation: 'fade',
		trigger: 'click',
		interactive: 'true',
		side: 'bottom',
		contentCloing: 'true',
		zIndex: '250',		
	}).tooltipster("reposition");
});


$(window).on("load", function () {
	$messages.mCustomScrollbar();
	
	makeFirstListActive();

	// 삭제대상 
	/* setTimeout(function() {
	fakeMessage();
	}, 100); */
});

/* Write Button Action */
/* 신규메세지 버튼 한번만 작동시키기 위한 스위치 */
var newMsgSwitch = true;

 $("#recipientOption button").on("click", function(e){
	e.preventDefault();
	
	$(".left-panel.scrollable").animate({ scrollTop: 0 }, "slow");
	
	// console.log("write to who?");
	// console.dir($(e.target).data("type"));
	$(".recipients-input").html("");
	$(".conversation-chatroom.new .recipient.new").html("");
	var recipientInputHtml;
	
	if($(e.target).data('type')=='member'){
		recipientInputHtml = `<div class='recipients-input member-recipient'>
								<div>회원:&nbsp;</div><div class='recipient new'>
								</div>
								<input autocomplete='off' id='recipientSearch' class='recipient' placeholder='수신자 닉네임을 입력해주세요' spellcheck='false' type='text' data-type='member'>
							  </div>`;
	} else if($(e.target).data('type')=='hospital'){
		recipientInputHtml = `<div class='recipients-input hospital-recipient'>
								<div>병원:&nbsp;</div><div class='recipient new'>
								</div><input autocomplete='off' id='recipientSearch' class='recipient' placeholder='수신병원을 입력해주세요' spellcheck='false' type='text' data-type='hospital'>
							  </div>`;
	};
	$(".top-main.header").html(recipientInputHtml);
	$(".top-main.header #recipientSearch").focus();
	$("#writemsgbtn").tooltipster('close');
	
	if(newMsgSwitch===true){
		$("#mCSB_1_container").html("");
		$(".chatroom.active").removeClass("active");
		$messages.mCustomScrollbar();
		var chatRoomHtml = `<li class='conversation-chatroom new' data-chatid='0'>
						        <div class='chatroom active'>
							       	<div class='profile'>
							       	</div>
							       	<div class='chat-info'>
							       		<div class='recipient new'>
							       		<label id="newtag">신규:</label>
							       		</div>
							       		<div class='lastmsg brief'>
							       		</div>
							   		</div>
							   		<div class="close-chat nodisplay" data-chatid='0'>
							   		x
							   		</div>
						   		</div>
					   		</li>`;
		$("#chatroomlist").prepend(chatRoomHtml);
		
		$("#send").attr("data-chatid",0);
		newMsgSwitch = false;
		
	};
	$messages.mCustomScrollbar();
	
});


/* 수신자 검색 */
// click 되거나 keyup시 작동 
$(".top-main.header").on("click keyup","#recipientSearch", function(e){
	$(".recipientSearchLayer.nodisplay").removeClass("nodisplay");
	
	// input 커서의 위치에 따라 검색 결과 div 이동 
	var searchBoxPosition = this.getBoundingClientRect();
	// console.log("searchBoxPosition",searchBoxPosition);
	$(".recipientSearchLayer").css({'left' : searchBoxPosition.left, 'top' : searchBoxPosition.bottom,'border-style' : 'none'});
	
	var keyword = $(this).val();
	var recipientType = $(this).data("type");
	// console.log("Recipient Search Input Keyup this:",keyword);
	// console.log("Recipient Type:",recipientType);
	
	// 검색 키워드에 아무 value가 없으면 아무것도 보이지 않음
	// 검색 키워드에 value가 없는 상태에서 Backspace 키 누르면 수신자로 등록되어있는 수신자 삭제 
	// 현재 최초 keyup으로 입력후 한자리 글자 남았을때 Backspace누르면 직전에 등록된 수신자 삭제됨. 
	if(!keyword){
		$(".recipientSearchBox").html("");
		return false;
	};
	
	$.get("searchMember.do?type="+recipientType+"&keyword="+keyword)
	.done(function(result){
		//	console.log("Msg Recipient Search:",result);
		var searchResultHtml="";
		
		// 검색 결과 없을 시 
		if(!result.member && !result.hospital ){
			// console.log("검색결과가 없음.")
			$(".recipientSearchBox").text("검색결과가 없습니다.");
			$(".recipientSearchLayer").css('border-style', 'outset');
			return false;
		}
		
		// 수신자 중복 검색 결과에서 제거 하기 위한 작업 
		// 등록된 수진사는 span 태그 내의 모든 데이터를 배열에 담아 검색결과와 대조 
		// 중복확인시 검색결과의 객체의 배열에서 splice로 제거 
		var addedRecipientListHeader = document.querySelectorAll('.top-main.header > .recipients-input > .recipient.new > span.addedRecipient');
		//	console.log("addedRecipientListHeader:", addedRecipientListHeader);
		var recipientResultList = result;
		//	console.log("recipientResultList:", recipientResultList);
			
		if(addedRecipientListHeader.length){
			for(var i=0;i<=addedRecipientListHeader.length-1;i++){
				if(addedRecipientListHeader[i].dataset.recipienttype=='0'){
					for(var j=0; j<=recipientResultList.member.length-1;j++){	
						if(recipientResultList.member[j].memberNo==addedRecipientListHeader[i].dataset.recipientno){
							recipientResultList.member.splice(j, 1);
						//	 console.log("recipient removed");
						};
					};
						
				} 
			};
					// console.log("removed element of result");
					// console.log(result);
		};
			

		// 수신자가 일반회원인 경우 겸색결과 필터 
		if(result && result.member){
			
			searchResultHtml+=`<div class="recipientResultType member"><span>회원</span></div><ul class="recipientSearchList member">`;
			
			for(var member of result.member){
				var imgPath;
				if(member.memberFilePath==null){
					imgPath = "<c:url value='/upload"+member.memberFilePath+"/"+member.memberSysName+"'/>";
				} else if(member.memberFilePath!=null){
					imgPath = "<c:url value='/upload"+member.memberFilePath+"/"+member.memberSysName+"'/>";
				}
				
				searchResultHtml += `<li>
					                    <div class="resultList member" data-recipientno=`+member.memberNo+` data-recipienttype='0' data-recipientname="`+member.memberNickname+`">
					                        <div class='profile-search'>
					                                <img src=`+imgPath+` class="rounded-circle search-result">
					                        </div>
					                        <div class="memberNickname">
					                            <span>`+member.memberNickname+`</span>
					                        </div>
					                    </div>
					                </li>`;		  
			}	      
			searchResultHtml+= "</ul>";
		}
			
		
		// 수신자가 병원인 경우 겸색결과 필터
		if(result && result.hospital){
			searchResultHtml+=`<div class="recipientResultType hospital"><span>병원</span></div><ul class="recipientSearchList hospital">`;
			
			for(var hospital of result.hospital){
				
				// 프로필 이미지 주소 동적 처리 (없으면 Default 이미지)
				var imgPath;
				if(hospital.filePath==null){
					imgPath = "<c:url value='/upload/profile/Logo-Vet-02.png'/>";
				} else if(hospital.filePath!=null){
					imgPath = "<c:url value='/upload"+hospital.filePath+"/"+hospital.sysName+"'/>";
				}
				
				searchResultHtml += `<li>
					                    <div class="resultList hospital" data-recipientno=`+hospital.hosCode+` data-recipienttype="1" data-recipientname="`+hospital.title+`">
					                        <div class='profile-search'>
					                                <img src=`+imgPath+` class="rounded-circle search-result">
					                        </div>
					                        <div class="hospitalName">
					                            <span>`+hospital.title+`</span>
					                        </div>
					                    </div>
					                </li>`;
						            
			}
			searchResultHtml+= "</ul>";	
		}
		
		$(".recipientSearchBox").html(searchResultHtml);
		$(".recipientSearchLayer").css('border-style', 'outset');
	}); // done
	
	
}); // keyup event


/* 검색중 blur 해제 */
$(".recipientSearchLayer").on("mouseenter",function(e){
	$("#recipientSearch").off("blur");
});


/* 검색 아이템 선택시 Event Action */
$(".recipientSearchBox").on("click",".resultList",function(e){
	// console.log("Search Result Select:", $(this));
	if($(this).hasClass("member")){
		/* 두번째 수신자부터 콤마찍어주기 (앞 span에 , 추가하기) */
		if($("li.conversation-chatroom.new span")!=0){
			var lastRecipient = $("li.conversation-chatroom.new .recipient.new > span:last-child").data("recipientname");
			/* console.log("Last Recipient:", lastRecipient); */
			$("li.conversation-chatroom.new .recipient.new > span:last-child").html(lastRecipient+", ");
			
			// console.log("number of span added", $("li.conversation-chatroom.new span"));
			if($("li.conversation-chatroom.new span").length+1>1){
				$("li.conversation-chatroom.new .profile").addClass("profile-multiple").removeClass("profile");
			}
		} 
		$("div.recipient.new").append("<span class='addedRecipient' data-recipientno='"+$(this).data("recipientno")+"' data-recipienttype='"+$(this).data("recipienttype")+"' data-recipientname='"+$(this).data("recipientname")+"'>"+$(this).data("recipientname")+"</span>");
		$("li.conversation-chatroom.new [class^='profile']").append("<div>"+$(this).find(".profile-search").clone().html()+"</div>");
		$("li.conversation-chatroom.new img").removeClass("search-result");
		$("#recipientSearch").val("");
		$("#recipientSearch").focus();
	} else if($(this).hasClass("hospital")){
		$("div.recipient.new").append("<span class='addedRecipient' data-recipientno='"+$(this).data("recipientno")+"' data-recipienttype='"+$(this).data("recipienttype")+"' data-recipientname='"+$(this).data("recipientname")+"'>"+$(this).data("recipientname")+"</span>");
		$("#recipientSearch").remove();
		
	}
	
 	/* $(".recipientSearchBox").html(""); */
});




/* 검색중 다른곳으로 blur하면 검색결과 div 숨기기 */
$(".top-main.header").on("blur","#recipientSearch", function() {
	 setTimeout(function(){
		 $(".recipientSearchLayer").addClass("nodisplay")
	 }, 150)
});


/* 선택된 수신자 마우스 올릴때 삭제 표시 */
var spanText;
$(".top-main.header").on("mouseenter", "span.addedRecipient", function(e){
	spanText = $(this).html();
	$(this).html(spanText+" x");
});


/* 선택된 수신자 마우스 내릴때 삭제 표시 제거 */
$(".top-main.header").on("mouseleave", "span.addedRecipient", function(e){
	$(this).html(spanText);
});


/* 수신자 클릭시 삭제 */
$(".top-main.header").on("click", "span.addedRecipient", function(e){
	// console.log("clicked:", e.target);
	// console.log(e.target.dataset);
	var recipientType = e.target.dataset.recipienttype;
	var recipientNo = e.target.dataset.recipientno;
	
	/* 일반회원인지 병원인지 따짐 */
	/*  */
	if(recipientType=='0'){
		$("span[data-recipientno='"+recipientNo+"']").remove();
		$("li.conversation-chatroom.new [class^='profile'] div:last-child").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
	
		if($("li.conversation-chatroom.new span").length==1){
			$("li.conversation-chatroom.new .profile-multiple").addClass("profile").removeClass("profile-multiple");
		}
	} else if(recipientType=='1'){
		$("span[data-recipientno='"+recipientNo+"']").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
		$("<input autocomplete='off' id='recipientSearch' class='recipient' placeholder='수신병원을 입력해주세요' spellcheck='false' type='text' data-type='hospital'>").appendTo($(".recipients-input.hospital-recipient"))
	}
}); 

/* 채팅방 닫기 표시 */
$("#chatroomlist").on("mouseenter",".chatroom", function(){
	var $closeTarget = $(this)
	// console.log("close button",$closeTarget.find(".close-chat"));
	$closeTarget.find(".close-chat.nodisplay").toggleClass("nodisplay");
})

/* 대화방에서 마우스 나가면 닫기 표시 없어짐 */
$("#chatroomlist").on("mouseleave",".chatroom", function(){
	// console.log("close button",$(this).find(".close-chat"));
	$(this).find(".close-chat").addClass("nodisplay");
})

/* Input Text가 공백일 경우 백스페이스누르면 이전 수신자 삭제 */
$(".top-main.header").on("keydown","#recipientSearch", function(e){
	if (!$("#recipientSearch").val() && e.key === "Backspace" || e.key === "Delete") {
		// console.log("Search Key:",$("#recipientSearch").val());
		// console.log("backspaced!");
		$("div.recipient.new > :last-child").remove();
		$("li.conversation-chatroom.new [class^='profile'] div:last-child").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
		
		if($("li.conversation-chatroom.new span").length==1){
			$("li.conversation-chatroom.new .profile-multiple").addClass("profile").removeClass("profile-multiple");
		}
	};
});

// console.log("bottom position:",document.querySelector(".main-container").getBoundingClientRect());


/* Responsive Message Content */ 

/* 메세지 입력 후 전송 함수 (AJAX Request) */
function insertMessage(item) {
	msg = $('#msgtextarea').val();
	
	if ($.trim(msg) == '') {
		return false;
	}
	$("<input type='hidden' name='msgBody' value='" + msg + "'>").appendTo(form);
	$("<input type='hidden' name='senderNo' value='" + me + "'>").appendTo(form);
	$("<input type='hidden' name='chatId' value='" + item.dataset.chatid + "'>").appendTo(form);
//	console.log("send btn chatid check:", item.dataset.chatid);
	$('<div class="message message-personal">' + msg + '</div>').appendTo($('.mCSB_container')).addClass('new');
	setDate();
	$('#msgtextarea').val(null);
	updateMsgScrollBar();
	
	var addedRecipientListChat = document.querySelectorAll('.conversation-chatroom.new span.addedRecipient');
	// 신규 메세지인 경우 
	if(item.dataset.chatid==0){
		
		// 등록된 수신자 배열을 변수에 담는다. 
		for(var recipientArr of addedRecipientListChat){
//			console.log("recipientArr", recipientArr);
			// 수신자 타입(일반회원/병원 별) 구분하여 data 심어줌 
			// console.log("Recipient, Type:",recipientArr.dataset.recipientno, recipientArr.dataset.recipienttype);
			$("<input type='hidden' name='recipientNo' value='" + recipientArr.dataset.recipientno + "'>").appendTo(form);
			$("<input type='hidden' name='recipientType' value='" + recipientArr.dataset.recipienttype + "'>").appendTo(form);
		}	
		
//		console.dir($("form#msgform").attr("action"));
//		console.log("New Chatroom MsgFormData:", form.serialize());
		
		// 전송 AJAX
		$.post(form.attr("action"), form.serialize())
		.done(function(returnedChatId){
			console.log("all chatid==0", $("*[data-chatid='0']"));
			console.log("all new", $(".conversation-chatroom.new, .recipient.new"));
			if($("*[data-chatid='0']").length>0){
				$("*[data-chatid='0']").attr("data-chatid",returnedChatId);
			}
			
			// 첫 메세지 성공하면 더이상 신규 메세지가 아님으로  new class명 제거 
			$(".conversation-chatroom.new, .recipient.new").removeClass("new");
			$("#newtag").remove();
		});
	} 
	// 기존 대화방 대화 메세지 전송인 경우 (chatid is not null or other than 0)
	else{
 		$("<input type='hidden' name='recipientType' value='0'>").appendTo(form);
//		console.log("기존 대화방 Chatid:", item.dataset.chatid)	
//		console.dir($("form#msgform").attr("action"));
//		console.log("Existing Chatroom MsgFormData:", form.serialize());
		
		$.post(form.attr("action"), form.serialize());
		
	}
//	console.log("formData after AJAX.DONE:", form);
	form.html("");
	newMsgSwitch=true;
	
	/*
	// Test용 자동 대답봇
	setTimeout(function() {
		fakeMessage();

	}, 1000 + (Math.random() * 20) * 100);
	*/
};


/* 전송버튼 Action */
$('#send').click(function(e) {
	e.preventDefault();
	sendClick(this);
});


/* 메세지 입력 input에서 엔터 누르면 */
$('#msgtextarea').on('keydown', function(e) {
	if (e.keyCode == 13) {
		e.preventDefault();
//		console.log("enter pressed to send");
		sendClick($("#send")[0]);
	}
})


/* 대화방선택 */ 
$("#chatroomlist").on("click", ".chatroom", function(e){
	e.preventDefault();
//	console.log("Chatroom changed", $(this).parent().data("chatid"));
	$(".chatroom.active").removeClass('active');
	$(this).toggleClass('active')
	activeDo();
	
	
	/*
	var newMsgCnt = $(".userid.msgbadge span.badge").text();
	console.log("newMsgCnt:", newMsgCnt);

	// 만약 안읽은 메세지가 있는 대화방을 선택했을 경우 안읽은 메세지수 -1 처리 
	if($(this).closest("li").hasClass("newmsg")){
		if(newMsgCnt>0){
		 	var zeroCntCheck = newMsgCnt-1;
		 	if(zeroCntCheck!=0){
				$(".msgbadge span.badge").text(zeroCntCheck);
		 	} else {
		 		$(".msgbadge span.badge").text('');
		 	}
		}
		$(this).closest("li").removeClass("newmsg");
	}
	*/
});


/* 채팅방 나가기 또는 신규작성 취소 */
$("#chatroomlist").on("click",".close-chat", function(e){
	    // 대화방 선택과 중복되어 이전 함수 호출 차단해야 함 
		e.stopPropagation();
		// sweetalert로 삭제 재확인 필요 
		
		// ajax로 대화방 수신자 그룹에서 trash 처리 
//		console.log("close btn:", $(this));
		if(this.dataset.chatid!=0){
			alert("대화방이 삭제되면 더이상 대화내용이 사라지며 더이상 대화내요을 확인하실수 없습니다.")
			$.get("deltechatroom.do?recipientGroupId="+this.dataset.chatid+"&recipientNo="+me);
		}
		
		// writebtn 다시 활성화 
		newMsgSwitch=true;
		// 대화방 사라짐 
//		console.log("closing Target:", $(e.target).closest("li"));
	 	$(e.target).closest("li").remove();
	 		
		// 수신자 등록 박스 초기화 (다른 대화방의 message-content와 header로 업데이트 필요)
		$(".recipients-input").html("");
		$("#mCSB_1_container").html("");

		makeFirstListActive();	 	
	});
	
/* Functions 모음 */
/* 메세지 창 스크롤바 업데이트 */
function updateMsgScrollBar() {
	$messages.mCustomScrollbar("update").mCustomScrollbar('scrollTo', 'bottom', {
		scrollInertia: 10,
		timeout: 0
	});
}

function setDate(){
	$('<div class="timestamp-right">' + '오늘' + $.format.date(todayDate,'HH:mm:ss') + ':' + m + '</div>').appendTo($('.message:last'));
	/* $('<div class="checkmark-sent-delivered">&check;</div>').appendTo($('.message:last'));
	$('<div class="checkmark-read">&check;</div>').appendTo($('.message:last')); */
}

// 첫 로딩, 대화방 삭제, 글쓰기 취소시 대화방리스트 최상단의 것이 선택되게 함 
function makeFirstListActive(){
//	console.log("first active chatroom", $("li:first-child > .chatroom"));
 	$("#chatroomlist li:first-child > .chatroom").addClass("active");
	activeDo();
};

// Active한 대화방이 선택되었을때 처리 함수 
//   Active한 대화방 번호 Send 버튼에 넣어주기 & active한 대화방 대화 불러오기 
function activeDo(){
	var activeChatRoom = $(".chatroom.active").parent();
	var activeChatId = $(".chatroom.active").parent().data("chatid");
	// console.log("active", $(".chatroom.active"));
//	console.log("active ChatId", activeChatId);
	var addedRecipientListChat = document.querySelectorAll('.chatroom.active span.addedRecipient');
//	console.log("addedRecipientListChat",addedRecipientListChat);
	// 신규 메세지창 다시 선택해서 active 했을때 
	if(activeChatId=='0'){
		// console.log("신규 대화방 다시 들어옴");
		$('.mCSB_container').html("");
		if(!addedRecipientListChat.length){
			// console.log("등록된 수신자 없음");
			$(".recipients-input").html("");
			$('#writemsgbtn').tooltipster('open');
		} else{
			$(".top-main.header > .recipients-input").html("<div>수신자:&nbsp;</div><div class='recipient new'></div>");
			$(".top-main.header .recipient.new").html($(addedRecipientListChat).clone());
			$("<input autocomplete='off' id='recipientSearch' class='recipient' placeholder='수신자 닉네임을 입력해주세요' spellcheck='false' type='text' data-type='member'>").appendTo($(".recipients-input.member-recipient"))
		}
		return false;
	}
	
	$("#send").attr("data-chatid", activeChatId);
	$(".top-main.header > .recipients-input").html("<div>수신자:&nbsp;</div><div class='recipient'></div>");
	
	$(".top-main.header .recipient").html($(addedRecipientListChat).clone());
	$(".recipients-input span").removeClass("addedRecipient").addClass("headerRecipient");
	
	// 만약 안읽은 메세지가 있는 대화방을 선택했을 경우 안읽은 메세지수 -1 처리 
	var newMsgCnt = $(".userid.msgbadge span.badge").text();
//	console.log("newMsgCnt:", newMsgCnt);
	
	if(activeChatRoom.hasClass("newmsg")){
		if(newMsgCnt>0){
		 	var zeroCntCheck = newMsgCnt-1;
		 	if(zeroCntCheck!=0){
				$(".msgbadge span.badge").text(zeroCntCheck);
		 	} else {
		 		$(".msgbadge span.badge").text('');
		 	}
		}
		activeChatRoom.removeClass("newmsg");
	}
	
	/* 대화방의 메세지 가져오기 */
	retrieveMsgs(activeChatId);
};

/* 전송버튼 Action 함수 */
function sendClick(item){
//	console.log("sendClick item:", item);
	updateMsgScrollBar();
	
	if(!item.dataset.chatid){
		return false;
	}
	
	if(item.dataset.chatid!=0 && $('#msgtextarea').val()){
		insertMessage(item);
		$("li.conversation-chatroom[data-chatid='"+item.dataset.chatid+"']").prependTo($("#chatroomlist"));
	
	}
	
	if(item.dataset.chatid==0 && $('#msgtextarea').val()){
		var addedRecipientListNewChat = document.querySelectorAll('.conversation-chatroom.new span.addedRecipient');
//		console.log("addedRecipientListNewChat",addedRecipientListNewChat);
		// 수신자가 없는 경우 
		if(addedRecipientListNewChat.length==0){
			alert("수신자를 입력해주세요.");
			$('#msgtextarea').val(null);
			$("#recipientSearch").focus();
			return false;
		}
		
		// console.log("첫 메세지 New sendClick btn chatid:",$('#send').data("chatid"));
		
		insertMessage(item);
				
		// 신규 메세지 일 경우 변경되는 elements
		$("div.recipients.new").html(addedRecipientListNewChat);
		$(".recipients-input span").removeClass("addedRecipient").addClass("headerRecipient");
		$("#recipientSearch").remove();
	}
	$("#msgtextarea").focus();
}

/* 대화방의 메세지 가져오기 */
function retrieveMsgs(activeChatId){
	
	$.get(me+"/"+activeChatId+".do", function(result){
		// console.log("ChatMsgs:",result);		
		$('.mCSB_container').html("");
		var timeStamp;
		var senderNickname;
		for(var msg of result){
			
			if($.format.date(msg.dateSent,'yyyy-MM-dd')==todayDate){
				timeStamp = "오늘 " + $.format.date(msg.dateSent,'HH:mm:ss');
			} else{
				timeStamp = $.format.date(msg.dateSent,'yyyy-MM-dd HH:mm:ss');
			}
			
			if(msg.msgType!='1' && msg.msgType!='2'){
				senderNickname = msg.senderHosNickname;
			} else {
				senderNickname = msg.senderNickname;
			}
			if(msg.senderNo==me){
				$("<div class='message message-personal' data-msgid='"+msg.msgId+"'>" + msg.msgBody + "</div>").appendTo($('.mCSB_container'));
				$("<div class='timestamp-right'>" + timeStamp + "</div>").appendTo($(".message[data-msgid='"+msg.msgId+"']"));
			} else{
				if(msg.recipients[0].recipientType=='1'){
					$("<div class='message' data-msgid='"+msg.msgId+"'><figure class='avatar'><img src='/myvet/upload"+msg.recipients[0].hosFilePath+"/"+msg.recipients[0].hosSysName+"' /></figure>" + msg.msgBody + "</div>").appendTo($('.mCSB_container'));											
				} else{					
					$("<div class='message' data-msgid='"+msg.msgId+"'><figure class='avatar'><img src='/myvet/upload"+msg.recipients[0].memberFilePath+"/"+msg.recipients[0].memberSysName+"' /></figure>" + msg.msgBody + "</div>").appendTo($('.mCSB_container'));					
				}
				$("<div class='sender-nickname'>"+senderNickname+"</div><div class='timestamp-left'>" + timeStamp + "</div>").appendTo($(".message[data-msgid='"+msg.msgId+"']"));
			}
			
		}
		updateMsgScrollBar();
		$(".messages").on("mouseenter", ".message", function(){
//			console.log("대화풍선 마우스 올라감");
//			console.log($(".messages .message .timestamp-left, .timestamp-right"));
			$(".messages .message .timestamp-left, .timestamp-right").show();
		});
		$(".messages").on("mouseleave", ".message", function(){
//			console.log("대화풍선 마우스 올라감");
//			console.log($(".messages .message .timestamp-left, .timestamp-right"));
			$(".messages .message .timestamp-left, .timestamp-right").hide();
		});
	});
}




/* 불필요 */

/* Test용 자동 대답봇 */
var Fake = [
'Hi there, I\'m Jesse and you?',
'Nice to meet you',
'How are you?',
'Not too bad, thanks',
'What do you do?',
'That\'s awesome',
'Codepen is a nice place to stay',
'I think you\'re a nice person',
'Why do you think that?',
'Can you explain?',
'Anyway I\'ve gotta go now',
'It was a pleasure chat with you',
'Time to make a new codepen',
'Bye',
':)'
]

function fakeMessage() {
if ($('#msgtextarea').val() != '') {
return false;
}
$('<div class="message loading new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg" /></figure><span></span></div>').appendTo($('.mCSB_container'));
updateMsgScrollBar();

setTimeout(function() {
$('.message.loading').remove();
$('<div class="message new"><figure class="avatar"><img src="http://askavenue.com/img/17.jpg" /></figure>' + Fake[i] + '</div>').appendTo($('.mCSB_container')).addClass('new');
setDate();
updateMsgScrollBar();
i++;
}, 1000 + (Math.random() * 20) * 100);

}

// 메세지 보낸시간 보여주기 
$(".main-panel").on("mouseenter",".message", function(){
	$(this).children(".timestamp").toggleClass("nodisplay");
})
// 메세지 보낸시간 가리기 
$(".main-panel").on("mouseleave",".message", function(){
	$(this).children(".timestamp").toggleClass("nodisplay");
})
</script>
</body>
</html>