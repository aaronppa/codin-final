<!-- 


사용 안함!!!!!!!!!!!!!!!!!!!!!!!!


 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 찾기 페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<style>
	#find-email-container {
		width: 300px;
		margin: auto;
		margin-top: 18%;
	}
</style>
</head>
<body>
<!-- 이메일 찾기 폼 -->
	<div id="find-email-container">
		<form method="post" action="findEmail.do">
			<div class="input-group email">
			    <div class="input-group-prepend">
			        <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
			    </div>
			    <input type="text" class="form-control" placeholder="Name" name="memberName" />                       
			</div>
		    <br>                       
			<div class="input-group password">
			    <div class="input-group-prepend">
			        <span class="input-group-text" id="basic-addon2">&nbsp;<i class="fas fa-mobile-alt"></i></span>
			    </div>
			    <input type="text" class="form-control" placeholder="Phone" name="memberPhone" />
			</div>
			<br>
			<button type="reset" class="btn btn-outline-secondary offset-md-7">cancel</button>
			<button type="submit" class="btn btn-outline-success">OK</button>
		</form>
	</div>
</body>
</html>