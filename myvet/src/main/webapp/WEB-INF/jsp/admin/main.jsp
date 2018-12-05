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
<%-- <link rel="stylesheet" href="<c:url value='/resources/js/waitme/waitMe.css'/>"/>
<script src="<c:url value='/resources/js/waitme/waitMe.js'/>"></script> --%>
<%-- <script src="<c:url value='/resources/js/waitme/admin-waitme.js'/>"></script> --%>
<style>
ul.pagination{
	padding: 0px;
}
</style>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />
    <div class="admin main container">
        <div class="listarea vetauth">
            <h2><a id="vetauthheader">수의사 인증 요청 리스트</a></h2>
            <div class="search">
                <form action="" id="vetAuth-search" method="post"> 
                    상태:
                    <select name="status">
                        <option value="">전체</option>
                        <option value="">승인</option>
                        <option value="">보류</option>
                        <option value="">반려</option>
                    </select>
                    요청검색: 
                    <select name="memberId">
                        <option value="">=검색유형선택=</option>
                        <option value="">요청자 이름</option>
                        <option value="">요청자 계정</option>
                    </select>
                    <input type="search" name="keyword">
                    <input type="button" class="searchbtn" value="검색" data-boardtype="vetAuth">
                    <input type="button" class="reset" value="초기화">
                </form>
            </div>
            <div class="listcnt"><span>전체: </span><span class="itemcnt" data-boardtype="vetAuth"> - 개</span></div>
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
            <h2><a id="reportheader">신고 접수 리스트</a></h2>
            <div class="search">
                <form action="" id="report-search" method="post" data-boardtype='report'>
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
                    신고검색: 
                    <select name="memberId">
                        <option value="">=검색유형선택=</option>
                        <option value="">신고자 계정</option>
                        <option value="">신고자 닉네임</option>
                    </select>
                     <input type="search" name="keyword">
                    <input type="button" class="searchbtn" value="검색" data-boardtype="report">
                    <input type="button" class="reset" value="초기화">
                </form>
            </div>
            <div class="listcnt"><span>전체: </span><span class="itemcnt" data-boardtype="notice"> - 개</span></div>
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
            <h2><a id="noticeheader">사이트 전체 공지사항</a></h2>
            <button type="button" id="write">글작성</button>
            <div class="search">
                <form action="" id="notice-search" method="post" data-boardtype='notice'>
                    작성자: 
                    <select name="memberId">
                        <option value="">전체</option>
                        <option value="3">사이트관리자</option>
                        <option value="">서버관리자</option>
                        <option value="">......</option>
                    </select>
                    <span class="indent">검색키워드:</span> 
                    <input type="search" name="keyword">
                    <input type="button" class="searchbtn" value="검색" data-boardtype="notice">
                  	<input type="button" class="reset" value="초기화">
                    <label for="tempsave">임시저장</label>
                    <input type="checkbox" id="tempsave" name="status" value="1">
                </form>
                </div>
            <div class="listcnt"><span>전체: </span><span class="itemcnt" data-boardtype="notice">${noticePageResult.count}개</span></div>
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
			            
			            <li><a class='<c:if test="${noticePageResult.pageNo == noticePageResult.lastPage}">disabled </c:if>nostyle nextpage' data-boardtype="notice" href="${noticePageResult.pageNo+1 }">Next&raquo;</a></li>
			            <li><a class='<c:if test="${noticePageResult.pageNo + 10 > noticePageResult.lastPage}">disabled </c:if>nostyle endpage' data-boardtype="notice" href="${noticePageResult.lastPage }">End&raquo;</a>
			            </li>
			        </ul>
			    </nav>
		    </c:if>
        </div>
        <hr>
        <div class="listarea member">
            <h2><a id="memberheader">회원관리(검색)</a></h2>
            <div class="search">
            <form action="" id="member-search" method="post" data-boardtype='member'>
                회원구분: 
                <select name="memberType">
                    <option value="">전체</option>
                    <option value="A">관리자</option>
                    <option value="U">일반회원</option>
                    <option value="V">수의사</option>
                    <option value="S">병원관계자</option>
                    <option value="P">수의사대기</option>
                </select>
                회원상태: 
                <select name="status">
                    <option value="">전체</option>
                    <option value="ok">정상</option>
                    <option value="out">탈퇴</option>
                    <option value="blocked">차단</option>
                </select>
                회원검색: 
                <select name="memberId">
                    <option value="">=검색유형선택=</option>
                    <option value="account">계정</option>
                    <option value="nickname">닉네임</option>
                    <option value="name">이름</option>
                </select>
                <input type="search" name="keyword">
                <input type="button" class="searchbtn" value="검색" data-boardtype="member">
                <input type="button" class="reset" value="초기화">
            </form>
            </div>
            <div class="listcnt"><span>전체: </span><span class="itemcnt" data-boardtype="member"> - 개</span></div>
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
                <tbody id="memberlist">
                <tr class="focus-search"><td colspan="7">검색하여 조회</td><tr>
                </tbody>
            </table>
            	<nav class="pagination" aria-label="Pagination">
			        <ul class="pagination" data-boardtype='member'>
			           
			        </ul>
			    </nav>
        </div>
    </div>
