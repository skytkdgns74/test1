<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록에서 하나 선택하기</title>
</head>
<body>
	<p>귀하가 제일 좋아하는 것은?</p>
	
	<form method="post" action="ex1_1.jsp">
		
		<select name="hobby" size="4">
			<option value="게임" selected>게임</option>
			<option value="채팅">채팅</option>
			<option value="등산">등산</option>
			<option value="낚시">낚시</option>
			<option value="여행">여행</option>
			<option value="독서">독서</option>
			<option value="운동">운동</option>
			<option value="기타">기타</option>
		</select><br><br>
		
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	
	</form>
</body>
</html>