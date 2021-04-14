<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>
<%@ page import="ch14.bookshop.shopping.CustomerDataBean" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
String id = (String)session.getAttribute("id");
String passwd=request.getParameter("passwd");
String name=request.getParameter("name");
String address=request.getParameter("address");
String tel=request.getParameter("tel");
%>


<%  //script.js 사용 안할시 사용 if-else문
	if(name=="" || address=="" || tel=="" || passwd==""){%>
	<script>
	alert("정보를 반드시 입력하세요.")
	history.go(-1);
	</script>
	<%}else{%>
		<jsp:useBean id="member" scope="page" 
       class="ch14.bookshop.shopping.CustomerDataBean">
</jsp:useBean>
		<%
		member.setPasswd(passwd);             
		member.setName(name);
		member.setTel(tel);
		member.setAddress(address);
		member.setId(id);
		CustomerDBBean customerdb = CustomerDBBean.getInstance();	
		customerdb.updateMember(member);
		
	}%>
	<script>
	alert("수정되었습니다.")
	location.href="../shopMain.jsp";
	</script>
