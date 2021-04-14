<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <html>
    <body>
    <%
    String[] choice=request.getParameterValues("site");
    String result="";
    
    for(int i=0; i<choice.length; i++)
    	result=result + choice[i] + " ";
     
    %>
    
    <center>
    귀하는
    <font color=blue><%=result %>
    를 좋아하시는군요.
    </font>
    
    
    
    <center>
    </body>
    </html>