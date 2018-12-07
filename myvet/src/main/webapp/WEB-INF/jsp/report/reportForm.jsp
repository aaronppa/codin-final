<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   <style>
      .container{
          width:1100px;

      }
   </style>
</head>
<body>

	<div class="container">
	<br>
	<br>
	        <form action="<c:url value='/report/writeReport.do'/>">
            <!--신고자, 신고대상-->
            <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputReportMemberNo">신고자</label>
                        <c:if test="boardCode == 10"><input type="hidden" name="reportMemberNo" value="${user.memberNo}"></c:if>
                        <p class="text-justify">${user.memberNickname}</p>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">신고대상</label>
                        <c:if test="${report.boardCode == 10}"><input type="hidden" name="targetMemberNo" value="${report.writerNo}"><p class="text-justify">${report.writerNo}</p></c:if>
                        <c:if test="${report.boardCode == 11}"><input type="hidden" name="targetMemberNo" value="${report.reportMemberNo}"><p class="text-justify">${report.memberNo}</p></c:if>
                        <c:if test="${report.boardCode == 20}"><input type="hidden" name="targetMemberNo" value="${report.writerNo}"><p class="text-justify">${report.writerNo}</p></c:if>
                    </div>
            </div>
            <!-- 게시판 분류, 게시판 제목-->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">게시판 분류</label>
                    <input type="hidden" name="boardCode" value="${report.boardCode}">
                    <c:if test="${report.boardCode == 10}"><p class="text-justify">5959내시끼</p></c:if>
                    <c:if test="${report.boardCode == 11}"><p class="text-justify">개꿀팁이냥</p></c:if>
                    <c:if test="${report.boardCode == 20}"><p class="text-justify">Q&A</p></c:if>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">게시판 제목</label>
                    	<c:if test="${report.boardCode == 10}"><input type="hidden" name="contentNo" value="${report.galleryNo}"><p class="text-justify">${report.title}</p></c:if>
                        <c:if test="${report.boardCode == 11}"><input type="hidden" name="contentNo" value="${report.tipNo}"><p class="text-justify">${report.title}</p></c:if>
                        <c:if test="${report.boardCode == 20}"><input type="hidden" name="contentNo" value="${report.qnaNo}"><p class="text-justify">${report.title}</p></c:if>
                </div>
            </div>
            <!-- 댓글 내용-->
            <div class="form-group">
                <label for="exampleFormControlTextarea1">댓글내용</label>
               		<c:if test="${report.boardCode != ''}"><input type="hidden" name="conmmentNo" value="${report.commentNo}"><p class="text-justify">${report.comment}</p></c:if>
                    <c:if test="${report.boardCode != ''}"><input type="hidden" name="conmmentNo" value="${report.commentNo}"><p class="text-justify">${report.comment}</p></c:if>
                    <c:if test="${report.boardCode != ''}"><input type="hidden" name="conmmentNo" value="${report.commentNo}"><p class="text-justify">${report.content}</p></c:if>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">신고사유</label>
                <select class="form-control" id="exampleFormControlSelect1">
                        <option value="">신고유형</option>
                        <option value="1">음란성 및 선정성</option>
                        <option value="2">상업적 광고 홍보</option>
                        <option value="3">지나친 혐오성</option>
                        <option value="4">개인정보 유출</option>
                        <option value="5">지나친 욕설</option>
                        <option value="6">특정 대상 비난</option>
                        <option value="7">도배/낚시 내용</option>
                        <option value="8">악성 프로그램</option>
                        <option value="9">저작권법 위반</option>
                        <option value="10">기타</option>
                </select>
            </div>
            <!-- <div class="form-group">
                <label for="exampleFormControlSelect2">신고유형</label>
                <select multiple class="form-control" id="exampleFormControlSelect2">
                        <option value="1">음란성 및 선정성</option>
                        <option value="2">상업적 광고 홍보</option>
                        <option value="3">지나친 혐오성</option>
                        <option value="4">개인정보 유출</option>
                        <option value="5">지나친 욕설</option>
                        <option value="6">특정 대상 비난</option>
                        <option value="7">도배/낚시 내용</option>
                        <option value="8">악성 프로그램</option>
                        <option value="9">저작권법 위반</option>
                        <option value="10">기타</option>
                </select>
            </div> -->
            <div class="form-group">
                <label for="exampleFormControlTextarea1">신고내용</label>
                <textarea class="form-control" name="reportContent" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <input class="btn btn-primary" type="submit" value="Input">
        </form>
	</div>
</body>
</html>