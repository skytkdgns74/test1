<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDataBean" %>
<% request.setCharacterEncoding("utf-8");%>
<%
  String id = (String)session.getAttribute("id");

  if(id==null)
	  response.sendRedirect("../shopMain.jsp"); //세션에 저장된 아이디가 없으면 메인페이지로
  else{
	  CustomerDBBean customerdb = CustomerDBBean.getInstance();
	  
	  CustomerDataBean customer=customerdb.getMember(id); //세션에서 얻어온 아이디로 getMember(id)함수 불러와서 DataBean에 넣기
	  %>  

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../etc/script.js"></script> <!-- 함수 설정해논 파일 사용하기 위해서 -->
</head>
<body>
<h2>회원정보</h2><!-- 아이디 50  이름10 주소100 번호 20-->
<input type="button" value="홈으로" onclick="location.href='../shopMain.jsp'">
<hr>
<form method="post" action="customerUpdatePro.jsp">
<table>
<tr>
<td>아이디</td>
<td><%=customer.getId() %></td>
</tr>

<tr>
<td>비밀번호</td>
<td>	
<input type="password" size="10" maxlength="50" name="passwd" value="" placeholder="반드시 입력하시오">
</tr>

<tr>
<td>이름</td>
<td><input type="text" size="10" maxlength="50" name="name" value="<%=customer.getName() %>" placeholder="반드시 입력하시오"></td>
<p id="inputname"></p>

</tr>

<tr>
<td>주소</td>
<td>	
<input type="text" size="10" maxlength="50" name="address" value="<%=customer.getAddress() %>" placeholder="반드시 입력하시오">
</tr>

<tr>
<td>전화번호</td>
<td>	
<input type="text" size="10" maxlength="50" name="tel" value="<%=customer.getTel() %>" placeholder="반드시 입력하시오">
</tr>

<tr>
<td colspan="2">
<input type="button" value="수정" onclick="CustomerCheckForm(this.form)">	  <!-- 스크립트 파일내 함수 사용 -->
  <input type="reset" value="다시작성">
</td>
</tr>

</table>
</form>


</body>
</html>
<%} %>
