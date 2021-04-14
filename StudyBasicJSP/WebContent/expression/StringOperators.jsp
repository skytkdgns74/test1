<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>문자열 비교</title>
</head>
<body>
	입력 문자열 : ${param.STR1}, ${param.STR2}<br><br>
	두 문자열이 같습니까? ${param.STR1 == param.STR2 }<br>
	어느 문자열이 먼저입니까? ${param.STR1 < param.STR2 ? param.STR1 : param.STR2 } <!-- ? A:B >>>>>참이면 A,거짓이면 B -->
</body>
</html>