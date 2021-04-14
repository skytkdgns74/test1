<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*, javax.naming.*" %>

<html>
<head>
<title>커넥션 풀을 사용한 테이블의 레코드를 화면에 표시하는 예제</title>
</head>
<body>
  <h3>커넥션 풀을 사용한 member 테이블의 레코드를 화면에 표시하는 예제</h3>
  <TABLE border="1">
  <TR>
  	<TD width="100">아이디</TD>
  	<TD width="100">패스워드</TD>
  	<TD width="100">이름</TD>
  	<TD width="250">가입일자</TD> 
  </TR>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	Context initCtx = new InitialContext();						//new InitialContext()로 Context 객체를 확보하고 JNDI 이름으로 DataSource 객체를 참조한다.
    Context envCtx = (Context) initCtx.lookup("java:comp/env");	//JNDI 접근은 java:/comp/env 로 Context 객체에 접근한 다음 
    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");	//web.xml에 등록한 JDNI 이름인 jdbc/mysql로 DataSource 객체를 얻는다.
    conn = ds.getConnection();									//Connection 객체는 DataSource의 getConnection() 메서드로 구하게 된다.


	String sql= "select * from member";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
	  String id= rs.getString("id");
      String passwd= rs.getString("passwd");
      String name= rs.getString("name");
      Timestamp register=rs.getTimestamp("reg_date");

%>
     <TR>
  	   <TD width="100"><%=id%></TD>
  	   <TD width="100"><%=passwd%></TD>
  	   <TD width="100"><%=name%></TD>
  	   <TD width="250"><%=register.toString()%></TD>
    </TR>
<%  } 
  }catch(Exception e){ 
		e.printStackTrace();
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>
    
</table>
</body>
</html>