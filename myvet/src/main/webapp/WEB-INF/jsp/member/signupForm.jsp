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
    <style>
        #grade {
            margin-left: 100px;
            /* text-align: center; */
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
                <form action="signup.do" method="post">
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
                            <input type="email" class="form-control" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" />
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button" id="button-addon2">메일 인증</button>
                            </div>                          
                        </div>
                        <span id="checkEmail"></span>
                        <br>                       
                        <div class="input-group password">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password1" placeholder="password" name="memberPassword" aria-label="Password" />
                        </div>
                        <br>
                        <div class="input-group password">           
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon3"><i class="fas fa-key"></i></span>
                            </div>
                            <input type="password" class="form-control" id="password2" placeholder="password" aria-label="Password" />
                        </div>
                        <span id="checkPassword"></span>
                        <br>
                        <div class="btn-group btn-group-toggle" id="grade" data-toggle="buttons">
                            <label class="btn btn-outline-primary btn-lg active">
                                <input type="radio" name="memberGrade" id="option1" autocomplete="off" value="U" checked> 반려인
                            </label>
                            <label class="btn btn-outline-primary btn-lg">
                                <input type="radio" name="memberGrade" id="option2" autocomplete="off" value="S"> 관계자
                            </label>
                            <label class="btn btn-outline-primary btn-lg">
                                <input type="radio" name="memberGrade" id="option3" autocomplete="off" value="V"> 수의사
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
                        <div class="input-group phone">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon5">&nbsp;<i class="fas fa-mobile-alt"></i></span>
                            </div>
                            <input type="text" class="form-control" placeholder="연락처" name="memberPhone" aria-label="phone" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">cancel</button>
                        <button type="submit" class="btn btn-outline-primary">OK</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>