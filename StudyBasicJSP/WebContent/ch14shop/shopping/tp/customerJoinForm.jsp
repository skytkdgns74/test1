<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ch14.bookshop.shopping.CustomerDataBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>
<%@ include file="../../etc/color.jspf"%> 
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../../etc/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../../etc/script.js"></script> 
</head>

<body bgcolor="<%=bodyback_c%>">
	<div align="center">
	<h2>회원가입</h2>
	<form method="post" action="customerJoinPro.jsp">
	<table>
	<tr>
	<td>아이디</td>
	<td><input type="text" name="id" maxlength="50"></td>
	</tr>
	
	<tr>
	<td>비밀번호</td>
	<td><input type="password" name="passwd" id="passwd1" maxlength="16"><br></td>
	</tr>
	
	<tr>
	<td>2차 비밀번호</td>
	<td><input type="password" name="passwd2" id="passwd2" maxlength="16" onblur='printName()'></td>
	</tr>
	<tr><td colspan="2"><p id='result' style="color()"></p></td></tr>
	
	
	<tr>
	<td>이름</td>
	<td><input type="text" name="name" maxlength="16"></td>
	</tr>
	
	<tr>
	<td>주소</td>
	<td><input type="text" name="address" maxlength="50"></td>
	</tr>
	
	<tr>
	<td>전화번호</td>
	<td><input type="text" name="tel" maxlength="16"></td>
	</tr>
	</table>
	<input type="submit" value="회원가입">
	</form>


</div>
</body>
</html>