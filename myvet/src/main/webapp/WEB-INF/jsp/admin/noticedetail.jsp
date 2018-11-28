<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
src="https://code.jquery.com/jquery-3.3.1.js"
integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<title>Admin - 공지사항 - ${detail.noticeNo }</title>
	<style>
        #body {
        width: 800px;
        margin: auto;
        }
        table > thead > tr > th {
            font-size: 20px;
            height: 30;
        }
        table > thead > tr > td {
            background-color: #a56e50;
            font-size: 12px;
            height: 15px;
            padding: 0px;
        }
        .empty {
            width: 50%;
        }
        .link {
        color:#412427;
        font-size: 15px;
    }
        
/*
*/    </style>
<link rel="stylesheet" href="<c:url value='/resources/css/notice/notice.css'/>"/>

</head>
<body>
	<div id="body">
		<h3>공지사항 상세 - ${detail.noticeNo }</h3>
		
		<table>
			<thead>
				<tr>
					<th colspan="5">
						${detail.noticeTitle }
					</th>
				</tr>
				<tr>
                    <td class="empty"></td>
					<td>
                        글 번호 : ${detail.noticeNo}
                    </td>
                    <td>
                        작성자 :  ${detail.member.memberNickname }
                    </td>
                    <td>
                        작성일 : <fmt:formatDate value="${detail.noticeRegDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                    </td>
                    <td>
                        조회수 : ${detail.noticeViewCnt}
                    </td>
				</tr>
			</thead>
			<tbody>
                <tr>
                    <td id="contnet" colspan="5">
                        ${detail.noticeContent}
                    </td>
                </tr>
            </tbody>
         </table>
         <a class="update link" href="#">수정</a>
         <a class="close link" href="#">닫기</a>
	</div>
<script>
$(".close").click(function(e){
	e.preventDefault();
	window.close();
})
</script>
</body>
</html>