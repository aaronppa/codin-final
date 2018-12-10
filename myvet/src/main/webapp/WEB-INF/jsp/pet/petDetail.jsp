<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<title>반려인의 개인 페이지입니다.</title>

<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />

<!-- fontawesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<body>
	<div id="top-menu">
		<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
	</div>
	<div class="container">
		<section>
	      <div class="container">
	        <div class="row align-items-center">
	          <div class="col-lg-3">
	              <img class="img-fluid rounded-circle" src="<c:url value='${result.pet.petFilePath}/${result.pet.petSysName}' />" alt="반려동물 사진" title="반려동물 사진" />
	          </div>
	          <div class="col-lg-9">
	            <table class="table table-stripe">
		            <tr>
		                <th>등록번호</th>
		                <td colspan="3">${result.pet.petRegNo}</td>
					</tr>
					<tr>
						<th>멍냥</th>
		                <td>${result.pet.species == 'dog' ? "강아지" : "고양이"}</td>
						<th>
							품종
						</th>
						<td>${result.pet.breed}</td>
					</tr>
		            <tr>
		                <th>사이즈</th>
		                <td>${result.pet.size == 's' ? "소형" : result.pet.size == 'm' ? "중형" : "대형"}</td>
		                <th>성별</th>
		                <td>${result.pet.petGender == 'm' ? "왕자님" : "공주님"}</td>
		            </tr>
		            <tr>
		                <th>나이</th>
		                <td>${result.pet.petAge} 살</td>
		                <th>몸무게</th>
		                <td>${result.pet.weight} kg</td>
		            </tr>
		            <tr>
		                <th>특이사항</th>
		                <td colspan="3">${result.pet.remark}</td>
		                <th>예약</th>
		                <td>
		                	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">예약보기</button>
		                </td>
		            </tr>
		        </table>
	          </div>
	        </div>
	      </div>
	    </section>
	    
	    <section>
	    	<h2>즐겨찾는 병원</h2>
	    	
	    	<div>
	    		 <table class="table table-stripe">
		            <tr>
		                <th>등록번호</th>
		                <td colspan="3">${result.pet.petRegNo}</td>
					</tr>
					<tr>
						<th>멍냥</th>
		                <td>${result.pet.species == 'dog' ? "강아지" : "고양이"}</td>
						<th>
							품종
						</th>
						<td>${result.pet.breed}</td>
					</tr>
		            <tr>
		                <th>사이즈</th>
		                <td>${result.pet.size == 's' ? "소형" : result.pet.size == 'm' ? "중형" : "대형"}</td>
		                <th>성별</th>
		                <td>${result.pet.petGender == 'm' ? "왕자님" : "공주님"}</td>
		            </tr>
		            <tr>
		                <th>나이</th>
		                <td>${result.pet.petAge} 살</td>
		                <th>몸무게</th>
		                <td>${result.pet.weight} kg</td>
		            </tr>
		            <tr>
		                <th>특이사항</th>
		                <td colspan="3">${result.pet.remark}</td>
		            </tr>
		        </table>
	    	</div>
	    </section>

	    <section>
	    	<h2>예약내용 (총 : ${result.booking.size()} 건)</h2>
	    	<div>
	    		 <table class="table table-stripe">
		            <tr>
		                <th>병원명</th>
						<th>예약일</th>
		                <th>예약시간</th>
		                <th>예약이유</th>
		                <th>confirm</th>
		                <th>finish</th>
					</tr>
					<c:forEach var="booking" items="${result.booking}">
					<tr>
		                <td>${booking.hosTitle}</td>
		                <td>${booking.blockDay}</td>
		                <td>${booking.blockStart} - ${booking.blockEnd}</td>
		                <td>${booking.facilityNo == 1 ? "진료" : booking.facilityNo == 2 ? "미용" : "" }</td>
		                <td>${booking.confirm}</td>
		                <td>${booking.finish}</td>
		            </tr>
					</c:forEach>
		        </table>
	    	</div>
	    </section>
	</div>    
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <table>
	        	
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script src="<c:url value='/resources/js/pet/pet-detail.js'/>"></script>
</body>
</html>