<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/admin/notice.css'/>" />
<c:if test="${detail.tempSave==0 }">
	<title>Admin - 공지사항 - ${detail.noticeNo }</title>
</c:if>
<c:if test="${detail.tempSave==1 }">
	<title>Admin - 공지사항 임시저장 수정 - ${detail.noticeNo }</title>
</c:if>
<style>
.container {
	margin: auto;
}

.scroll-container{
	width: 892px;
    padding: 0 50px 0 50px;
    margin: auto;
    height: 490px;
    overflow-y: auto;
}


table>thead>tr>th {
	font-size: 20px;
	height: 30;
}

table>thead>tr>td {
	background-color: #a56e50;
	font-size: 12px;
	height: 15px;
	padding: 0px;
}

.empty {
	width: 50%;
}

button, input, optgroup, select, textarea {
	font-family: sans-serif;
	/* 1 */
	font-size: 100%;
	/* 1 */
	line-height: 1.15;
	/* 1 */
	margin: 0;
	/* 2 */
}

button, select {
	/* 1 */
	text-transform: none;
}

/**
     * 1. Prevent a WebKit bug where (2) destroys native `audio` and `video`
     *    controls in Android 4.
     * 2. Correct the inability to style clickable types in iOS and Safari.
     */
button, html [type="button"], [type="reset"], [type="submit"] {
	-webkit-appearance: button;
	/* 2 */
}

button, [type="button"], [type="reset"], [type="submit"] {
	/**
       * Remove the inner border and padding in Firefox.
       */
	/**
       * Restore the focus styles unset by the previous rule.
       */
	
}

button::-moz-focus-inner, [type="button"]::-moz-focus-inner, [type="reset"]::-moz-focus-inner,
	[type="submit"]::-moz-focus-inner {
	border-style: none;
	padding: 0;
}

button:-moz-focusring, [type="button"]:-moz-focusring, [type="reset"]:-moz-focusring,
	[type="submit"]:-moz-focusring {
	outline: 1px dotted ButtonText;
}

/**
     * Show the overflow in Edge.
     */
input {
	overflow: visible;
}

input#noticeTitle {
	width: 400px;
}

.btnarea {
	position: fixed;
	left: 400px;
	bottom: 28px;
    margin: 30px auto auto auto;
    margin-top: 20px;
    text-align: center;
    height: auto;
    width: 200px;
}

#save {
	background-color: #a56e50;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	width: 30px;
	height: 20px;
	text-align: center;
	margin: 0 20px;
}

#publish {
	background-color: #8b787a;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	width: 30px;
	height: 20px;
	text-align: center;
	margin: 0 20px;
}

#edit {
	background-color: #8b787a;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	width: 30px;
	height: 20px;
	text-align: center;
	margin: 0 20px;
}

#close-window {
	background-color: #a56e50;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	width: 30px;
	height: 20px;
	text-align: center;
	margin: 0 20px;
}
</style>


</head>
<body>
	<div class="main container">
	<c:choose>
		<c:when test="${detail.tempSave==0}">
			<div class="scroll-container">
				<h3>공지사항 상세 - ${detail.noticeNo }</h3>
				<table>
					<thead>
						<tr>
							<th colspan="5">${detail.noticeTitle }</th>
						</tr>
						<tr>
							<td class="empty"></td>
							<td>글 번호 : ${detail.noticeNo}</td>
							<td>작성자 : ${detail.member.memberNickname }</td>
							<td>작성일 : <fmt:formatDate value="${detail.noticeRegDate}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td>조회수 : ${detail.noticeViewCnt}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="content" colspan="5">${detail.noticeContent}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btnarea">
				<a class="button edit" id="edit" href="#">수정</a> <a
					class="button close-window" id="close-window" href="#">닫기</a>
			</div>
		</c:when>
		<c:when test="${detail.tempSave=='1'}">
			<div class="scroll-container">
				<h2>공지사항 임시저장 수정 - ${detail.noticeNo }</h2>
				<form action="<c:url value='/admin/write.do'/>" method="post">
					<input type="hidden" id="noticeNo" name="noticeNo"
						value="${detail.noticeNo}"> <input type="hidden"
						id="noticeWriter" name="noticeWriter"
						value="${detail.noticeWriter }">
					<table>
						<tr>
							<td>작성자:</td>
							<td><input type="text" id="memberNickname"
								name="memberNickname" value="${detail.member.memberNickname }"
								readonly></td>
						</tr>
						<tr>
							<td>공지글 제목:</td>
							<td><input type="text" id="noticeTitle" name="noticeTitle"
								value="${detail.noticeTitle }" required></td>
						</tr>
					</table>
					<input type="hidden" id="noticeContent" name="noticeContent">
					<div id="summernote"></div>
				</form>
			</div>
			<div class="btnarea">
				<a class="button save" id="save" href="#">임시저장</a> 
				<a class="button publish" id="publish" href="#">게시</a>
			</div>
		</c:when>
	</c:choose>
	</div>
