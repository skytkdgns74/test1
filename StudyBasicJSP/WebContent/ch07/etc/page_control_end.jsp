<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ch06 : page_control_end.jsp</title>
</head>
<body>
<div align="center">
	<h2>forward action 및 sendRedirect() 결과</h2>
	<hr>
	지금 보이는 화면은 page_control_end.jsp 에서 출력한 결과 입니다.
	<hr>
	이름: <%=request.getParameter("username") %> <br>
	전화번호 : <%=request.getParameter("tel") %>
</div>

</body>
</html>