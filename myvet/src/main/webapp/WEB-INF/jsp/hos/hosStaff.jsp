<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원 관리</title>
<style>
	#bodyContainer {
		width: 1100px;
		margin: auto;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="bodyContainer">
		<h1>직원 관리</h1>
		<div>
			<h3>재직 중인 직원</h3>
			<table>
				<thead>
					<tr>
						<th>이름</th>
						<th>직책</th>
						<th>등록일자</th>
						<th>병원 관리 권한</th>
						<th>수정 / 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${staff}" var="staff">
						<tr class="staffRow">
							<td>
								${staff.member.memberName }
							</td>
							<td>
								<input type="text" class="staffTitle" value="${staff.staffTitle }">
							</td>
							<td>
								<fmt:formatDate value="${staff.staffRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								<select>
									<option class="hosAdmin" value="Y" data-admin="${staff.hosAdmin}">O</option>
									<option class="hosAdmin" value="N" data-admin="${staff.hosAdmin}">X</option>
								</select>
							</td>
							<td>
								<button class="editStaff" data-no="${staff.staffNo }">승인</button>
								<button class="deleteStaff" data-no="${staff.staffNo }" data-member="${staff.staffMemberNo }">삭제</button>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div>
			<h3>직원 권한 신청 목록</h3>
			<table>
				<thead>
					<tr>
						<th>이름</th>
						<th>직책</th>
						<th>등록일자</th>
						<th>승인 / 거부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${staffWait }" var="waiter">
						<tr class="staffRow">
							<td>
								${waiter.member.memberName }
							</td>
							<td>
								<input type="text" class="staffTitle" value="${waiter.staffTitle }">
							</td>
							<td>
								<fmt:formatDate value="${waiter.staffRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td>
								<button class="addStaff" data-no="${waiter.staffNo }">승인</button>
								<button class="deleteStaff" data-no="${waiter.staffNo }" data-member="${waiter.staffMemberNo }">거부</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script>
	
		for (let i = 0; i < $(".hosAdmin").length; i++) {
			console.dir($(".hosAdmin:eq("+i+")"));
			
			if ($(".hosAdmin:eq("+i+")").attr("value") == $(".hosAdmin:eq("+i+")").data("admin")) {
				$(".hosAdmin:eq("+i+")").attr("selected", "selected");
			}
		}
	
	
		$(".addStaff").click(function(){
			console.dir($(this).parents(".staffRow"));
			
			$.ajax({
				url: "/myvet/hos/addStaff.do",
				data: {
					staffNo: $(this).data("no"),
					staffTitle: $(this).parents(".staffRow").find(".staffTitle").val()
				}
			}).done(function() {
				window.location.reload()
			})
			
			console.dir($(this).parents(".staffRow").find(".staffTitle").val());
			console.dir($(this).data("no"));
		})
		
		$(".editStaff").click(function(){
			
			$.ajax({
				url: "/myvet/hos/editStaff.do",
				data: {
					staffNo: $(this).data("no"),
					staffTitle: $(this).parents(".staffRow").find(".staffTitle").val(),
					hosAdmin: $(this).parents(".staffRow").find(".hosAdmin:selected").val()
				}
			}).done(function() {
				window.location.reload()
			})
			
			console.dir($(this).parents(".staffRow").find(".staffTitle").val());
			console.dir($(this).data("no"));

		})
		
		$(".deleteStaff").click(function() {
			$.ajax({
				url: "/myvet/hos/deleteStaff.do",
				data: {
					staffNo: $(this).data("no"),
					staffMemberNo:  $(this).data("member")
				}
			}).done(function() {
				window.location.reload()
			})
			
			console.dir($(this).parents(".staffRow").find(".staffTitle").val());
			console.dir($(this).data("no"));
		})
	</script>
</body>
</html>