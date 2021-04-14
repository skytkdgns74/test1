<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CustomerDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8");%>
<%
	String id=request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	
	CustomerDBBean customerdb = CustomerDBBean.getInstance();
	int checkID = customerdb.confirmId(id);
	
	//confirmId 중복 아이디체크. 1있음.-1없음.
	if(checkID == 1){
	
	%>
	<script>
	alert("아이디가 존재합니다. 다른 아이디를 입력하세요.")
	history.go(-1);
	</script>
	<%}else{%>
	
	<jsp:useBean id="member" scope="page" 
       class="ch14.bookshop.shopping.CustomerDataBean">
</jsp:useBean>
	
		<%
		member.setId(id);
		member.setPasswd(passwd);
		member.setName(name);
		member.setTel(tel);
		member.setAddress(address);
		
		
		 
	member.setReg_date(new Timestamp(System.currentTimeMillis()));	
	customerdb.insertMember(member);
	}
%>
<!-- response.sendRedirect("../shopMain.jsp")를 하였으나 alert 작동안하고 바로 넘어감. 이유는 jsp태그 > html태그 우선순위 때문 -->
<script>
	alert("가입성공")
	location.href="../shopping/shopMain.jsp"
	</script>


