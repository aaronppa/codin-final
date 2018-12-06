<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 상세 - 회원번호=${detail.memberNo}/회원닉네임=${detail.memberName}</title>
</head>
<body>
${detail }
<script>
/* ESC 버튼 Keydown시 창 닫힘 */
$(document).keydown(function(e) {
    // ESCAPE key pressed
    if (e.key == 'Escape') {
    	console.log( 'escape pressed' );
        window.close();
    };
});
</script>
</body>
</html>