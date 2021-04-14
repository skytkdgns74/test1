<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ch10:EL 예제</title>
</head>
<body>
<div align="center">
<H2>ch10:EL 예제 - 상품목록</H2>
<hr>
<form name=form1 method=post action=ProductSel.jsp>
	<jsp:useBean id="product" class="jspbook.ch10.Product" scope="session"/>
	<select name="sel">
	<%
		for(String item : product.getProductList()){
			out.println("<option>" + item + "</option>");
		}
	%>
	</select>
	<input type="submit" value="선택"/>
</form>
</div>
</body>
</html>