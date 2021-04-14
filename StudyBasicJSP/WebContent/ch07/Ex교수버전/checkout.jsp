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
	<div align="center">
	<h2>계산</h2><br>
	<p> 선택한 상품 목록 </p>
	<hr>
<%
	ArrayList list=(ArrayList)session.getAttribute("productlist");
	if(list==null){
		out.println("선택한 상품이 없습니다!!");
	}
	else{
		for(Object productname:list) {
			out.println(productname+"<BR>");
		}
	}
%>
</div>
	
	
	
</body>
</html>