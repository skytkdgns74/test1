<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
    <%  session.invalidate(); %>
	<div align="center">
	<form method="post" action="selProduct.jsp">
	<h2>로그인</h2>
	<input type="text" name="ID">
	<input type="submit" value="로그인">
	</form>
	</div>
</body>
</html>