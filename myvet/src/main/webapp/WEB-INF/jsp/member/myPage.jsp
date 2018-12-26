<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려인의 개인 페이지입니다.</title>
<link rel="stylesheet" href="<c:url value='/resources/css/member/mypage.css'/>" />
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='../resources/css/common/topbar.css'/>"/>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	<div id="background"></div>
	<div id="container" class="container">
		<h2 class="owner">반려인</h2>
	    <hr>
		<form id="memberInfoForm">
		    <div>
		        <table class="table table-bordered">
		            <tr>
		                <td rowspan="4" class="imgTd">
		                    <img id="profile" class="img-thumbnail" src="<c:url value='/upload${member.memberFilePath}/${member.memberSysName}' />"  />
		                    <input type="file" name="file" class="member-mod member--img-hide" />
<!-- 		                    <button type="button" class="btn btn-default member-mod member--img-hide"><i class="fas fa-camera"></i></button> -->
		                </td>
		                <th>이메일</th>
		                <td>${member.memberEmail}</td>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="password" class="form-control form__input--mod span__pass" value="${member.password}" disabled />
		                	<button type="button" class="btn btn-default float--right" id="passBtn" data-toggle="modal" data-target="#passModal">변경</button>
		                </td>
		            </tr>
		            <tr>
		                <th>회원구분</th>
		                <td>
		                	<c:choose>
		                		<c:when test="${member.memberGrade eq 'U'}">일반회원</c:when>
		                		<c:when test="${member.memberGrade eq 'S'}">관계자</c:when>
		                		<c:when test="${member.memberGrade eq 'P'}">수의사 인증 처리중..</c:when>
		                		<c:when test="${member.memberGrade eq 'V'}">수의사</c:when>
		                		<c:when test="${member.memberGrade eq 'A'}">관리자</c:when>
		                	</c:choose>
		                </td>
		                <th>가입일</th>
		                <td><fmt:formatDate value="${member.memberFileRegDate}" pattern="yyyy-MM-dd"/></td>
		            </tr>
		            <tr>
		                <th>이름</th>
		                <td>${member.memberName}</td>
		                <th>닉네임</th>
		                <td>
		                	<input type="text" name="memberNickname" class="form-control form__input--mod member-mod" value="${member.memberNickname}" disabled />
		                </td>
		            </tr>
		            <tr>
		                <th>전화번호</th>
		                <td colspan="3">
			                <input type="text" name="memberPhone" class="form-control form__input--mod member-mod" value="${member.memberPhone}" disabled />
		                	<span class="member__span--mod-show">
		                		<button type="button" class="btn btn-default" id="memberModFormBtn">변경</button>
		                	</span>
		                	<span class="member__span--mod-yes">
		                		<button type="button" class="btn btn-default" id="memberModBtn">수정</button>
		                		<button type="button" class="btn btn-danger" id="memberModCancelBtn">취소</button>
		                	</span>
		                </td>
		            </tr>
		        </table>
		    </div>
		</form>

		<%-- 수의사 추가정보 --%>
		<c:if test="${member.memberGrade eq 'V'}">
		    <div>
		        <table class="table table-bordered" >
		            <tr>
		                <th>
		                	병원
		                	<button id="hosReg" class="btn btn-primary float--right" data-toggle="modal" data-target="#hosRegModal">병원등록</button>
		                </th>
		                <td>
		                	<span id="hosTitleSpan">
		                		<c:out value="${member.hosTitle}" default="등록된 병원이 없습니다." />
		                	</span>
		                </td>
		            </tr>
		            <tr><th style="width: 20%">약력</th>
		                <td>
		                	<div id="memberCareer" contenteditable="true" <c:if test="${empty member.memberCareer}">class='career--edit'</c:if>>
	                			${member.memberCareer}
		                	</div>
		                </td>
		            </tr>
		        </table>
		    </div>
		</c:if>
		
		
		<%-- 병원 직원 추가정보 --%>
		<c:if test="${member.memberGrade eq 'S'}">
		    <div>
		        <table class="table table-bordered" >
		            <tr>
		                <th>
		                	병원
		                	<button id="hosReg" class="btn btn-primary float--right" data-toggle="modal" data-target="#hosRegModal">병원등록</button>
		                </th>
		                <td>
		                	<span id="hosTitleSpan">
		                		<c:out value="${member.hosTitle}" default="등록된 병원이 없습니다." />
		                	</span>
		                </td>
		            </tr>
		            <tr><th style="width: 20%">약력</th>
		                <td>
		                	<div id="memberCareer" contenteditable="true" <c:if test="${empty member.memberCareer}">class='career--edit'</c:if>>
	                			${member.memberCareer}
		                	</div>
		                </td>
		            </tr>
		        </table>
		    </div>
		</c:if>
		

	    <div id="pet-container">
	    <h2 class="mypet">반려동물</h2>
	    <button class="btn btn-warning float--right" id="pet-add">반려동물 정보 추가</button>
	    <hr>
	    	<c:if test="${empty pet}">
	    		<h3>등록된 반려동물이 없습니다.</h3>
	    	</c:if>
	    	<c:forEach var="pet" items="${pet}">
				<div class="pet-info" data-pet-no="${pet.petNo}">
					<img alt="강아지 사진" src="<c:url value='/upload${pet.petFilePath}/${pet.petSysName}' />" class="img-thumbnail">
					<div>${pet.petName}</div>
				</div>
			</c:forEach>
		</div>
		
	    <div id="vet-container">
	    <h2 class="myvet">즐겨찾는 병원</h2>
	    <button class="btn btn-warning float--right" id="vet-add">병원 검색</button>
	    <hr>
	    	<c:if test="${empty hos}">
	    		<h3>등록된 병원이 없습니다.</h3>
	    	</c:if>
	    	<c:forEach var="hos" items="${hos}">
				<div class="pet-info" data-hos-no="${hos.hosCode}">
					<div><a href="/myvet/hos/hospital.do?hosCode=${hos.hosCode }" >${hos.title}</a></div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 비밀번호 변경 모달창 -->
	<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="control-group form-horizontal">
	            <label for="current_password" class="control-label">현재 비밀번호</label>
	            <div class="controls">
	                <input type="password" name="currentPassword" class="form-control">
	            </div>
	        </div>
	        <div class="control-group">
	            <label for="new_password" class="control-label">변경 비밀번호</label>
	            <div class="controls">
	                <input type="password" name="newPassword" class="form-control">
	            </div>
	        </div>
	        <div class="control-group">
	            <label for="confirm_password" class="control-label">비밀번호 확인</label>
	            <div class="controls">
	                <input type="password" name="confirmPassword" class="form-control">
	            </div>
	        </div>      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="passModBtn">변경</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 병원등록 모달창 -->
	<div class="modal fade" id="hosRegModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">병원찾기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="control-group form-horizontal">
	            
	            <div class="row controls">
	            	<div class="col-md-3">
	            		<label for="current_password" class="control-label">병원명</label>
	            	</div>
	            	<div class="col-md-9">
		                <input type="text" id="hosTitle" class="form-control">
	            	</div>
	            </div>
	            <div class="hos--list" class="row controls">
	            	<ul></ul>
	            </div>
	        </div>
	      </div>
	      <div class="modal-footer">
	      	<a id="newHos" href="#">신규병원 등록하기</a><br> 
	        <button type="button" class="btn btn-primary" id="hosRegBtn">등록</button>
	        <button type="button" class="btn btn-secondary" id="hosCloseBtn">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<script>
		var memInfo = {
			nickname: "${member.memberNickname}",
			phone: "${member.memberPhone}",
			password: "${member.password}",
			imgsrc: "<c:url value='/upload${member.memberFilePath}/${member.memberSysName}' />"
		};
		memInfo.career = $("#memberCareer").html();
	</script>
	<script src="<c:url value='/resources/js/common/notify.js'/>"></script>
	<script src="<c:url value='/resources/js/member/mypage.js'/>"></script>
</body>
</html>