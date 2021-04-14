<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html public "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8"); %>
<!-- 태그.        page 작동할 jsp -->
<jsp:forward page="page_control_end.jsp">
	<jsp:param name="tel" value="000-000-0000" />
</jsp:forward>