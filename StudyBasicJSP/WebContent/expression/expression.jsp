<%//1~100������ ���� ����
	int sum=0;
for(int cnt=1; cnt<=100; cnt++)
		sum +=cnt;
request.setAttribute("RESULT", new Integer(sum));		//request ������ ������ ��Ʈ����Ʈ�� �����մϴ�.
RequestDispatcher dispatcher = request.getRequestDispatcher("HundredResult.jsp");
dispatcher.forward(request, response);
%>






<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head><title>1���� 100������ ��</title></head>
<body>
	1���� 100���� ���� �����?${RESULT}  <!--  ${RESULT}  request ������ ������ �ִ� ��Ʈ����Ʈ ���� �����ٰ� ����մϴ�. -->
</body>
</html>