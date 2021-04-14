<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form name=fileForm method=post enctype=multipart/form=data action=fileLoad.jsp>
	작성자
	<input type=text name=user><br>
	제목
	<input type=text name=title><br>
	파일명
	<input type=file name=upLoadFile><br>
	<input type=submit value=파일올리기><br>
	</form>
</body>
</html>