<%//1~100까지의 합을 구함
	int sum=0;
for(int cnt=1; cnt<=100; cnt++)
		sum +=cnt;
request.setAttribute("RESULT", new Integer(sum));		//request 데이터 영역에 애트리뷰트를 저장합니다.
RequestDispatcher dispatcher = request.getRequestDispatcher("HundredResult.jsp");
dispatcher.forward(request, response);
%>






<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head><title>1부터 100까지의 합</title></head>
<body>
	1부터 100까지 더한 결과는?${RESULT}  <!--  ${RESULT}  request 데이터 영역에 있는 애트리뷰트 값을 가져다가 출력합니다. -->
</body>
</html>