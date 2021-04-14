<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.memberDAO" %>

<%  String id=request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	memberDAO memberdao=memberDAO.getInstance();
	int checkID=memberdao.confirmId(id);
	
	if(checkID==1){
		%>
		<script>
		alert("아이디가 존재합니다. 다른 아이디를 입력하세요.")
		history.go(-1);
		</script>
	<%}else{%>


<jsp:useBean id="member" scope="page"
	class="member.memberDTO">
</jsp:useBean>

<% 

member.setId(id);
member.setPasswd(passwd);


memberdao.insertMember(member);
}%>
<h2>회원가입</h2>
<p>가입이 완료되었습니다.</p>
