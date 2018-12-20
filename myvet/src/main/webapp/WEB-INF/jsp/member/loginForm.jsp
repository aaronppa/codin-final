<!-- 


사용 안함!!!!!!!!!!!!!!!!!!!!!!!!


 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>
	a {
		text-decoration: none;
		color: #dc3545;
	}
	a:hover {
		text-decoration: none;
		color: white;
	}
	#find-email:mouseover {
		color: white;
	}
</style>
</head>
<body>
	<!-- Button trigger modal -->
    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalCenter">
        로그인
    </button>
      
    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">로그인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" action="login.do">
	                <div class="modal-body">
	                        <div class="input-group email">
	                            <div class="input-group-prepend">
	                                <span class="input-group-text" id="basic-addon1"><i class="far fa-envelope"></i></span>
	                            </div>
	                            <input type="email" class="form-control" value="test1@test1.do" placeholder="Email" name="memberEmail" aria-label="Email" aria-describedby="emailHelp" />                       
	                        </div>
	                        <span id="checkEmail"></span>
	                        <br>                       
	                        <div class="input-group password">
	                            <div class="input-group-prepend">
	                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
	                            </div>
	                            <input type="password" value="1q2w3e" class="form-control" id="password1" placeholder="password" name="password" aria-label="Password" />
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
</body>
</html>