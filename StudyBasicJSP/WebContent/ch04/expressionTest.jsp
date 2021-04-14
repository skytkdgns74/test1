<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식 예제 - 배열의 특정요소의 내용 출력</title>
</head>
<body>
	<%
		//배열의 초기화 블럭을 사용하면 배열의 선언, 메모리할당,초기값 설정을 한번에 할 수 있다.
		String[] str={"JSP", "JAVA", "Android", "HTML5"};
		int i = (int)(Math.random()*4); //0~3사이의 값이 임의로 설정된다
	%>
	
	<%=str[i] %> 가(이) 재미있다.
</body>
</html>