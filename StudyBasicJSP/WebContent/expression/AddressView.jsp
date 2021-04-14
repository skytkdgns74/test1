<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>주소록</title>
</head>
<body>
	${param.NAME}의 주소는?${ADDRESS[param.NAME]}
							    <!-- Map 객체에서 데이터 이름에 해당하는 항목을 찾아서 출력하는 EL 적용입니다. -->
</body>
</html>