<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${notice.noticeTitle } - 공지사항 - MyVet</title>
	<style>
        #body {
        width: 80%;
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
            width: 60%
        }
        .link {
        color:#412427;
        font-size: 15px;
    }
        
/*
*/    </style>
<link rel="stylesheet" href="<c:url value='/css/notice/notice.css'/>"/>

</head>
<body>
	<c:import url="/WEB-INF/jsp/common/topBar.jsp" />            
	<div id="body">
		<h1>공지사항</h1>
		
		<table>
			<thead>
				<tr>
					<th colspan="5">
						${notice.noticeTitle }
					</th>
				</tr>
				<tr>
                    <td class="empty"></td>
					<td>
                        글 번호 : ${notice.noticeNo}
                    </td>
                    <td>
                        작성자 :  관리자
                    </td>
                    <td>
                        작성일 : <fmt:formatDate value="${notice.noticeRegDate}" pattern="yyyy-MM-dd HH:mm:ss"/> 
                    </td>
                    <td>
                        조회수 : ${notice.noticeViewCnt}
                    </td>
				</tr>
			</thead>
			<tbody>
                <tr>
                    <td id="contnet" colspan="5">
                        ${notice.noticeContent}
                    </td>
                </tr>
            </tbody>
         </table>
         <a class ="link" href="<c:url value="/notice/list.do"/>">목록으로</a>
	</div>
</body>
</html>