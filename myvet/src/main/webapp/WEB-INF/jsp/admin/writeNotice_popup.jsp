<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>공지사항 작성 Form</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<script
src="https://code.jquery.com/jquery-3.3.1.js"
integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
/* Set dropdown font-families */
  
#toolbar-container .ql-font span[data-label="Sans Serif"]::before {
    font-family: "Sans Serif";
  }
  
  #toolbar-container .ql-font span[data-label="Inconsolata"]::before {
    font-family: "Inconsolata";
  }
  
  #toolbar-container .ql-font span[data-label="Roboto"]::before {
    font-family: "Roboto";
  }
  
  #toolbar-container .ql-font span[data-label="Mirza"]::before {
    font-family: "Mirza";
  }
  
  #toolbar-container .ql-font span[data-label="Arial"]::before {
    font-family: "Arial";
  }
  /* Set content font-families */
  
  .ql-font-inconsolata {
    font-family: "Inconsolata";
  }
  
  .ql-font-roboto {
    font-family: "Roboto";
  }
  
  .ql-font-mirza {
    font-family: "Mirza";
  }
  
  .ql-font-arial {
    font-family: "Arial";
    }

input#title{
    width: 400px;
}

</style>
<body>
    <h2>공지사항 작성</h2>
    <div>
        <form>
            <input type="hidden" id="notice_writer" name="memberNo">
            <table>
            <tr><td>작성자:</td><td><input type="text" id="writer_nickname" name="memberNickname" readonly></td></tr>
            <tr><td>공지글 제목:</td><td><input type="text" id="title" name="title"></td></tr>
            </table>
            <input type="hidden" id="content" name="content">
            <div id="standalone-container">
                <div id="toolbar-container">
                    <span class="ql-formats">å
                    <select class="ql-font">
                        <option selected>Sans Serif</option>
                        <option value="inconsolata">Inconsolata</option>
                        <option value="roboto">Roboto</option>
                        <option value="mirza">Mirza</option>
                        <option value="arial">Arial</option>
                    </select>
                    <select class="ql-size"></select>
                    </span>
                    <span class="ql-formats">
                        <select class="ql-header">
                            <option class="ql-header" value="1">H1</option>
                            <option class="ql-header" value="2">H2</option>
                            <option class="ql-header" value="3">H3</option>
                            <option class="ql-header" value="4">H4</option>
                            <option class="ql-header" value="5">H5</option>
                            <option class="ql-header" value="6">H6</option>
                        </select>
                    </span>
                    <span class="ql-formats">
                    <button class="ql-bold"></button>
                    <button class="ql-italic"></button>
                    <button class="ql-underline"></button>
                    <button class="ql-strike"></button>
                    </span>
                    <span class="ql-formats">
                    <select class="ql-color"></select>
                    <select class="ql-background"></select>
                    </span>
                    <span class="ql-formats">
                    <button class="ql-blockquote"></button>
                    <button class="ql-code-block"></button>
                    <button class="ql-link"></button>
                    </span>
                    <span class="ql-formats">
                    <select class="ql-align"></select>
                    <button class="ql-list" value="ordered"></button>
                    <button class="ql-list" value="bullet"></button>
                    <button class="ql-indent" value="-1"></button>
                    <button class="ql-indent" value="+1"></button>
                    <button class="ql-direction" value="rtl"></button>
                    </span>
                    <span class="ql-formats">
                    <button class="ql-script" value="sub"></button>
                    <button class="ql-script" value="super"></button>
                    </span>
                    <span class="ql-formats">
                    <button class="ql-clean"></button>
                    </span>
                </div>
            </div>
            <div id="editor-container">
            </div>
            <button class="btn btn-primary" id="save">임시저장</button>
            <button class="btn btn-primary" id="publish">게시</button>
        </form>
    </div>

<script>
// Add fonts to whitelist
var Font = Quill.import('formats/font');
// We do not add Sans Serif since it is the default
Font.whitelist = ['inconsolata', 'roboto', 'mirza', 'arial'];
Quill.register(Font, true);

var quill = new Quill('#editor-container', {
  modules: {
    toolbar: '#toolbar-container'
  },
  placeholder: '공지글을 작성해주세요.',
  theme: 'snow'
});

var form = document.querySelector('form');

$("button#save").on("click",function() {
  // Populate hidden form on submit
  var content = document.querySelector('input#content');
  content.value = JSON.stringify(quill.getContents());
  
  console.log("Submitted", $(form).serialize(), $(form).serializeArray());
  
  // No back end to actually submit to!
  alert('Open the console to see the saved data!')
  return false;
});

$("button#publish").on("click",function() {
  // Populate hidden form on submit
  var content = document.querySelector('input#content');
  content.value = JSON.stringify(quill.getContents());
  
  console.log("Submitted", $(form).serialize(), $(form).serializeArray());
  
  // No back end to actually submit to!
  alert('Open the console to see the publish data!')
  return false;
});
</script>
</body>
</html>