<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 페이지</title>
</head>

<body>
<% request.setCharacterEncoding("utf-8");%>
	<div align="center">
	<h2>계산</h2><br>
	<p> 선택한 상품 목록 </p>
	<hr>
	
	<p align="center"><%=session.getAttribute("List").toString()%></p>

	<a href="selProduct.jsp">뒤로가기</a>

	</div>
</body>
</html>