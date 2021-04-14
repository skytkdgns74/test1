<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" href="requestTestForm.css"/>
<body>    
    
<% request.setCharacterEncoding("utf-8"); %> <!-- 한글 안깨지게 -->

<%
	String job=request.getParameter("job");
    String name=request.getParameter("name");
    String interesting=request.getParameter("interesting");   
     
%>    
<h2>request 테스트 결과 - 1</h2>      

<hr>
<table class="b2">
	<tr class="b2">
		<td class="b2">이름</td>
		<td class="b2"><%=name %></td>
	</tr>
	
	<tr class="b2">
		<td class="b2">직업</td>
		<td class="b2"> <%=job %> </td>
	</tr>
	
	<tr class="b2">
		<td class="b2">관심분야</td>
		<td class="b2"><%=interesting %></td>
	</tr>
	

</table>

</body>
</html>