<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bean" class="login.bean.login"/>
<jsp:setProperty name="bean" property="*"/>



<%
	String uID=bean.getuID();
	String uPW=bean.getuPW();
	String kID=bean.getkID();
	String kPW=bean.getkPW();

%>

<div align="center">
	<h2>로그인 예제</h2>
	<hr>
	<% 
	if((kID.equals(uID)) && (kPW.equals(kID)) ){
		out.print("로그인 성공");}
	else{
		out.print("로그인 실패");}
	%>
	<hr>
	사용자 아이디 :  <jsp:getProperty property="uID" name="bean"/> <br>
	사용자 패스워드 : <jsp:getProperty property="uPW" name="bean"/> 
	
</div>