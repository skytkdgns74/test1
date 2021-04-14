<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 화면 selProduct.jsp</title>
</head>
<%
	request.setCharacterEncoding("UTF-8"); //한글코딩
	session.setAttribute("username",request.getParameter("username"));
%>
<body>
	<div align="center">
	<h2>상품선택</h2>
	<hr>
	<%=session.getAttribute("username")%>님 환영합니다!!!
	
	<hr>
	
	<!-- 선택목록 생성후 추가 누르면. add.jsp로 보내라.  -->
	<form name="form1" method="post" action="add.jsp">
	
	<select name="product">
		<option value="사과">사과</option>
		<option value="딸기">딸기</option>
		<option value="수박">수박</option>
		<option value="배">배</option>
	</select>
	<input type="submit" value="추가">
	</form>
	
	
	<!-- 계산 을 링크로 만들어서 클릭시 checkout.jsp로 보냄 -->
	<a href="checkout.jsp">계산</a>
	
	</div>
</body>
</html>