<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/common/pagination.css'/>"/>
<link rel="stylesheet" href="<c:url value='/resources/js/waitme/waitMe.css'/>"/>
<script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script>
<script src="<c:url value='/resources/js/waitme/common-waitme.js'/>"></script>
<style>
select {
    width: auto;
}

a.nostyle{
    text-decoration: inherit;
    color: inherit;
    cursor: auto;
}

a.nostyle:visited {
    text-decoration: inherit;
    color: inherit;
    cursor: auto;
}

a.nostyle:hover{
	cursor: pointer;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
    <div class="admin main container">
        <div class="listarea vetauth">
            <h2>수의사 인증 요청 리스트</h2>
            <div class="search">
                <form action="" id="vetAuth-search" method="post">
                    요청검색: 
                    <select name="requester">
                        <option value="">=검색유형선택=</option>
                        <option value="">요청자 이름</option>
                        <option value="">요청자 계정</option>
                    </select>
                    상태:
                    <select name="status">
                        <option value="">전체</option>
                        <option value="">승인</option>
                        <option value="">보류</option>
                        <option value="">반려</option>
                    </select>
                    <input type="search" name="keyword">
                    <input type="button" class="searchbtn" value="검색" data-boardtype="vetAuth">
                    <input type="button" class="reset" value="초기화">
                </form>
            </div>
            <div class="listcnt"><span>전체: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable list" id="vetauth">
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
                <form action="" id="report-search" method="post">
                    신고검색: 
                    <select name="requester">
                        <option value="">=검색유형선택=</option>
                        <option value="">신고자 계정</option>
                        <option value="">신고자 닉네임</option>
                    </select>
                    상태:
                    <select name="status">
                        <option value="">전체</option>
                        <option value="">승인</option>
                        <option value="">보류</option>
                        <option value="">반려</option>
                    </select>
                    신고유형:
                    <select name="reportType">
                        <option value="">전체</option>
                        <option value="">음란성/선정성</option>
                        <option value="">상업적 광고 홍보</option>
                        <option value="">지나친 혐오성</option>
                        <option value="">개인정보 유출</option>
                        <option value="">욕설</option>
                        <option value="">특정대상 비난</option>
                        <option value="">도배/낚시 내용</option>
                        <option value="">악성 프로그램</option>
                        <option value="">저작권법 위반</option>
                        <option value="">유령병원</option>
                        <option value="">기타</option>
                    </select>
                    게시판:
                    <select name="board">
                        <option value="">전체</option>
                        <option value="">Q&A</option>
                        <option value="">겔러리</option>
                        <option value="">꿀팁</option>
                        <option value="">병원리뷰</option>
                    </select>
                    콘텐츠유형:
                    <select name="contentType">
                        <option value="">전체</option>
                        <option value="">게시글</option>
                        <option value="">댓글</option>
                        <option value="">리뷰</option>
                    </select>
                    <input type="button" class="searchbtn" value="검색" data-boardtype="report">
                    <input type="button" class="reset" value="초기화">
                </form>
            </div>
            <div class="listcnt"><span>전체: </span><span id="itemcnt">(1/123)</span></div>
             <table class="clickable list" id="report">
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
            <h2>사이트 전체 공지사항</h2>
            <button type="button" id="write">글작성</button>
            <div class="search">
                <form action="" id="notice-search" method="post">
                    작성자: 
                    <select name="writer">
                        <option value="">전체</option>
                        <option value="">사이트관리자</option>
                        <option value="">서버관리자</option>
                        <option value="">......</option>
                    </select>
                    검색키워드: 
                    <input type="search" name="keyword">
                    <input type="button" class="searchbtn" value="검색" data-boardtype="notice">
                  	<input type="button" class="reset" value="초기화">
                    <label for="tempsave">임시저장</label>
                    <input type="checkbox" id="tempsave" value="1">
                </form>
                </div>
            <div class="listcnt"><span>전체: </span><span id="itemcnt">${noticePageResult.count}개</span></div>
             <table class="clickable list" id="notice">
                <thead>
                <tr>
                    <th class="listno">공지글 번호</th>
                    <th class="category">임시저장</th>
                    <th class="notice-title">제목</th>
                    <th class="nickname">작성자 닉네임</th>
                    <th class="datetime">작성날짜</th>
                    <th class="notice-view-cnt">조회수</th>
                </tr>
                </thead>
                <tbody id="noticelist">
                <c:forEach var="notice" items="${notice}">
	        		<tr class="notice-tr" data-boardtype='notice' data-itemno='${notice.noticeNo}'>
	        			<td class="listno">${notice.noticeNo}</td>
	        			<c:choose>
	        			<c:when test="${notice.tempSave == 1}">
	        			<td class="category">임시저장</td>
	        			</c:when>
	        			<c:otherwise>
	        			<td class="category">완료</td>
	        			</c:otherwise>
	        			</c:choose>
	        			<td class="notice-title">
	        					${notice.noticeTitle}
	 					</td>
	        			<td class="nickname">${notice.member.memberNickname}</td>
	        			<td class="datetime notice-reg-date">
		        			<fmt:formatDate value="${notice.noticeRegDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
	        			</td>
	        			<td class="notice-view-cnt">
	        				${notice.noticeViewCnt}
	        			</td>
	        		</tr>
        		</c:forEach>
                </tbody>
            </table>
            <c:if test="${noticePageResult.count != 0}">
			    <nav class="pagination" aria-label="Pagination">
			        <ul class="pagination" data-boardtype='notice'>
			            <li><a class='disabled nostyle firstpage' data-boardtype='notice' id="first" href="1">&laquo;First</a></li>
			            <li><a class='disabled nostyle previouspage' data-boardtype='notice' href=${noticePageResult.beginPage-1 }>&laquo;Previous</a></li>
			            
						<c:forEach var="i" begin="${noticePageResult.beginPage}" end="${noticePageResult.endPage}">
					    	<li <c:if test="${i eq noticePageResult.pageNo }">class="current"</c:if> ><a href="${i}" class="nostyle" data-boardtype="notice">${i}</a></li>
						</c:forEach>
			            
			            <li><a class='<c:if test="${noticePageResult.pageNo == noticePageResult.lastPage}">disabled </c:if>nostyle nextpage' data-boardtype="notice" href="${noticePageResult.endPage+1 }">Next&raquo;</a></li>
			            <li><a class='<c:if test="${noticePageResult.pageNo + 10 > noticePageResult.lastPage}">disabled </c:if>nostyle endpage' data-boardtype="notice" href="${noticePageResult.lastPage }">End&raquo;</a>
			            </li>
			        </ul>
			    </nav>
		    </c:if>
        </div>
        <hr>
        <div class="listarea member">
            <h2>회원관리(검색)</h2>
            <div class="search">
            <form action="" id="member-search">
                회원검색: 
                <select name="keywordType">
                    <option value="">=검색유형선택=</option>
                    <option value="account">계정</option>
                    <option value="nickname">닉네임</option>
                    <option value="name">이름</option>
                </select>
                회원구분: 
                <select name="memberType">
                    <option value="">전체</option>
                    <option value="admin">관리자</option>
                    <option value="general">일반회원</option>
                    <option value="vet">수의사</option>
                    <option value="staff">병원관계자</option>
                </select>
                회원상태: 
                <select name="status">
                    <option value="">전체</option>
                    <option value="ok">정상</option>
                    <option value="out">탈퇴</option>
                    <option value="blocked">차단</option>
                </select>
                <input type="search" name="keyword">
                <input type="button" class="searchbtn" value="검색" data-boardtype="member">
                <input type="button" class="reset" value="초기화">
            </form>
            </div>
            <div class="listcnt"><span>전체: </span><span id="itemcnt">123</span></div>
             <table class="clickable list" id="member">
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

<script src="<c:url value='/resources/js/datetime/jquery-dateformat.js'/>"></script>
<script>
/* Popup Size and Location */
var w = 1000;
var h = 600;
var left = Math.round((screen.width/2)-(w/2));
var topx = Math.round((screen.height/2)-(h/2));
console.log(topx);
console.log(left);
console.log("screenTop: ", topx);
console.log("screenLeft: ", left);

/* search */
$(".searchbtn").click(function(e){
	e.preventDefault();
	console.log("Search boardType: ", e.target.dataset.boardtype);
	console.log("Search form#: ", e.target.form)
	var postUrl = 
	$.get()
});

/* Reset Button */
$(".reset").click(function(){
	location.reload();
})

/* Table Row Click Detection */
$("body").on("click", "table", function(e){
	console.log("Clicked: ", e.target);
})

/* Notice 상세 */
$(".clickable").on("click", "tr", function(e){
	console.log("Clicked: ", $(this).data("boardtype"));
	console.log("Clicked: ", $(this).data("itemno"));
    window.open("<c:url value='/admin/detail.do?boardType="+$(this).data("boardtype")+"&itemno="+$(this).data("itemno")+"'/>","공지사항 작성 Form", "status=yes,toolbar=no,menubar=no,width="+w+", height="+h+", top="+topx+", left="+left);
})

/* Notice Board Write Form Popup */
$("button#write").on("click",function(){
    window.open("<c:url value='/admin/writeForm.do'/>","공지사항 작성 Form", "status=yes,toolbar=no,menubar=no,width="+w+", height="+h+", top="+topx+", left="+left);
})

   
/* Paging Action */
$("nav.pagination").on("click","a.nostyle", function(e) {
	e.preventDefault();
	var selectedLn = $(this);
	var pageNo = $(this).attr("href")
	var boardType = $(this).data("boardtype");
	console.log(boardType);
	if ($(this).hasClass("disabled")) return false;

	$.ajax({
		url: boardType +"/" + pageNo +".do",
		/* url: "noticelist.do", */
		/* data: {"boardType":boardType, "pageNo": pageNo}, */
		method: "post"
	})
	.fail(function(jqXHR, textStatus, errorThrown){
		console.log(jqXHR, textStatus, errorThrown);
	})
	.done(function(result){
		console.dir(result);
		switch(boardType){
		case "notice": 	$("tbody#noticelist").html(updateNoticeList(boardType, result.notice));
						break;
		
		
		}
		updateCurrPg(boardType, result.noticePageResult);
		console.dir($(this));
	});
	
})

/* Update Notice List */
function updateNoticeList(boardType, resultItems){
	var html="";
	var saveStatus="";
	for(var item of resultItems){
		if(item.tempSave==0){
			saveStatus="완료";
		} else {
			saveStatus="임시저장";
		}
		html += "<tr class='notice-tr' data-boardtype='"+boardType+"' data-itemno='"+item.noticeNo+"'><td class='listno'>"+item.noticeNo+
			   "</td><td class='category'>"+saveStatus+
			   "</td><td class='notice-title'>"+item.noticeTitle+
			   "</td><td class='nickname'>"+item.member.memberNickname+
			   "</td><td class='datetime notice-reg-date'>"+$.format.date(item.noticeRegDate,'yyyy-MM-dd HH:mm:ss')+
			   "</td><td class='notice-view-cnt'>"+item.noticeViewCnt+
			   "</td></tr>"
	};
	return html;
}	

/* Paging Function */
function updateCurrPg(boardType, pageResult){
		console.dir(pageResult);
		console.log(boardType);
		var html = "<li ><a class='nostyle firstpage' data-boardtype='"+boardType+
				   "' href='1'>&laquo;First</a></li>"+
            	   "<li ><a class='nostyle previouspage' data-boardtype='"+boardType+"' href='"+(pageResult.pageNo-1)+
            	   "'>&laquo;Previous</a></li>"
		for(var i=pageResult.beginPage; i<=pageResult.endPage; i++){
			html += "<li><a href='"+i+"' class='nostyle' data-boardtype='"+boardType+"'>"+i+"</a></li>"
		}
            html += "<li><a href='"+(pageResult.endPage+1)+"' class='nostyle nextpage' data-boardtype='"+boardType+"'>Next&raquo;</a></li>"+
	                "<li><a href='"+pageResult.lastPage+"' class='nostyle lastpage' data-boardtype='"+boardType+"'>End&raquo;</a>"
        $("ul.pagination").data("boardtype",boardType).html(html);
  			$("a[href="+pageResult.pageNo+"]").not(".firstpage, .previouspage, .nextpage, .lastpage").parent().addClass("current");
  			$("a[href=0]").addClass("disabled");
  			$("a[href='"+(pageResult.lastPage+1)+"']").addClass("disabled");
  			
  			if(pageResult.pageNo==1){
  				$("a.firstpage").addClass("disabled");
  			}
  			
  			if(pageResult.pageNo + 10 > pageResult.lastPage){
  				$("a.lastpage").addClass("disabled");
  			}
    			
}

</script>    
</body>
</html>