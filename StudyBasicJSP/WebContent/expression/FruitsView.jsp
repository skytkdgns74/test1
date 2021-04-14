<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>인기 상품 목록</title>
</head>
<body>
	<h3>이달에 가장 많이 팔린 과일입니다.</h3>
	1위. ${FRUITS[0] }<br>
	1위. ${FRUITS[1] }<br>		<!-- List 객체의 항목을 가져다가 출력하는 EL 식입니다. -->
	1위. ${FRUITS[2] }<br>
</body>
</html>