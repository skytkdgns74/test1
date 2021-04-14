<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{ text-align:center;}
</style>
</head>
<body>
<div align="center">
<h2>회원가입</h2>
<hr>
	<form method="post" action="Control.jsp">
	<table border="1">
	<tr align=center>
	<td >이름</td>
	<td><input type="text" name="id"></td>
	</tr>
	
	<tr>
	<td>빌민번호</td>
	<td><input type="password" name="passwd"></td>
	</tr>
	
	<tr>
	<td colspan="2"><input type="submit" value="저장"></td>
	</tr>
	
	</table>
	</form>
	</div>
</body>
</html>