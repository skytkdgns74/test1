<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%
	HashMap<String,String>map=new HashMap<String,String>();
	map.put("Edgar","보스턴");
	map.put("Thomas","오하이오");
	map.put("Jhon","워싱턴");
	request.setAttribute("ADDRESS",map);
	RequestDispatcher dispatcher=request.getRequestDispatcher("AddressView.jsp");
	dispatcher.forward(request,response);
	%>