<!-- 수정용 Summernote -->
<script>

  $('#summernote').summernote({
  toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold', 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']]
	  ],
    tabsize: 2,
    height: 250
  });

  $(".note-editable").html(`<c:out value="${detail.noticeContent}" escapeXml="false" />`)
</script>


	<script>
/* ESC 버튼 Keydown시 창 닫힘 */
$(document).keydown(function(e) {
    // ESCAPE key pressed
    if (e.key == 'Escape') {
    	console.log( 'escape pressed' );
        window.close();
    };
});

$(".close-window").click(function(e){
	e.preventDefault();
	window.close();
})

$("#publish").on("click", function(e){
	e.preventDefault();
	var post_url = $("form").attr("action");
	var content = $(".note-editable").html();
	$("#noticeContent").val(content);
	var data = $("form").serialize()
	console.log(data);
	
 $.post(post_url, data, function(){
	})
	.done(function(){
	alert("공지글이 작성되었습니다.");
	opener.parent.location.reload();
	window.close();
	});
});

$("#save").on("click", function(e){
	e.preventDefault();
	var post_url = $("form").attr("action");
	var content = $(".note-editable").html();
	$("#noticeContent").val(content);
	var data = $("form").serialize()
	console.log(data);
	
 $.post("<c:url value='/admin/save.do'/>", data, function(){
	})
	.done(function(){
	alert("작성중인 공지글이 임시저장되었습니다.");
	opener.parent.location.reload();
	window.close();
	});
});

$("#edit").on("click", function(e){
	e.preventDefault();
	var itemNo = $("#itemNo").val();
	var title = $("#title").val();	
	var memberNo = $("#memberNo").val();
	var memberNickname = $("#memberNickname").val();
	var content = $("#content").val();
	
	console.log(itemNo, title, memberNo, memberNickname, content);
	
	var editHtml = `<div class='scroll-container'>
					<h2>공지사항 수정</h2>
					<form action='<c:url value='/admin/write.do'/>' method='post'>
						<input type='hidden' id='noticeNo' name='noticeNo'
							value='${detail.noticeNo }'> <input type='hidden'
							id='noticeWriter' name='noticeWriter'
							value='${detail.noticeWriter }'>
						<table>
							<tr>
								<td>작성자:</td>
								<td><input type='text' id='memberNickname'
									name='memberNickname' value='${detail.member.memberNickname }'
									readonly></td>
							</tr>
							<tr>
								<td>공지글 제목:</td>
								<td><input type='text' id='noticeTitle' name='noticeTitle'
									value='${detail.noticeTitle }' required></td>
							</tr>
						</table>
						<input type='hidden' id='noticeContent' name='noticeContent'>
						<div id='summernote'></div>
					</form>
				</div>
				<div class='btnarea'>
					<a class='button save' id='save' href='#'>임시저장</a> 
					<a class='button publish' id='publish' href='#'>게시</a>
				</div>`;
	
	$(".main.container").html(editHtml);
	
	
	  $('#summernote').summernote({
		  toolbar: [
			    // [groupName, [list of button]]
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			  ],
		    tabsize: 2,
		    height: 250
		  });
	  
	  $(".note-editable").html(`<c:out value="${detail.noticeContent}" escapeXml="false" />`)
	  
	  $("#publish").on("click", function(e){
			e.preventDefault();
			var post_url = $("form").attr("action");
			var content = $(".note-editable").html();
			$("#noticeContent").val(content);
			var data = $("form").serialize()
			console.log(data);
			
		 $.post(post_url, data, function(){
			})
			.done(function(){
			alert("공지글이 작성되었습니다.");
			opener.parent.location.reload();
			window.close();
			});
		});

		$("#save").on("click", function(e){
			e.preventDefault();
			var post_url = $("form").attr("action");
			var content = $(".note-editable").html();
			$("#noticeContent").val(content);
			var data = $("form").serialize()
			console.log(data);
			
		 $.post("<c:url value='/admin/save.do'/>", data, function(){
			})
			.done(function(){
			alert("작성중인 공지글이 임시저장되었습니다.");
			opener.parent.location.reload();
			window.close();
			});
		});
});
</script>
</body>
</html>