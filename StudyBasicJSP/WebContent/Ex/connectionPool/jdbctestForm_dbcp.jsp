<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*,javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 이메일 입력후 등록해서 데이터베이스에 저장하기</title>
</head>
<body>
	<form method="post" action="jdbctestPro_dbcp.jsp">
	<div align="center">
		<h2>이벤트 등록</h2>
		<hr>
		등록이름 : <input type="text" name="name">
		emali주소 : <input type="text" name="email">
		<input type="submit" value="등록">		
	</div>
	</form>
	<hr>
	<!----------------------------------------------------->
	<p>#등록 목록</p>
	<table>
	<%
	//DB문장
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int i=1;
	try{
		Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	    conn = ds.getConnection();
		
		//SQL 문장
				String sql="select * from jdbc_test";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					String name=rs.getString("username");
					String email=rs.getString("email");
				
	%>
	<tr>
			<td><%=i%> : <%=name %>	<%=email %></td>
		</tr>
		
	<% 	i+=1; }
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