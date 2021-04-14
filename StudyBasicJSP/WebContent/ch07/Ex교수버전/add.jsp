<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE>
<html>
<head>
<title>상품 추가. add.jsp</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8");
	String productname = request.getParameter("product");
	ArrayList<String> list=(ArrayList)session.getAttribute("productlist");
	if(list == null) {
		list = new ArrayList<String>();
		session.setAttribute("productlist",list);
	}
	list.add(productname);
	%>

	<!-- 새창을 띄우면서 메시지가 나오고. history.back()로 전의 화면으로 돌아감 -->
	<script>
	alert("<%=productname %>이(가) 추가되었습니다.!!");
	history.go(-1);	//전화면으로
	</script>
	
	
</body>
</html>