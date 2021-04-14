<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookie=new Cookie("NAME","Jone");
	response.addCookie(cookie);
%>
<HTML>
	<HEAD><TITLE>쿠키 데이터 저장 프로그램</TITLE></HEAD>
<BODY>
	쿠키 값이 설정되었습니다.
</BODY>
</HTML>