<script src="<c:url value='/resources/js/datetime/jquery-dateformat.js'/>"></script>
<script>

/* Global Variables */
var pageNo;
var boardType;
var formData;


/* Popup Size and Location */
var w = 1000;
var h = 600;
var left = Math.round((screen.width/2)-(w/2));
var topx = Math.round((screen.height/2)-(h/2));
console.log("Screen Height:",screen.height);
console.log("Screen width:",screen.width);
console.log(topx);
console.log(left);
console.log("screenTop: ", topx);
console.log("screenLeft: ", left);

/* Reset Button */
$(".reset").click(function(e){
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
	
	if($(this).data("boardtype")) window.open("<c:url value='/admin/detail.do?boardType="+$(this).data("boardtype")+"&itemno="+$(this).data("itemno")+"'/>","공지사항 작성 Form", "status=yes,toolbar=no,menubar=no,width="+w+", height="+h+", top="+topx+", left="+left);
})

/* Notice Board Write Form Popup */
$("button#write").on("click",function(){
    window.open("<c:url value='/admin/writeForm.do'/>","공지사항 작성 Form", "status=yes,toolbar=no,menubar=no,width="+w+", height="+h+", top="+topx+", left="+left);
})

   
/* Paging Action */
$("nav.pagination").on("click","a.nostyle", function(e) {
	e.preventDefault();
	var selectedLn = $(this);
	pageNo = $(this).attr("href")
	boardType = $(this).data("boardtype");
	
	console.log("Selected Page:",selectedLn.parentsUntil("div.listarea."+boardType).siblings("h2"));
	console.log("Selected Page.closest:",selectedLn.closest("div.listarea").children("h2"));
	console.log("Paging boardType:",boardType);
	console.log("Paging Param:",formData);
	
	if ($(this).hasClass("disabled")) return false;

	sendRetrieveReq(boardType, pageNo, formData);
});


/* search */
$(".searchbtn").click(function(e){
	e.preventDefault();
	thisForm = e.target.form;
	pageNo="1";
	boardType= $(thisForm).data("boardtype"); 
	
	console.log("Search Input: ",$(thisForm).find("input[type='search']").val(), " / Search Select: ", $(thisForm).find("select[name='memberId']").val());
	console.log("Search boardType: ",e.target.dataset.boardtype, " / Search form#: ",thisForm);
	
	if( $(thisForm).data("boardtype")!="notice" && $(thisForm).find("input[type='search']").val() && !$(thisForm).find("select[name='memberId']").val()){
		alert("검색유형을 선택해 주세요.");
		$(thisForm).find("select[name='memberId']").focus();
		return false;
	};

	formData = $(thisForm).serialize();
	
	console.log("pageNo: ",pageNo,"boardType: ",boardType, "formData: ",formData);
	console.log(formData);
	
	sendRetrieveReq(boardType, pageNo, formData);
});

