<%@ page contentType="text/html; charset=euc-kr"%>
<%
	int sum=0;
for(int cnt=1; cnt<=100; cnt++)
	sum +=cnt;
	pageContext.setAttribute("RESULT",new Integer(sum)); //page ������ ������ ��Ʈ����Ʈ�� ����.
%>




<html>
<head><title>1���� 100������ ��</title></head>
<body>
	1���� 100���� ���� �����?${RESULT}  <!--  ${RESULT}  page ������ ������ �ִ� ��Ʈ����Ʈ ���� �����ٰ� ����մϴ�. -->
</body>
</html>