<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>익스프레션 언어 연산자 연습</title>
</head>
<body>
	X=${param.NUM1},Y=${param.NUM2}<br><br>
	X+Y=${param.NUM1 + param.NUM2}<br>
	X-Y=${param.NUM1 - param.NUM2}<br>
	X*Y=${param.NUM1 * param.NUM2}<br>
	X/Y=${param.NUM1 / param.NUM2}<br>
	X%Y=${param.NUM1 % param.NUM2}<br>
	X가 더 큽니까? X+Y=${param.NUM1 + param.NUM2 >0}<br>
	Y가 더 큽니까? X+Y=${param.NUM1 + param.NUM2 <0}<br>
	X와 Y사 모두 양수입니까? ${(param.NUM1 >0)&&(param.NUM2>0) }<br><br>
	X와 Y가 같습니까? ${param.NUM1 == param.NUM2? "예" : "아니오" }<br><br>
	
</body>
</html>