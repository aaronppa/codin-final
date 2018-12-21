<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수의사 요청 상세 -
	회원번호=${detail.memberNo}/회원닉네임=${detail.memberName}</title>
<script
src="https://code.jquery.com/jquery-3.3.1.js"
integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<script src='<c:url value='/resources/js/sweet/sweetalert2.all.min.js'/>'></script>
<link rel="stylesheet" href='<c:url value='/resources/js/sweet/sweetalert2.min.css'/>'>
<style>
.container {
	width: 800px;
	margin-left: 50px;
}

table{
	margin-left: 30px;
	margin-bottom: 10px;
}

th{
	background: #412427;
	color: #f4e8e6;
}

table *{
	border: 1px solid black;
	text-align: center;
	width: 200px;
}

.imgbox{
	margin: auto;
	margin-top: 20px;
	width: 750px;
	height: auto;
	border: 5px dotted #a56e50;
	padding: 20px;
	overflow: auto;
}
img {
	display: block;
	max-width: 700px;
	margin: auto;
}
img:hover{
	cursor: pointer;
}
.btnarea {
	width: 60px;
    height: auto;
    text-align: center;
    margin: auto;
    margin-top: 30px;
    position: fixed;
    top: 90px;
    left: 900px;
}

.button {
	display: block;
	width: 40px;
}

.button.approve {
	background-color: #a56e50;
	border-radius: 5px;
	color: white;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;

}

.button.reject {
	background-color: #8b787a;
	border-radius: 5px;
	color: white;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

.button.hold {
	background-color: #f5e9c3;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;
}

.button.update {
	background-color: #8b787a;
	border-radius: 5px;
	color: white;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

.button.close {
	background-color: #f4e8e6;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}

.button.cancel {
	background-color: #f4e8e6;
	border-radius: 5px;
	color: black;
	padding: .5em;
	text-decoration: none;
	height: 20px;
	margin: auto;
	margin-top: 70px;
	margin-bottom: 70px;
}
</style>
</head>
<body>
	<div class="container">
		<h3>수의사 요청 상세 -
			회원번호=${detail.memberNo}/회원닉네임=${detail.memberName}</h3>
	<table>
		<tr>
			<th>회원 번호</th>
			<th>회원 상태</th>
			<th>인증 요청 날짜</th>
		</tr>
		<tr>
			<td>${detail.memberNo}</td>
			<c:choose>
				<c:when test = "${detail.memberGrade=='P'}"><td id="status">대기(${detail.memberGrade})</td></c:when>
				<c:when test = "${detail.memberGrade=='H'}"><td id="status">보류(${detail.memberGrade})</td></c:when>
				<c:when test = "${detail.memberGrade=='R'}"><td id="status">반려(${detail.memberGrade})</td></c:when>
				<c:otherwise><td id="status">승인(${detail.memberGrade})</td></c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${detail.vetAuth[0].vetFileRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<th>회원 이름</th>
			<th>회원 계정</th>
			<th>회원 닉네임</th>
			<th>회원 전화번호</th>
		</tr>
		<tr>
			<td>${detail.memberName}</td>
			<td>${detail.memberEmail}</td>
			<td>${detail.memberNickname}</td>
			<td>${detail.memberPhone}</td>
		</tr>
	</table>
	<div class="imgbox">
		<c:forEach var='vetAuth' items="${detail.vetAuth}">
		<a class="authImg" href='/myvet/upload${ vetAuth.vetFilePath}/${vetAuth.vetSysName }' target="_blank">
		<img src='/myvet/upload${ vetAuth.vetFilePath}/${vetAuth.vetSysName }'>
		</a>
		</c:forEach>
	</div>
		<div class="btnarea">
			<c:if test="${detail.memberGrade=='P' or detail.memberGrade=='H'}">
				<a href="<c:url value="/admin/process/${detail.memberNo }.do?approval=V"/>" class="button approve">승인</a>
				<a href="<c:url value="/admin/process/${detail.memberNo }.do?approval=R"/>" class="button reject">반려</a>
				<a href="<c:url value="/admin/process/${detail.memberNo }.do?approval=H"/>" class="button hold">보류</a>
				<a href="#" class="button close">취소</a>
			</c:if>
			<c:if test="${detail.memberGrade=='V' or detail.memberGrade=='R'}">
				<a href="#" class="button update" data-itemno="${detail.memberNo}">수정</a>
				<a href="#" class="button close">취소</a>
			</c:if>

		</div>
	</div>
<script>
/* ESC 버튼 Keydown시 창 닫힘 */
$(document).keydown(function(e) {
    // ESCAPE key pressed
    if (e.key == 'Escape') {
    	console.log( 'escape pressed' );
        window.close();
    };
});

$("a").not(".update, .close, .cancel, .authImg").on("click",(function(e){
	ajaxRequest(e);
}));

$("a.update").click(function(){
	var itemNo = $(this).data("itemno");
	$(".btnarea").html("<a href='/myvet/admin/process/"+itemNo+".do?approval=V' class='button approve'>승인</a>"+
						"<a href='/myvet/admin/process/"+itemNo+".do?approval=R' class='button reject'>반려</a>"+
						"<a href='/myvet/admin/process/"+itemNo+".do?approval=H' class='button hold'>보류</a>"+
						"<a href='#' class='button cancel'>취소</a>");
	
	$("a").not(".update, .close, .cancel").on("click",(function(e){
		ajaxRequest(e);
	}));
	
	$("a.cancel").click(function(){
		location.reload();
	});
	
});

$(".btnarea").on("click", "a.close", function(){
	window.close();
});

function ajaxRequest(e){
	e.preventDefault();
	var hrefUrl = $(e.target).attr('href');
	console.log("AJAX Request GET:",hrefUrl);
	$.get(hrefUrl, function(){
	})
	.done(function(){
		swal({
			  type: 'success',
			  title: 'OK!',
			  text: '작업이 정상적으로 처리되었습니다.'
		}).then((result)=>{
			opener.parent.location.reload();
			location.reload();
		});
	});
};

</script>
</body>
</html>