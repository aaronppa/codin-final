<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script>

<link rel="stylesheet"
	href="<c:url value='/resources/js/waitme/waitMe.css'/>" />
<link rel="stylesheet"
	href="https://malihu.github.io/custom-scrollbar/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/css/msg/small-chat-responsive.css'/>" />
<style>
body {
	margin: 0;
}

.main-container {
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

.profile {
	height: inherit;
	width: 64px;
	padding: 7px;
}

.chat-info {
	height: inherit;
	width: 204px;
	padding-top: 10px;
}

li>.chatroom>.chat-info>.recipient, .lastmsg.brief {
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
	line-height: 10px;
}

.messages-content {
	overflow-y: auto;
	height: 518px;
}

.recipients-input>div:first-child {
	line-height: 32px;
	width: 52px;
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
	/* border-style: none; */
	border-color: black;
	overflow: hidden;
	box-sizing: border-box;
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
					<li class='conversation-chatroom' data-chatid='32'>
				        <div class='chatroom'>
					       	<div class='profile'>
					       		<img src="<c:url value='/resources/img/test_image/test4.jpg'/>" class="rounded-circle">
					       	</div>
					       	<div class='chat-info'>
					       		<div class='recipient new'>
					       		원래 있는 메세지 
					       		</div>
					       		<div class='lastmsg brief'>
					       		</div>
					   		</div>
					   		<div class="close-chat nodisplay">
					   		x
					   		</div>
				   		</div>
			   		</li>
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
	
	<form action="/myvet/msg/insert.do" id="msgform">
		
	</form>
	<script>

/* Write Button Action */
/* 신규메세지 버튼 한번만 작동시키기 위한 스위치 */
var newMsgSwitch = false;

$("#writemsgbtn").on("click", function(){
	if(newMsgSwitch===false){
		$(".messages-content").html("");
		$messages.mCustomScrollbar();
		var chatRoomHtml = `<li class='conversation-chatroom new' data-chatid=0>
						        <div class='chatroom active'>
							       	<div class='profile'>
							       		<img src="<c:url value='/resources/img/test_image/test4.jpg'/>" class="rounded-circle">
							       	</div>
							       	<div class='chat-info'>
							       		<div class='recipient new'>
							       		신규: 
							       		</div>
							       		<div class='lastmsg brief'>
							       		</div>
							   		</div>
							   		<div class="close-chat nodisplay">
							   		x
							   		</div>
						   		</div>
					   		</li>`;
		$("#chatroomlist").prepend(chatRoomHtml);
		
		var recipientInputHtml = ` <div class="recipients-input">
							        	<div>수신자:&nbsp;</div>
							        	<div class='recipient new'>
							       	 	</div>
							        	<input autocomplete="off" id="recipientSearch" class="recipient" placeholder="수신자 닉네임 또는 수신단체명을 입력해주세요" spellcheck="false" type="text">
							        </div>`;
		
		$(".top-main.header").html(recipientInputHtml);
		$("#send").attr("data-chatid",0);
		newMsgSwitch = true;
	};
});


/* 수신자 검색 */
$(".top-main.header").on("focus click keyup","#recipientSearch", function(e){
	$(".recipientSearchLayer.nodisplay").removeClass("nodisplay");
	var searchBoxPosition = this.getBoundingClientRect();
	console.log(searchBoxPosition);
	$(".recipientSearchLayer").css({'left' : searchBoxPosition.left, 'top' : searchBoxPosition.bottom,'border-style' : 'none'});
	
	var keyword = $(this).val();
	console.log("Recipient Search Input Keyup this:",keyword);
	
	// 검색 키워드에 아무 value가 없으면 아무것도 보이지 않음
	// 검색 키워드에 value가 없는 상태에서 Backspace 키 누르면 수신자로 등록되어있는 수신자 삭제 
	// 현재 최초 keyup으로 입력후 한자리 글자 남았을때 Backspace누르면 직전에 등록된 수신자 삭제됨. 
	if(!keyword){
		$(".recipientSearchBox").html("");
		return false;
	};
	
	$.get("searchMember.do?keyword="+keyword)
	.done(function(result){
			console.log("Msg Search:",result);
		var searchResultHtml="";
		
		// 검색 결과 없을 시 
		if(result.member.length==0 && result.hospital.length==0){
			console.log("검색결과가 없음.")
			$(".recipientSearchBox").text("검색결과가 없습니다.");
			$(".recipientSearchLayer").css('border-style', 'outset');
			return false;
		}
		
		// 수신자 중복 검색 결과에서 제거 하기 위한 작업 
		// 등록된 수진사는 span 태그 내의 모든 데이터를 배열에 담아 검색결과와 대조 
		// 중복확인시 검색결과의 객체의 배열에서 splice로 제거 
		var addedRecipientList = document.querySelectorAll('.top-main.header > .recipients-input > .recipient.new > span.addedRecipient');
			console.log("addedRecipientList:", addedRecipientList);
		var recipientResultList = result;
			console.log("recipientResultList:", recipientResultList);
		if(addedRecipientList.length){
			for(var i=0;i<=addedRecipientList.length-1;i++){
				if(addedRecipientList[i].dataset.recipientno){
					for(var j=0; j<=recipientResultList.member.length-1;j++){	
						if(recipientResultList.member[j].memberNo==addedRecipientList[i].dataset.recipientno){
							recipientResultList.member.splice(j, 1);
							console.log("recipient removed");
						};
					};
						
				} else if(addedRecipientList[i].dataset.hosno){
					for(var j=0; j<=recipientResultList.hospital.length-1;j++){
						if(recipientResultList.hospital[j].hosCode==addedRecipientList[i].dataset.hosno){
							recipientResultList.hospital.splice(j, 1);
							console.log("hospitcal removed");
						};
					};
				};
					console.log("removed element of result");
					console.log(result);
			};
			
		};
		
		// 수신자가 일반회원인 경우 겸색결과 필터 
		if(result.member.length){
			
			searchResultHtml+=`<div class="recipientResultType member"><span>회원</span></div><ul class="recipientSearchList member">`;
			
			for(var member of result.member){
				var imgPath;
				if(member.memberFilePath==null){
					imgPath = "<c:url value='/upload/profile/default-profile.jpg'/>";
				} else if(member.memberFilePath!=null){
					imgPath = "<c:url value='/upload/profile/"+member.memberFilePath+"/"+member.memberSystem+"'/>";
				}
				
				searchResultHtml += `<li>
					                    <div class="resultList" data-recipientno=`+member.memberNo+` data-hosno='' data-recipientname=`+member.memberNickname+`>
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
		if(result.hospital.length){
			searchResultHtml+=`<div class="recipientResultType hospital"><span>병원</span></div><ul class="recipientSearchList hospital">`;
			
			for(var hospital of result.hospital){
				
				// 프로필 이미지 주소 동적 처리 (없으면 Default 이미지)
				var imgPath;
				if(hospital.filePath==null){
					imgPath = "<c:url value='/upload/profile/Logo-Vet-02.png'/>";
				} else if(hospital.filePath!=null){
					imgPath = "<c:url value='/upload/profile/"+hospital.filePath+"/"+hospital.sysName+"'/>";
				}
				
				searchResultHtml += `<li>
					                    <div class="resultList" data-recipientno="" data-hosno=`+hospital.hosCode+` data-recipientname="`+hospital.title+`">
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
	console.log("Search Result Select:", $(this));
	
	/* 두번째 수신자부터 콤마찍어주기 (앞 span에 , 추가하기) */
	if($("li.conversation-chatroom.new").find(".recipient.new > span").length!=0){
		var lastRecipient = $("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname");
		/* console.log("Last Recipient:", lastRecipient); */
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html(lastRecipient+", ");		
	} 
	$("div.recipient.new").append("<span class='addedRecipient' data-recipientno='"+$(this).data("recipientno")+"' data-hosno='"+$(this).data("hosno")+"' data-recipientname='"+$(this).data("recipientname")+"'>"+$(this).data("recipientname")+"</span>");
	$("#recipientSearch").val("");
	$(".recipientSearchBox").html("");
	$("#recipientSearch").focus();
});


/* 검색중 다른곳으로 blur하면 검색결과 div 숨기기 */
$(".top-main.header").on("blur","#recipientSearch", function() {
	 setTimeout(function(){
		 $(".recipientSearchLayer").addClass("nodisplay")
	 }, 150)
});


/* 선택된 수신자 마우스 올릴때 삭제 표시 */
var spanText;
$(".top-main.header").on("mouseenter", "span", function(e){
	spanText = $(this).html();
	$(this).html(spanText+" x");
});


/* 선택된 수신자 마우스 내릴때 삭제 표시 제거 */
$(".top-main.header").on("mouseleave", "span", function(e){
	$(this).html(spanText);
});


/* 수신자 클릭시 삭제 */
$(".top-main.header").on("click", "span", function(e){
	console.log("clicked:", e.target);
	console.log(e.target.dataset);
	var hosNo = e.target.dataset.hosno;
	var recipientNo = e.target.dataset.recipientno;
	
	/* 일반회원인지 병원인지 따짐 */
	/*  */
	if(!hosNo){
		$("span[data-recipientno='"+recipientNo+"']").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
	}
	if(!recipientNo){
		$("span[data-hosno='"+hosNo+"']").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
	}
}); 

/* 채팅방 나가기 또는 신규작성 취소 */
$("#chatroomlist").on("mouseenter",".chatroom", function(){
	var $closeTarget = $(this)
	console.log("close button",$closeTarget.find(".close-chat"));
	$closeTarget.find(".close-chat.nodisplay").removeClass("nodisplay");
	$(".close-chat").on("click", function(){
		// sweetalert로 삭제 재확인 필요 
		
		// writebtn 다시 활성화 
		newMsgSwitch=false;
		// 대화방 사라짐 
		$closeTarget.parent().remove();
		// 수신자 등록 박스 초기화 
		$(".new > span").remove();
		// ajax로 대화방 수신자 그룹에서 block 처리 
		
	});
})

/* 대화방에서 마우스 나가면 닫기 표시 없어짐 */
$("#chatroomlist").on("mouseleave",".chatroom", function(){
	console.log("close button",$(this).find(".close-chat"));
	$(this).find(".close-chat").addClass("nodisplay");
})

$(".top-main.header").on("keydown","#recipientSearch", function(e){
	if (!$("#recipientSearch").val() && e.key === "Backspace" || e.key === "Delete") {
		console.log("Search Key:",$("#recipientSearch").val());
		console.log("backspaced!");
		$("div.recipient.new > :last-child").remove();
		$("li.conversation-chatroom.new").find(".recipient.new > span:last-child").html($("li.conversation-chatroom.new").find(".recipient.new > span:last-child").data("recipientname"));
	};
});

console.log("bottom position:",document.querySelector(".main-container").getBoundingClientRect());



<!-- Responsive Message Content -->
var $messages = $('.messages-content'), form = $('form#msgform'),
d, h, m, form,
i = 0;

$(window).on("change", function () {
	$messages.mCustomScrollbar();
	
	// 삭제대상 
	/* setTimeout(function() {
	fakeMessage();
	}, 100); */
});

/* 메세지 창 스크롤바 업데이트 */
function updateMsgScrollBar() {
	$messages.mCustomScrollbar("update").mCustomScrollbar('scrollTo', 'bottom', {
		scrollInertia: 10,
		timeout: 0
	});
}

/* 대화방리스트 스크롤바 업데이트 */
function updateMsgScrollBar() {
	$messages.mCustomScrollbar("update").mCustomScrollbar('scrollTo', 'top', {
		scrollInertia: 10,
		timeout: 0
	});
}

function setDate(){
	d = new Date()
	m = d.getMinutes();
	$('<div class="timestamp">' + d.getHours() + ':' + m + '</div>').appendTo($('.message:last'));
	/* $('<div class="checkmark-sent-delivered">&check;</div>').appendTo($('.message:last'));
	$('<div class="checkmark-read">&check;</div>').appendTo($('.message:last')); */
}

/* 메세지 입력 */
function insertMessage() {
	msg = $('#msgtextarea').val();
	
	if ($.trim(msg) == '') {
		return false;
	}
	$("<input type='hidden' name='msgBody' value='" + msg + "'>").appendTo(form);
	var senderNo = ${user.memberNo};
	$("<input type='hidden' name='senderNo' value='" + senderNo + "'>").appendTo(form);
	
	$('<div class="message message-personal">' + msg + '</div>').appendTo($('.mCSB_container')).addClass('new');
	setDate();
	$('#msgtextarea').val(null);
	updateMsgScrollBar();
	
	// 등록된 수신자 배열을 변수에 담는다. 
	var addedRecipientList = document.querySelectorAll('.conversation-chatroom.new span.addedRecipient');
	for(var recipientArr of addedRecipientList){
		console.log("recipientArr");
		// 수신자 타임(일반회원/병원) 별 구분하여 data 심어줌 
		if(!recipientArr.dataset.hosno){
			$("<input type='hidden' name='recipientNo' value='" + recipientArr.dataset.recipientno + "'>").appendTo(form);
			console.log("Member",recipientArr.dataset.recipientno);
			
		} else if(!recipientArr.dataset.recipientno){
			$("<input type='hidden' name='recipientHosNo' value='" + recipientArr.dataset.hosno + "'>").appendTo(form);
			console.log("Hospital",recipientArr.dataset.hosno);
			
		}	
	};
	console.log("MsgFormData:", form.serialize());
	form.submit();
	
	setTimeout(function() {
		fakeMessage();
	}, 1000 + (Math.random() * 20) * 100);

};

$('#send').click(function(e) {
	e.preventDefault();
	sendClick(this);
});

$('#msgtextarea').on('keydown', function(e) {
	if (e.keyCode == 13) {
		sendClick(this);
	return false;
	}
})

function sendClick(item){
	var addedRecipientList = document.querySelectorAll('.conversation-chatroom.new span.addedRecipient');
	if(addedRecipientList.length>0 && $('#msgtextarea').val()){
		$('#send').data("chatid")
		$("<input type='hidden' name='chatId' value='" + $('#send').data("chatid") + "'>").appendTo(form);
		insertMessage();
		console.log("send btn chatid check:", item.dataset.chatid);
		if(item.dataset.chatid==0){
			var topMainHtml = $(".top-main.header .recipient.new");
			console.log("topMainHtml", topMainHtml);
			$(".top-main.header").html(topMainHtml);
		}
	} else if(addedRecipientList.length==0){
		alert("수신자를 입력해주세요.");
		$('#msgtextarea').val(null);
		$("#recipientSearch").focus();
		return false;
	}
	
}

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

$("#chatroomlist").on("click", ".chatroom", function(){
	console.log("toggle");
	$(".chatroom.active").removeClass('active');
	$(this).toggleClass('active');
});
</script>
</body>
</html>