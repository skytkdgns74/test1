<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인폼</title>
</head>
<body>
	<h2>로그인폼</h2>
	
	<form method="post" action="sessionLoginPro.jsp">
		아이디:<input type="text" name="id" maxlength="50"><br>
		패스워드:<input type="text" name="passwd" maxlength="16"><br>
		<input type="submit" value="로그인">
		<input type="submit" value="회원가입"
			onclick="location.href='insertMemberForm.jsp'">
	</form>
</body>
</html>