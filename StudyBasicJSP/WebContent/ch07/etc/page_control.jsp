<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ch06 : page_control.jsp</title>
</head>
<body>
	<H2>forWard, sendRedirect 테스트</H2>
	<hr>
	<form method=post action=forward_action2.jsp>
		forward action : <input type=text name=username>
		<input type=submit value="확인">
	</form>
	
	<form method=post action=response_sendRedirect.jsp>
	response.sendRedirect : <input type=text name=username>
	<input type=submit value="확인">
	</form>
	
</body>
</html>