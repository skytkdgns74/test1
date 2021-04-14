<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE>
<html>
<head>
<title>상품 추가. add.jsp</title>
</head>
<body>
<%!ArrayList<String> list; //ArrayList 배열 생성%>


	<%
	//한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
	//selProduct.jsp 에서 fruit값 가져와서 재설정		
	String Fruit = request.getParameter("fruit");
	
	
	//배열 list 값이 없으면 새로 만들어라
	if(list==null){list=new ArrayList<String>();}
	//list배열에 Fruit값을 추가해라
	list.add(Fruit);
	//session에 "List"라는 곳에 배열list를 입력해라
	session.setAttribute("List",list);

	
	%>

	<!-- 새창을 띄우면서 메시지가 나오고. history.back()로 전의 화면으로 돌아감 -->
	<script>
	alert('상품이 추가되었습니다.')
	history.back();
	</script>
	
	
</body>
</html>