<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>공지사항 작성 Form</title>
</head>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<style>
button,
input,
optgroup,
select,
textarea {
  font-family: sans-serif;
  /* 1 */
  font-size: 100%;
  /* 1 */
  line-height: 1.15;
  /* 1 */
  margin: 0;
  /* 2 */ }

button,
select {
  /* 1 */
  text-transform: none; }

/**
     * 1. Prevent a WebKit bug where (2) destroys native `audio` and `video`
     *    controls in Android 4.
     * 2. Correct the inability to style clickable types in iOS and Safari.
     */
button,
html [type="button"],
[type="reset"],
[type="submit"] {
  -webkit-appearance: button;
  /* 2 */ }

button,
[type="button"],
[type="reset"],
[type="submit"] {
  /**
       * Remove the inner border and padding in Firefox.
       */
  /**
       * Restore the focus styles unset by the previous rule.
       */ }
  button::-moz-focus-inner,
  [type="button"]::-moz-focus-inner,
  [type="reset"]::-moz-focus-inner,
  [type="submit"]::-moz-focus-inner {
    border-style: none;
    padding: 0; }
  button:-moz-focusring,
  [type="button"]:-moz-focusring,
  [type="reset"]:-moz-focusring,
  [type="submit"]:-moz-focusring {
    outline: 1px dotted ButtonText; }

/**
     * Show the overflow in Edge.
     */
input {
  overflow: visible; }

input#noticeTitle{
    width: 400px;
}

.btnarea{
	margin: auto;
	width: 170px;
}

#save{
margin-top: 1.5em;
    margin-left: 20px;
    border-radius: 5px;
    padding: 5px;
    background-color: #8b787a;
    color: #f5e9c3;
    cursor: pointer;
  }

#publish{
    margin-top: 1.5em;
    margin-left: 20px;
    border-radius: 5px;
    padding: 5px;
    background-color: #a56e50;
    color: #f5e9c3;
    cursor: pointer;
  }

</style>
<body>
    <div class="container">
    <h2>공지사항 작성</h2>
        <form action="<c:url value='/admin/write.do'/>" method="post">
            <input type="hidden" id="noticeWriter" name="noticeWriter" value="3">
            <table>
            <tr><td>작성자:</td><td><input type="text" id="memberNickname" name="memberNickname" value="관리자" readonly></td></tr>
            <tr><td>공지글 제목:</td><td><input type="text" id="noticeTitle" name="noticeTitle" required></td></tr>
            </table>
            <input type="hidden" id="noticeContent" name="noticeContent">
            <div id="summernote"></div>
            <div class="btnarea">
            <input type="button" id="save" value="임시저장">
            <input type="submit" id="publish" value="게시">
            </div>
        </form>
    </div>

<!-- Summernote -->
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
    placeholder: '공지 게시글 작성',
    tabsize: 2,
    height: 300
  });
</script>
<!-- Button Action -->
<script>
/* ESC 버튼 Keydown시 창 닫힘 */
$(document).keydown(function(e) {
    // ESCAPE key pressed
    if (e.key == 'Escape') {
    	console.log( 'escape pressed' );
        window.close();
    };
});

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
	window.close();
	});
});
</script>

</body>
</html>