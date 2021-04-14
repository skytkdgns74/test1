<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
<html>
<head>
<title>레코드 표시</title>
</head>
<body>
	<h2>member 테이블의 레코드 표시</h2>
	<table border="1">
	<tr>
		<td width="100">아이디</td>
		<td width="100">패스워드</td>
		<td width="100">이름</td>
		<td width="250">가입일자</td>
	</tr>
	
	<%
	//DB문장
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
		String dbId="jspid";
		String dbPass="jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		//SQL 문장
				String sql="select * from member";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					String id=rs.getString("id");
					String passwd=rs.getString("passwd");
					String name=rs.getString("name");
					Timestamp register=rs.getTimestamp("reg_date");
	%>
		<tr>
			<td width="100"><%=id %></td>
			<td width="100"><%=passwd %></td>
			<td width="100"><%=name %></td>
			<td width="250"><%=register.toString() %></td>
		</tr>
	<% }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs !=null)
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt !=null)
			try{rs.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{rs.close();}catch(SQLException sqle){}
	}
	%>
	
	</table>
</body>
</html>