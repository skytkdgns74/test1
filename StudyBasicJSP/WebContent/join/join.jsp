<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<div align="center">

<form method="post" action="joinOk.jsp">
<table border="1">
<tr>
	<td> 아이디 : <input type="text" name="id" maxlength="50"></td>
</tr>	

<tr>	
	<td> 비밀번호: <input type="password" name="passwd" maxlength="16"></td>
</tr>	 
	 
<tr>
<td>이름: <input type="text" name="name" maxlength="16"></td>
</tr>	 

<tr>
<td>주소: <input type="text" name="address" maxlength="50"></td>
</tr>	 
	 
<tr>
<td>전화번호: <input type="text" name="tel" maxlength="16"></td>
</tr>	 

<tr>
<tr><td colspan="2"><input type="submit" value="회원가입"></td>
</tr>
</table>
</form>

</div>

</body>
</html>