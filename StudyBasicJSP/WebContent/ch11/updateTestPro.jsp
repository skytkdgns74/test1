<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String passwd=request.getParameter("passwd");
	String name = request.getParameter("name");
	
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
			String sql="select id,passwd from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String rId=rs.getString("id");
				String rPasswd=rs.getString("passwd");
				if(id.equals(rId)&&passwd.equals(rPasswd)){
					sql="update member set name=? where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,name);
					pstmt.setString(2,id);
					pstmt.executeUpdate();
					
%>
	
<html>
<head>
<title>레코드 수정</title>
</head>
<body>
	member 테이블의 레코드를 수정했습니다.
</body>
</html>
<%
					}else
						out.println("패스워드가 틀렸습니다.");
				}else
					out.println("아이디가 틀렸습니다.");
			}catch(Exception e){
				e.printStackTrace();
			}finally{			//try 마지막에 코드를 넣어서 닫아주면 중간에 에러가 나면 캐치해서 클로즈를 실행할 수 없으니까요  닫을 수가 없어서
								//try와 catch 둘다 진행가능. 
					if(rs !=null)
						try{pstmt.close();}catch(SQLException sqle){}
					if(pstmt !=null)
						try{conn.close();}catch(SQLException sqle){}
					if(conn !=null)
						try{conn.close();}catch(SQLException sqle){}
			}

%>
			
			