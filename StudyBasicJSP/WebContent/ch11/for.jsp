<%@ page contentType="text/html; charset=UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>ch11 : forEach</title>
</head>
<body bgcolor="FFFFFF">

<h3>&lt;c:for&gt;</h3>
<c:forEach var="i" items="${member}" begin="0" varStatus="status" end="5">
	index:${status.index} /
	count:${status.count}<br>
	name:${i.name}<br>
	email:${i.email}<br>
	<hr>
</c:forEach>
	
	<c:forTokens items="홍길동,011-211-0090,서울" delims="," var="sel">
		${sel}<br>
		</c:forTokens>
</body>
</html>