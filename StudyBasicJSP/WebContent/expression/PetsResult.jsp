<%@page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>아이 러브 펫</title>
</head>
<body>
	아이디:${param.ID}<br>
	선택한 동물: ${paramValues.ANIMAL[0]}
			 ${paramValues.ANIMAL[1]}
			 ${paramValues.ANIMAL[2]}
	</body>
</html>