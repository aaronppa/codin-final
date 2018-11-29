<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지입니다.</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <script
	  src="https://code.jquery.com/jquery-3.3.1.js"
	  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	  crossorigin="anonymous"></script>
    <style>
        #grade {
            margin-left: 100px;
            /* text-align: center; */
        }
        .custom-file-input {
        	opacity: 1;
        }
/* 		#input-file { */
/* 			display: none; */
/* 		} */
		#input-file {
/*  			display: none;  */
		}	
    </style>
</head>
<body>
	<!-- Button trigger modal -->
    <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalLong">
        회원가입
    </button>
      
    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form action="signup.do" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">회원가입</h5>
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
                            <input type="password" class="form-control" id="password1" placeholder="password" name="password" aria-label="Password" />
                        </div>
                        <br>
                        <div class="input-group password">           
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password2" placeholder="password" aria-label="Password" />
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
    	$("#input-file").hide();
    	var emailCheck = 0;
    	
    	$("#EmailCheck").click(function () {
    		var memberEmail = $("#email").val();
    		
    		$.ajax({
    			url: "idCheck.do",
    			data: memberEmail,
    			dataType: "json",
    			method: "POST",
    			contentType: "application/json; charset=UTF-8",
    		}).done(function (data) {
//     			console.dir(data)
    			if (data.count > 0){
    				$("#checkEmail").html("<p style='color:red;'>이메일이 존재합니다. 다른 이메일을 입력해주세요.</p>");
    				$("#formSubmit").prop("disabled", true);
    				$("#email").focus();
    			} else {
    				$("#checkEmail").html("<p style='color:blue;'>사용가능한 이메일입니다.</p>");
    				$("#formSubmit").prop("disabled", false);
    				$("#password1").focus();
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
    	
    	$("#password2").keyup(function (e) {
    		console.dir($("#password1").val()==$("#password2").val());
    		if ($("#password1").val()==$("#password2").val()) {
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
//     	document.querySelector("#option2").addEventListener("click", function () {alert(1)});
//     	$("#option2").click(function () { alert(1)})
		
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