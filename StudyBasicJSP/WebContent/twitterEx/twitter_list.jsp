<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인. twitter_list.jsp</title>
</head>
<%
	request.setCharacterEncoding("UTF-8"); //한글코딩
	//session.setAttribute("username",request.getParameter("username"));
	String username = request.getParameter("username");
	if(username != null){
		session.setAttribute("username",username);
	}
%>
<body>
	<div align="center">
	<h2>My simple Twitter!!</h2>
	<hr>
		<form method="post" action="tweet.jsp">
	@<%= session.getAttribute("username") %>

	<input type="text" name="msg">
	<input type="submit" value="Tweet">
	</form>
	
	<form method="post" action="logout.jsp">
	<input type="submit" value="로그아웃">
	</form>

	<hr>
	</div>
		
	<input type="button" value="clear"
	onclick="ArrayList<String> msgs=new (ArrayList<String>)application.getAttribute("msgs");"
	>		

		<ul> <!-- li를 사용하기 위해 설정 -->
	<%
	
	//application 내장객체를 통해 msgs 이름으로 저장된 ArrayList를 가지고옴
	ArrayList<String> msgs=(ArrayList<String>)application.getAttribute("msgs");

	if(msgs != null){
		for(String msg : msgs) {
			out.println("<li>" +msg);	//li는 목록처럼 ●표시함
		}
	}
	
	%>
	</ul>
	
</body>
</html>