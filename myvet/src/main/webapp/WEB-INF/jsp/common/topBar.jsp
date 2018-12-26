<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
    	#logo{
        height: 64px;
        margin-bottom: -17px;
        margin-top: -17px;
    	}
    	
     	body {
    	font-family: 'Gamja Flower', cursive !important;
    	font-size: 20px !important;
    	}
    
       	#topBarBody{
    		margin: 0px;
    	}
    
        .top-bar {
            height: 80px;
        }

        .menu > li > a {
            color: #412427 !important;
            font-weight: normal;
            text-decoration: none;
        }

        .menu > li > a:hover {
			font-weight: bold;
        }

        .menu-text > span > a  {
            font-size: 30px;
            color: #412427;
            font-weight: unset;
            text-decoration: none;
        }
        
        .menu-text.sub{
        	margin-top: 10px;
      
        }
        
        #grade {
            margin-left: 100px;
            /* text-align: center; */
        }
        
        .custom-file-input {
        	opacity: 1;
        }
        
        .is-dropdown-submenu{
        z-index: 1000
        }
        
    .msgbadge span{
    
    }
    </style>
	<link rel="stylesheet" href="<c:url value='../resources/css/common/topbar.css'/>"/>
<!-- <script -->
<!--     src="https://code.jquery.com/jquery-3.3.1.js" -->
<!--     integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" -->
<!--     crossorigin="anonymous"></script> -->
    <script src="<c:url value='../resources/js/vendor/foundation.js'/>"></script>
    <script src="<c:url value='/resources/js/common/config.js'/>"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body id="topBarBody">

    <div class="top-bar" id="topBar">
        <div class="top-bar-left">
            <ul class="dropdown menu" data-dropdown-menu>
                <li class="menu-text"><span><a href="<c:url value='/index.jsp'/>"><img src="/myvet/resources/img/Logo.png" id="logo">MyVet</a></span></li>
                <li class="menu-text sub"><a href="<c:url value='/hos/search.do'/>">동물병원 찾기</a></li>
                 <c:if test="${not empty user}">
                 <input type="hidden" id="memberGrade" value="${user.memberGrade }">
                 <script>
                 		
                 	if ($("#memberGrade").val() == "A") {
                 		$("#topBar").addClass("adminTop");
                 	}
                 	if ($("#memberGrade").val() == "V") {
                 		$("#topBar").addClass("vetTop");
                 	}
                 	if ($("#memberGrade").val() == "U") {
                 		$("#topBar").addClass("userTop");
                 	}
                 </script>
                <li class="menu-text sub">
                    <a href="#">커뮤니티</a>
                    <ul class="menu vertical">
	                    <li><a href="<c:url value='/tip/list.do'/>">개꿀팁이냥</a></li>
	                    <li><a href="<c:url value='/gallery/list.do'/>">5959 내시끼</a></li>
	                    <li><a href="<c:url value='/qna/list.do'/>">QnA 게시판</a></li>
	                    <li><a href="<c:url value='/notice/list.do'/>">공지사항</a></li>
                    </ul>
                </li>
                </c:if>
                <!-- <li><a href="#">Three</a></li> -->
            </ul>
        </div>
        <div class="top-bar-right">
            <ul class="dropdown menu" data-dropdown-menu>
                <c:choose>
                	<c:when test="${empty user}">
		                <li><a href="#" data-toggle="modal" data-target="#signupModal">회원가입</a></li>
		                <li><a id="login" href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
                	</c:when>
                	<c:otherwise>
		                <li>
			                <c:choose>
			                	<c:when test="${user.memberGrade == 'A'}">
					                <li>
					                	<a class="userid msgbadge" href="<c:url value='/admin/main.do'/>">관리자<span class="nbsp">&nbsp;</span><span class='badge badge-dark'></span></a>
					                	
					                	<ul class="menu vertical">
											<li><a href="<c:url value='/member/myPage.do'/>">마이페이지</a></li>
											<li><a class="msgbadge" href="<c:url value='/msg/main.do'/>">메신저<span class="nbsp">&nbsp;</span><span class='badge badge-dark'></span></a></li>
											<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
										</ul>
					                </li>
			                	</c:when>
			                	<c:otherwise>
					                <li>
						                <a class="userid msgbadge" href="#">${user.memberNickname}<span class="nbsp">&nbsp;</span><span class='badge badge-dark'></span></a>                	
										<ul class="menu vertical">
											<li><a href="<c:url value='/member/myPage.do'/>">마이페이지</a></li>
											<li><a class="msgbadge" href="<c:url value='/msg/main.do'/>">메신저<span class="nbsp">&nbsp;</span><span class='badge badge-dark'></span></a></li>
											<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
										</ul>
									</li>
			                	</c:otherwise>
			                </c:choose>
		                </li>
                	</c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    
    <!-- loginModal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalTitle">로그인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" id="loginFormPop">
	                <div class="modal-body">
	                        <div class="input-group email">
	                            <div class="input-group-prepend">
	                                <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
	                            </div>
	                            <input id="email" type="email" class="form-control" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" />                       
	                        </div>
	                        <br>                       
	                        <div class="input-group password">
	                            <div class="input-group-prepend">
	                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
	                            </div>
	                            <input type="password" class="form-control" id="password" placeholder="password" name="password" aria-label="Password" />
	                        </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">cancel</button>
	                    <button type="button" class="btn btn-outline-danger" id="find-email">
	                    	<a href="findEmailForm.do">이메일 찾기</a>
	                    </button>
	                    <button type="button" id="loginBtnPop" class="btn btn-outline-success">OK</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- signupModal -->
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="/myvet/member/signup.do" method="post" enctype="multipart/form-data" id="signupform">
                    <div class="modal-header">
                        <h5 class="modal-title" id="signupModalTitle">회원가입</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group email">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
                            </div>
                            <input type="email" class="form-control" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" id="signupemail" required/>
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="EmailCheck"><i class="fas fa-user-check"></i></button>
                            </div>                          
                        </div>
                        <span id="checkEmail"><br></span>
                        <div class="input-group password">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password-first" placeholder="password" name="password" aria-label="Password" required/>
                        </div>
                        <br>
                        <div class="input-group password">           
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password-second" placeholder="password" aria-label="Password" required/>
                        </div>
                        <span id="checkPassword"><br></span>
                        <div class="btn-group btn-group-toggle" id="grade" data-toggle="buttons">
                            <label class="btn btn-outline-primary btn-lg active">
                                <input type="radio" name="memberGrade" id="option1" onchange="viewHideFile(1);" autocomplete="off" value="U" checked> 반려인
                            </label>
                            <label class="btn btn-outline-primary btn-lg">
                                <input type="radio" name="memberGrade" id="option2" onchange="viewHideFile(2);" autocomplete="off" value="S"> 관계자
                            </label>
                            <label class="btn btn-outline-primary btn-lg">
                                <input type="radio" name="memberGrade" id="option3" onchange="viewHideFile(3);" autocomplete="off" value="P"> 수의사
                            </label>
                        </div>
                        <br>
                        <br>
                        <div class="input-group name">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon4"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="이름" name="memberName" aria-label="name" required/>                   
                        </div>
                        <br>
                        <div class="input-group nickname">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon5"><i class="fas fa-user-tag"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="닉네임" name="memberNickname" aria-label="nickname" />                   
                        </div>
                        <br>
                        <div class="input-group phone">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon6">&nbsp;<i class="fas fa-mobile-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="연락처" name="memberPhone" aria-label="phone"
                            	   onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style='ime-mode:disabled;' required/>
                        </div>
                        <br>
                        <div class="input-group file" id="input-file">
							<div class="input-group-prepend">
								<span class="input-group-text">&nbsp;<i class="fas fa-file-image"></i></span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
									   name="fileV" required>
								<label class="custom-file-label" for="inputGroupFile01"><span id="fileName">인증파일 (이미지포멧)을 등록해주세요.</span></label>
							</div>
						</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">cancel</button>
                        <button type="submit" class="btn btn-outline-primary" id="formSubmit">OK</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<script>
    var me;
    var passwordPass=false;
    vetSignUp = false;
    <c:if test="${ not empty user.memberNo}">
  	 me =${user.memberNo};
    </c:if>
    
        $(document).foundation();
        
        $(function(){
        	updateNewMsg(me);
        	
        	setInterval(function(){updateNewMsg(me)}, 180000);
        });
        
        $("#input-file").hide();
    	var emailCheck = 0;
    	
    	function updateNewMsg(me){
    		if(me){
	        	$.get("/myvet/msg/alertnew.do?memberNo="+me)
	        	.done(function(result){
	        		if(result.NewMsgCnt!=0){
	        		$(".msgbadge span.badge").text(result.NewMsgCnt);
	        		}
	        	});
        	}
        };
        
    	// 로그인 처리
    	$("#loginBtnPop").click(function () {
    		loginSubmit()
    	});
    	
    	
    	$("#password").on("keydown", function(e){
    		if (e.keyCode == 13) {
    			e.preventDefault();
    			console.log("enter pressed to send");
    			loginSubmit();
    		}
    	})
    	
    	$("#EmailCheck").click(function () {
    		var memberEmail = $("#signupemail").val();
//     		alert(memberEmail);

    		$.ajax({
    			url: "<c:url value='/member/idCheck.do'/>",
    			data: memberEmail,
    			dataType: "json",
    			method: "POST",
    			contentType: "application/json; charset=UTF-8",
    		}).done(function (data) {
//     			console.dir(data.count);
    			if (data.count > 0){
    				$("#checkEmail").html("<p style='color:red;'>이메일이 존재합니다. 다른 이메일을 입력해주세요.</p>");
    				$("#formSubmit").prop("disabled", true);
    				$("#signupemail").focus();
    			} else {
    				$("#checkEmail").html("<p style='color:blue;'>사용가능한 이메일입니다.</p>");
    				$("#formSubmit").prop("disabled", false);
    				$("#password-first").focus();
    				emailCheck = 1;
    			}
    		});
    	});
    	
    	$('#inputGroupFile01').on('change',function(){
            //get the file name
            var fileName = document.getElementById("inputGroupFile01").files[0].name; 
            console.log("fileName", fileName);
            //replace the "Choose a file" label
            $('#fileName').text(fileName);
        })
    	
    	$("#formSubmit").click(function (e) {
    		e.preventDefault();
    		signUpDo(e);
     		
    	});
    	
    	$("input[name='memberPhone']").on("keyup", function(e){
    		if(e.keyCode == 13){
    			signUpDo(e);
    		}
    	})
    	
    	function signUpDo(e){
    		if (emailCheck != 1){
    			e.preventDefault();
    			alert("이메일 중복 체크를 해주세요.");
    			return false;
    		} 
    		if(!passwordPass){
    			$("#checkPassword").html("<p style='color:red;'>비밀번호를 입력하지 않았거나 일치하지 않습니다..</p>");
    			return false;
    		}
     		if(!$("input[name='memberName']").val() && !$("input[name='memberNickname']").val() && !$("input[name='memberPhone']").val()){
     			alert("필수사항을 입력 해주세요.");
     			return false;
     		}
     		if(vetSignUp && !$("#inputGroupFile01").val()){
     			alert("수의사 인증 증빙 파일을 업로드 해주세요.");
     		}
    		else {
    			alert("회원가입을 축하합니다.");
    			$("#signupform").submit();
    		}
    	}
    	
    	$("#password-second").keyup(function (e) {
    		console.dir($("#password-first").val()==$("#password-second").val());
    		if ($("#password-first").val()==$("#password-second").val()) {
    			$("#formSubmit").prop("disabled", false);
    			$("#checkPassword").html("<p style='color:blue;'>비밀번호가 일치합니다.</p>");
    			passwordPass = true;
    		} else {
    			$("#formSubmit").prop("disabled", true);
    			$("#checkPassword").html("<p style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
    			passwordPass = true;
    		}
    	});
    	
    	function onlyNumber(event) {
    		event = event || window.event;
    		var keyCode = event.keyCode;
    		
    		if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 8 || keyCode == 46 || keyCode == 37 || keyCode == 39) {
    			return;
    		} else {
    			return false;
    		}
    	}
    	
    	function removeChar(event) {
    		event = event || window.event;
    		var keyCode = event.keyCode;
    		
    		if ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 8 || keyCode == 46 || keyCode == 37 || keyCode == 39) {
    			return;
    		} else {
    			event.target.value = event.target.value.replace(/[^0-9]/g, "");
    		}
    	}
		
		function viewHideFile(radioEleType) {
			if (radioEleType == 1 || radioEleType == 2) {
				$("#input-file").hide();
				vetSignUp = false;
				return;
			}
			$("#input-file").show();
			vetSignUp = true;
		}
		
		function loginSubmit(){
			let memberEmail = $("#email");
    		let password = $("#password");
			console.log("Email and Password:", memberEmail, password);
    		if (!memberEmail.val()) {
    			alert("이메일을 입력하세요");
    			memberEmail.focus();
    			return false;
    		}
    		if (!password.val()) {
    			alert("패스워드를 입력하세요");
    			password.focus();
    			return false;
    		}
    		
    		// 폼의 데이터를 처리할 수 있는 스크립트 객체
    		var fd = new FormData($("#loginFormPop")[0]);
    		$.ajax({
    			url: '<c:url value="/member/loginAjax.do"/>',
    			type: "POST",
    			data: {
    				memberEmail: memberEmail.val(),
    				password: password.val()
    			},
    			success: function (data) {
    				if (data == 'fail') {
    					alert("입력한 정보가 올바르지 않습니다.");
    					password.select();
    					return ;
    				}
    				location.reload();
    			}
    		});
		};
    </script>
</body>
</html>