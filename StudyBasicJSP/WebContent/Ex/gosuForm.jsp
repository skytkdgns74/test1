<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>사용자 정보 입력하는 폼</title>
</head>
<body>
	<form method="post" action="gosuPro.jsp">
	<table>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td><input type="text" name="address"></td>
	</tr>

	<tr>
		<td>전화번호</td>
		<td><input type="text" name="tel"></td>
	</tr>
	
	<tr>
		<td>핸드폰번호</td>
		<td><input type="text" name="cellphone"></td>
	</tr>
		
	
	</table>
	<input type="submit" value="전송">
	<input type="reset" value="취소">
	</form>
</body>
</html>