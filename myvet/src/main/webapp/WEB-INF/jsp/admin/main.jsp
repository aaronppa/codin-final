<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Admin Page</title>

<script
src="https://code.jquery.com/jquery-3.3.1.js"
integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/admin/table.css"/>">
<style>

</style>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
    <div class="admin main container">
        <div class="listarea vetauth">
            <h2>수의사 인증 요청 리스트</h2>
            <div class="search">
                <form action="">
                    요청검색: 
                    <select>
                        <option>=검색유형선택=</option>
                        <option>요청자 이름</option>
                        <option>요청자 계정</option>
                    </select>
                    상태:
                    <select>
                        <option>전체</option>
                        <option>승인</option>
                        <option>보류</option>
                        <option>반려</option>
                    </select>
                    <input type="search" name="keyword">
                    <input type="button" id="searchbtn" value="검색">
                    <button id="reset">초기화</button>
                </form>
            </div>
            <div class="listcnt"><span>목록 갯수/전체 갯수: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable" id="vetauth">
                <thead>
                <tr>
                    <th class="listno">요청 번호</th>
                    <th class="datetime">요청 날짜</th>
                    <th class="name">요청자 이름</th>
                    <th>요청자 계정</th>
                    <th class="status">상태</th>
                </tr>
                </thead>
                <tbody>
                <tr><td class="listno">1</td><td class="datetime">2018-11-28 HH:mm:SS</td><td class="name">홍길동</td><td>hong@hongvet.com</td><td class="status">신규</td></tr>
                </tbody>
            </table>
        </div>
        <hr>
        <div class="listarea report">
            <h2>신고 접수 리스트</h2>
            <div class="search">
                <form action="">
                    신고검색: 
                    <select>
                        <option>=검색유형선택=</option>
                        <option>신고자 계정</option>
                        <option>신고자 닉네임</option>
                    </select>
                    상태:
                    <select>
                        <option>전체</option>
                        <option>승인</option>
                        <option>보류</option>
                        <option>반려</option>
                    </select>
                    신고유형:
                    <select>
                        <option>전체</option>
                        <option>음란성/선정성</option>
                        <option>상업적 광고 홍보</option>
                        <option>지나친 혐오성</option>
                        <option>개인정보 유출</option>
                        <option>욕설</option>
                        <option>특정대상 비난</option>
                        <option>도배/낚시 내용</option>
                        <option>악성 프로그램</option>
                        <option>저작권법 위반</option>
                        <option>유령병원</option>
                        <option>기타</option>
                    </select>
                    게시판:
                    <select>
                        <option>전체</option>
                        <option>Q&A</option>
                        <option>겔러리</option>
                        <option>꿀팁</option>
                        <option>병원리뷰</option>
                    </select>
                    콘텐츠유형:
                    <select>
                        <option>전체</option>
                        <option>게시글</option>
                        <option>댓글</option>
                        <option>리뷰</option>
                    </select>
                    <button id="reset">초기화</button>
                </form>
            </div>
            <div class="listcnt"><span>목록 갯수/전체 갯수: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable" id="report">
                    <thead>
                <tr>
                    <th class="listno">신고 번호</th>
                    <th class="datetime">신고 날짜</th>
                    <th>신고자 계정</th>
                    <th class="nickname">신고자 닉네임</th>
                    <th class="category">신고 유형</th>
                    <th class="boardname">게시판</th>
                    <th class="category">컨텐츠 유형</th>
                    <th class="status">상태</th>
                </tr>
                </thead>
                <tbody>
                <tr><td class="listno">10</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">9</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">8</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">7</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">6</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">5</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">4</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">3</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">2</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                <tr><td class="listno">1</td><td class="datetime">2018-11-28 HH:mm:SS</td><td>hong@hongvet.com</td><td class="nickname">내시키최고</td><td class="category">유해 게시글</td><td class="boardname">Q&A</td><td class="category">게시글</td><td class="status">신규</td></tr>
                </tbody>
            </table>
        </div>
        <hr>
        <div class="listarea notice">
            <h2>사이트 전체 공지 게시판</h2>
            <button type="button" id="write">글작성</button>
            <div class="search">
                <form action="">
                    작성자: 
                    <select>
                        <option>전체</option>
                        <option>사이트관리자</option>
                        <option>서버관리자</option>
                        <option>......</option>
                    </select>
                    검색키워드: 
                    <input type="search" name="keyword">
                    <input type="button" id="searchbtn" value="검색">
                    <button id="reset">초기화</button>
                    <label for="tempsave">임시저장</label>
                    <input type="checkbox" id="tempsave">
                </form>
                </div>
            <div class="listcnt"><span>목록 갯수/전체 갯수: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable" id="notice">
                <thead>
                <tr>
                    <th class="listno">공지글 번호</th>
                    <th class="category">임시저장</th>
                    <th>제목</th>
                    <th class="nickname">작성자 넥네임</th>
                    <th class="datetime">작성날짜</th>
                </tr>
                </thead>
                <tbody>
                <tr><td class="listno">1</td><td class="category">서버점검</td><td>서버점검 안내</td><td class="nickname">서버관리자</td><td class="datetime">2018-11-28 HH:mm:SS</td></tr>
                </tbody>
            </table>
        </div>
        <hr>
        <div class="listarea member">
            <h2>회원관리(검색)</h2>
            <div class="search">
            <form action="">
                회원검색: 
                <select>
                    <option>=검색유형선택=</option>
                    <option>계정</option>
                    <option>닉네임</option>
                    <option>이름</option>
                </select>
                회원구분: 
                <select>
                    <option>전체</option>
                    <option>관리자</option>
                    <option>일반회원</option>
                    <option>수의사</option>
                    <option>병원관계자</option>
                </select>
                회원상태: 
                <select>
                    <option>전체</option>
                    <option>정상</option>
                    <option>탈퇴</option>
                    <option>차단</option>
                </select>
                <input type="search" name="keyword">
                <input type="button" id="searchbtn" value="검색">
                <button id="reset">초기화</button>
            </form>
            </div>
            <div class="listcnt"><span>목록 갯수/전체 갯수: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable" id="member">
                <thead>
                <tr>
                    <th class="listno">회원 번호</th>
                    <th>회원 계정</th>
                    <th class="nickname">회원 닉네임</th>
                    <th class="category">회원 구분</th>
                    <th class="name">회원 이름</th>
                    <th class="petcnt">반려동물수</th>
                    <th class="status">회원 상태</th>
                </tr>
                </thead>
                <tbody>
                <tr><td class="listno">3</td><td>hong@hongvet.com</td><td class="nickname">서버관리자</td><td class="category">a</td><td class="name">조용제</td><td class="petcnt">3</td><td class="status">정상</td></tr>
                </tbody>
            </table>
        </div>
    </div>
<script>
    $("button#write").on("click",function(){
        var w = 1000;
        var h = 600;
        var left = (screen.width/2)-(w/2);
        var top = (screen.height/2)-(h/2);
        window.open("<c:url value='/admin/writenotice.do'/>","공지사항 작성 Form", "status=yes,toolbar=no,menubar=no,width="+w+", height="+h+", top="+top+", left="+left);
    })
/* 
    $("table#vetauth"). */
</script>    
</body>
</html>