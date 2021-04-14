<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>익스프레션 언어 연산자 연습</title>
</head>
<body>
	${param.NUM1}을${param.NUM2}로 나눈 몫은? ${param.NUM1 div param.NUM2}<br>
	나머지는? ${param.NUM1 mod param.NUM2}<br><br>
	둘 다 양수입니까? ${(param.NUM1 gt 0) and (param.NUM2 gt 0)}<br>
	둘 다 음수입니까? ${(param.NUM1 lt 0) and (param.NUM2 lt 0)}<br>
	</body>
</html>