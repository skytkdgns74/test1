<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bean" class="gosu.bean.gosu">
	<jsp:setProperty name="bean" property="name"/>
	<jsp:setProperty name="bean" property="age"/>
	<jsp:setProperty name="bean" property="address"/>
	<jsp:setProperty name="bean" property="tel"/>
	<jsp:setProperty name="bean" property="cellphone"/>
	
</jsp:useBean>
<div align="center">
<h2>사용자정보</h2>
<hr>

<table>
		
	<tr>
		<td>이름</td>
		<td><jsp:getProperty property="name" name="bean"/></td>
	</tr>
	
	<tr>
		<td>나이</td>
		<td><jsp:getProperty property="age" name="bean"/></td>
	</tr>
	
	<tr>
		<td>주소</td>
		<td><jsp:getProperty property="address" name="bean"/></td>
	</tr>

	<tr>
		<td>전화번호</td>
		<td><jsp:getProperty property="tel" name="bean"/></td>
	</tr>
	
	<tr>
		<td>핸드폰번호</td>
		<td><jsp:getProperty property="cellphone" name="bean"/></td>
	</tr>




</table>

</div>
<hr>