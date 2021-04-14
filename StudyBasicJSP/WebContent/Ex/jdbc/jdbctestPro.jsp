
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String name = request.getParameter("name");
	String email=request.getParameter("email");

	
	//DB문장
	Connection conn=null;
	PreparedStatement pstmt=null;
	String str="";
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
		String dbId="jspid";
		String dbPass="jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		//SQL 문장
		String sql="insert into jdbc_test values(?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,email);
		pstmt.executeUpdate();
		
		str="jdbc_test 테이블에 새로운 레코드를 추가했습니다.";
		
	}catch(Exception e){
		e.printStackTrace();
		str="jdbc_test 테이블에 새로운 레코드 추가를 실패했습니다";
	}finally{
			if(pstmt !=null)
				try{pstmt.close();}catch(SQLException sqle){}
			if(conn !=null)
				try{conn.close();}catch(SQLException sqle){}
	}
	%>
	
<html>
<head>
<title>레코드 추가</title>
</head>
<body>	
  <script>
	alert('<%=str%>')
	history.back();
	</script>
	
</body>
</html>