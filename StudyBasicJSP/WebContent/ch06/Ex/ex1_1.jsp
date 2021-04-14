<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<body>
<% request.setCharacterEncoding("utf-8"); %> <!-- 한글 안깨지게 -->

<%
		String choice=request.getParameter("hobby");
%>    

<center>
귀하는
<font color="blue">
<% out.print(choice); %>
</font>
를 제일 좋아하시는군요!
</center>
</body>
</html>