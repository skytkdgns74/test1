<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>ch11 : set</title>
</head>
<body bgcolor="FFFFFF">

<h3>&lt;c:remove&gtg;</h3>
<c:set value="dinfree" var="msg" />
msg : ${msg} <br>
<c:remove var="msg" />
after remove : ${msg}
</body>
</html>