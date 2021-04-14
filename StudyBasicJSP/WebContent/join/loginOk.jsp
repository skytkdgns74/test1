<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CustomerDataBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>

<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
	CustomerDBBean customerdb=CustomerDBBean.getInstance();
	int check=customerdb.userCheck(id,passwd);
	
	if(check==1){
		session.setAttribute("id",id);
		response.sendRedirect("main.jsp");
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
	<%}else{%>
		<script> 
		  alert("해당 아이디가 없습니다.");
	      history.go(-1);
		</script>
	<%}
	
%>