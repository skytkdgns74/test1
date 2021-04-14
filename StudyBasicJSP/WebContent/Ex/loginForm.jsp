<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인 폼</title>
</head>
 <style>
      table { width : 300px; height : 150px;
       border-collapse: collapse; 
        border: 1px solid black;
     
       }
  	 tr { border: 1px solid black;  border-collapse: collapse;  } 
  	 td {  border: 2px solid black;  border-collapse: collapse; }

    </style>
<body>
	
	<div align="center">

	
		<hr>
		<h2>ch07:로그인 예제</h2>
		<hr>
		<form method="post" action="loginPro.jsp">
		<table >
			<tr>
				<td colspan="2" align="center">로그인</td>
			</tr>
			
			<tr>
				<td>아이디</td>
				<td> <input type="text" name="uID"></td>
			</tr>
			
			<tr>
				<td>패스워드</td>
				<td> <input type="text" name="uPW"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="로그인"></td>		
		</table>
		</form>
	</div>
	
</body>
</html>