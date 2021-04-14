<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2></h2>
<%String id=session.getAttribute("id"); %>
session.getAttribute("id")==null

 <input type="button"  value="로그아웃" 
        onclick="javascript:window.location='logout.jsp'">
</body>
</html>