/* Ajax Send Request */
function sendRetrieveReq(boardType, pageNo, formData){
	$.ajax({
		url: boardType +"/" + pageNo +".do",
		method: "post",
		data: formData
	})
	.fail(function(jqXHR, textStatus, errorThrown){
		
		console.log(jqXHR, textStatus, errorThrown);
		
	})
	.done(function(result){
		console.log("Ajax Response Result");
		console.dir(result);
		
		switch(boardType){
		case "notice": 	$("tbody#noticelist").html(updateList(boardType, result.notice));
					    updateCurrPg(boardType, result.noticePageResult);
						break;
		case "member":  $("tbody#memberlist").html(updateList(boardType, result.member));
						 updateCurrPg(boardType, result.memberPageResult); 
						break;
		
		}
		
		
		console.dir($(this));
		formData="";
		console.log("formData after AJAX: ", formData);
		
		location.href="#"+boardType+"header";
	});
}

/* Update List */
function updateList(boardType, resultItems){
	if(resultItems.length==0) {
		console.log("Result EMPTY!");
		return html="<div class='noresult'>검색결과 없음</div>"
	}
	var html="";
	var saveStatus="";
	switch(boardType){
	case "notice":	for(var item of resultItems){
						if(item.tempSave===0){
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
					break;
	case "member": for(var item of resultItems){
						if(item.tempSave===0){
							saveStatus="완료";
						} else {
							saveStatus="임시저장";
						}
						html += "<tr class='member-tr' data-boardtype='"+boardType+"' data-itemno='"+item.memberNo+"'><td class='listno'>"+item.memberNo+
							   "</td><td class='memberEmail'>"+item.memberEmail+
							   "</td><td class='nickname'>"+item.memberNickname+
							   "</td><td class='memberGrade'>"+item.memberGrade+
							   "</td><td class='name'>"+item.memberName+
							   "</td><td class='petcnt'>"+item.petCnt+
							   "</td><td class='status'>"+item.memberStatus+
							   "</td></tr>"
					};
					return html;
					break;
	}
}	

/* Paging Function */
function updateCurrPg(boardType, pageResult){
	
		console.dir(pageResult);
		console.log(boardType);
		
		$("span.itemcnt[data-boardtype='"+boardType+"']").text(pageResult.count+"개");
		
		var html = "<li ><a class='nostyle firstpage' data-boardtype='"+boardType+
				   "' href='1'>&laquo;First</a></li>"+
            	   "<li ><a class='nostyle previouspage' data-boardtype='"+boardType+"' href='"+(pageResult.pageNo-1)+
            	   "'>&laquo;Previous</a></li>";
        
		for(var i=pageResult.beginPage; i<=pageResult.endPage; i++){
			html += "<li><a href='"+i+"' class='nostyle' data-boardtype='"+boardType+"'>"+i+"</a></li>"
		}
            html += "<li><a href='"+(pageResult.pageNo+1)+"' class='nostyle nextpage' data-boardtype='"+boardType+"'>Next&raquo;</a></li>"+
	                "<li><a href='"+pageResult.lastPage+"' class='nostyle lastpage' data-boardtype='"+boardType+"'>End&raquo;</a>"
        	
	        $("ul.pagination[data-boardtype='"+boardType+"']").html(html);
	                
  			$("a[href='"+pageResult.pageNo+"'][data-boardtype='"+boardType+"']").not(".firstpage, .previouspage, .nextpage, .lastpage").parent().addClass("current");
  			$("a[href=0][data-boardtype='"+boardType+"']").addClass("disabled");
  			$("a[href='"+(pageResult.lastPage+1)+"'][data-boardtype='"+boardType+"']").addClass("disabled");
  			
  			if(pageResult.pageNo===1){
  				$("a.firstpage [data-boardtype='"+boardType+"']").addClass("disabled");
  			}
  			
  			if(pageResult.pageNo===pageResult.lastPage){
  				$("a.lastpage[data-boardtype='"+boardType+"']").addClass("disabled");
  			}
  			
  			if(pageResult.pageNo + 10 > pageResult.lastPage){
  				$("a.lastpage[data-boardtype='"+boardType+"']").addClass("disabled");
  			}
    			
}

</script>    
</body>
</html>