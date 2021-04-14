<%@ page contentType="text/html; charset=euc-kr"%>
<%
	int sum=0;
for(int cnt=1; cnt<=100; cnt++)
	sum +=cnt;
	pageContext.setAttribute("RESULT",new Integer(sum)); //page 데이터 영역에 애트리뷰트를 저장.
%>




<html>
<head><title>1부터 100까지의 합</title></head>
<body>
	1부터 100까지 더한 결과는?${RESULT}  <!--  ${RESULT}  page 데이터 영역에 있는 애트리뷰트 값을 가져다가 출력합니다. -->
</body>
</html>