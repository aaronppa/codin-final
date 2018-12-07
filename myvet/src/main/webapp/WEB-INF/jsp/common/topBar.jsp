<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
    
       	#topBarBody{
    		margin: 0px;
    	}
    
        .top-bar {
            height: 80px;
        }

        .menu > li > a {
            margin-top: 10px;
            color: #412427;
        }

        .menu-text > span {
            font-size: 30px;
            color: #412427;
        }
        
        #grade {
            margin-left: 100px;
            /* text-align: center; */
        }
        
        .custom-file-input {
        	opacity: 1;
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

    <div class="top-bar">
        <div class="top-bar-left">
            <ul class="dropdown menu" data-dropdown-menu>
                <li class="menu-text"><span>MyVet</span></li>
                <li><a href="<c:url value='/hos/search.do'/>">동물병원 찾기</a></li>
                <li>
                    <a href="#">커뮤니티</a>
                    <ul class="menu vertical">
	                    <li><a href="<c:url value='/tip/list.do'/>">개꿀팁이냥</a></li>
	                    <li><a href="#">5959 내시끼</a></li>
	                    <li><a href="<c:url value='/qna/list.do'/>">QnA 게시판</a></li>
	                    <li><a href="<c:url value='/notice/list.do'/>">공지사항</a></li>
                    </ul>
                </li>
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
					                	<a href="<c:url value='/admin/main.do'/>">관리자</a>
					                	<ul class="menu vertical">
											<li><a href="<c:url value='/member/myPage.do'/>">마이페이지</a></li>
											<li><a href="<c:url value='/msg/main.do'/>">메신저</a></li>
                							<li><a href="#">즐겨찾는 병원</a></li>
											<li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
										</ul>
					                </li>
			                	</c:when>
			                	<c:otherwise>
					                <li>
						                <a href="#">${user.memberNickname}</a>                	
										<ul class="menu vertical">
											<li><a href="<c:url value='/member/myPage.do'/>">마이페이지</a></li>
											<li><a href="<c:url value='/msg/main.do'/>">메신저</a></li>
                							<li><a href="#">즐겨찾는 병원</a></li>
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
                <form method="post" action="/myvet/member/login.do">
	                <div class="modal-body">
	                        <div class="input-group email">
	                            <div class="input-group-prepend">
	                                <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
	                            </div>
	                            <input type="email" class="form-control" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" />                       
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
	                    <button type="submit" class="btn btn-outline-success">OK</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- signupModal -->
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="/myvet/member/signup.do" method="post" enctype="multipart/form-data">
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
                            <input type="email" class="form-control" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" id="email" />
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="EmailCheck"><i class="fas fa-user-check"></i></button>
                            </div>                          
                        </div>
                        <span id="checkEmail"><br></span>
                        <div class="input-group password">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password-first" placeholder="password" name="password" aria-label="Password" />
                        </div>
                        <br>
                        <div class="input-group password">           
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password-second" placeholder="password" aria-label="Password" />
                        </div>
                        <span id="checkPassword"><br></span>
                        <div class="btn-group btn-group-toggle" id="grade" data-toggle="buttons">
                            <label class="btn btn-outline-primary btn-lg active">
                                <input type="radio" name="memberGrade" id="option1" onchange="viewHideFile(1);" autocomplete="off" value="U" checked> 반려인
                            </label>
                            <label class="btn btn-outline-primary btn-lg">
                                <input type="radio" name="memberGrade" id="option2" onchange="viewHideFile(2);" autocomplete="off" value="U"> 관계자
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
                            <input type="text" class="form-control" placeholder="이름" name="memberName" aria-label="name" />                   
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
                            	   onkeydown="return onlyNumber(event)" onkeyup="removeChar(event)" style='ime-mode:disabled;' />
                        </div>
                        <br>
                        <div class="input-group file" id="input-file">
							<div class="input-group-prepend">
								<span class="input-group-text">&nbsp;<i class="fas fa-file-image"></i></span>
							</div>
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
									   name="fileV">
								<label class="custom-file-label" for="inputGroupFile01"><span id="fileName"></span></label>
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
        $(document).foundation();
        
        $("#input-file").hide();
    	var emailCheck = 0;
    	
    	$("#EmailCheck").click(function () {
    		var memberEmail = $("#email").val();
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
    				$("#email").focus();
    			} else {
    				$("#checkEmail").html("<p style='color:blue;'>사용가능한 이메일입니다.</p>");
    				$("#formSubmit").prop("disabled", false);
    				$("#password-first").focus();
    				emailCheck = 1;
    			}
    		});
    	});
    	
    	$("#formSubmit").click(function (e) {
    		if (emailCheck != 1){
    			e.preventDefault();
    			alert("이메일 중복 체크를 해주세요.")
    		} else {
    			alert("회원가입을 축하합니다.")
    		}
    	});
    	
    	$("#password-second").keyup(function (e) {
    		console.dir($("#password-first").val()==$("#password-second").val());
    		if ($("#password-first").val()==$("#password-second").val()) {
    			$("#formSubmit").prop("disabled", false);
    			$("#checkPassword").html("<p style='color:blue;'>비밀번호가 일치합니다.</p>");
    		} else {
    			$("#formSubmit").prop("disabled", true);
    			$("#checkPassword").html("<p style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
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
				return;
			}
			$("#input-file").show();
		}
    </script>
</body>
</html>