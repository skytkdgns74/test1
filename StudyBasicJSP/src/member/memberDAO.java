package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class memberDAO {
	
	private static memberDAO instance = new memberDAO();
	   
    public static memberDAO getInstance() {
    	return instance;
    }
    //DB접속
	 private Connection getConnection() throws Exception {
	        Context initCtx = new InitialContext();
	        Context envCtx = (Context) initCtx.lookup("java:comp/env");
	        DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	        return ds.getConnection();
	    }
	
	 //회원가입 - mysql member2 테이블 insert 
	public void insertMember(memberDTO member) 
		    throws Exception {
		    	Connection conn = null;
		        PreparedStatement pstmt = null;
		        
		        try {
		            conn = getConnection();
		           
		            pstmt = conn.prepareStatement(
		           	 "insert into member2 values (?,?,?,?,?,?)");
		            pstmt.setString(1, member.getId());
		            pstmt.setString(2, member.getPasswd());
		            pstmt.setString(2, member.getPasswd());
		            pstmt.setString(2, member.getPasswd());
		            pstmt.setString(2, member.getPasswd());
		            pstmt.setString(2, member.getPasswd());
		            
		            pstmt.executeUpdate();
		        }catch(Exception ex) {
		        	ex.printStackTrace();
		        } finally {
		            if (pstmt != null) 
		            	try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) 
		            	try { conn.close(); } catch(SQLException ex) {}
		        }
		    }
	
	//중복아이디 체크 
	 public int confirmId(String id) 
			 throws Exception {
				 Connection conn = null;
		         PreparedStatement pstmt = null;
				 ResultSet rs= null;
				 int x=-1;
		       
				 try {
					 conn = getConnection();
		           
		             pstmt = conn.prepareStatement(
		           	  "select id from membertest where id = ?");
		             pstmt.setString(1, id);
		             rs= pstmt.executeQuery();

					 if(rs.next())
						 x= 1; //해당 아이디 있음
					 else
						 x= -1;//해당 아이디 없음		
		         }catch(Exception ex) {
		             ex.printStackTrace();
		         } finally {
					 if (rs != null) 
						 try { rs.close(); } catch(SQLException ex) {}
		             if (pstmt != null) 
		            	 try { pstmt.close(); } catch(SQLException ex) {}
		             if (conn != null) 
		            	 try { conn.close(); } catch(SQLException ex) {}
		         }
				 return x;
			 }
	 
	 //회원 인증
	 public int userCheck(String id,String passwd) 
			 throws Exception {
				 Connection conn = null;
		         PreparedStatement pstmt = null;
		         ResultSet rs= null;
				 String dbpasswd="";
		         int x=-1;
		         
				 try {
		        	 conn=getConnection();
		        	 
		        	 pstmt=conn.prepareStatement(
		        			 "select passwd from member2 where id=?");
		        	 pstmt.setString(1, id);
		        	rs=pstmt.executeQuery();
		        	
		        	if(rs.next()) {//id가 ?인 행의 값을 가져옴.true이면 실행.
		        		dbpasswd=rs.getString("passwd");
		        		if(dbpasswd.equals(passwd)) //dbpasswd가 입력 passwd와 같으면
		        			x=1; //인증 성공
		        		else
		        			x=0; //비밀번호 틀림
		        	   	}else //id ?가 없으면.false면
		        	   		x=-1; //아이디 없음.
		        			 
		         }catch(Exception ex) {
		             ex.printStackTrace();
		         } finally {
					 if (rs != null) 
						 try { rs.close(); } catch(SQLException ex) {}
		             if (pstmt != null) 
		            	 try { pstmt.close(); } catch(SQLException ex) {}
		             if (conn != null) 
		            	 try { conn.close(); } catch(SQLException ex) {}
		         }
				 return x; //해당 x값 리턴. 1성공.0비번오류.-1아이디없음
		         
		         
	 }
	 //회원 정보 불러오기(select)
	 public memberDTO getMember(String id) 
			 throws Exception {
		 Connection conn=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 memberDTO member=null;
		 
		 try {
			 conn=getConnection();
			 pstmt=conn.prepareStatement(
					"select * from member2 where id=?");
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();
			 
			 if(rs.next()) {//값을 읽어올 수 있으면. 실행
				 member=new memberDTO(); //member는 memberDTO() 빈이다.
				 //rs.getString() 읽어온 데이터를 memberDTO에 셋팅해라.
				 member.setId(rs.getString("id"));
				 member.setPasswd(rs.getString("passwd"));
				 member.setName(rs.getString("name"));
				 member.setReg_date(rs.getTimestamp("reg_date"));
				 member.setTel(rs.getString("tel"));
				 member.setAddress(rs.getNString("address"));
			 }
		 }catch(Exception ex) {
             ex.printStackTrace();
         } finally {
			 if (rs != null) 
				 try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) 
            	 try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) 
            	 try { conn.close(); } catch(SQLException ex) {}
         }
		 return member;	//셋팅한 member값 리턴
		 
		 
	 }
	 
	 //회원 정보 수정
	 public void updateMember(memberDTO member)
	 throws Exception {
		 Connection conn=null;
		 PreparedStatement pstmt=null;
		 
		 try {
			 conn=getConnection();
			 pstmt=conn.prepareStatement(
					 "update member set passwd=?,name=?,tel=?,address=?");
			 pstmt.setString(1, member.getPasswd());
			 pstmt.setString(2, member.getName());
			 pstmt.setString(3, member.getTel());
			 pstmt.setString(4, member.getAddress());
			 
			 pstmt.executeUpdate();
		 }catch (Exception ex) {
			 ex.printStackTrace();
		}finally {
			if(pstmt !=null)
				try {pstmt.close();}catch(SQLException ex) {}
			if(conn!=null)
				try {conn.close();}catch(SQLException ex) {}
		}
	 }
	 
	 //회원 탈퇴
	 public int deleteMember(String id,String passwd) 
		 throws Exception {
			 Connection conn=null;
			 PreparedStatement pstmt=null;
			 ResultSet rs=null;
			 String dbpasswd="";
			 int x=-1;
			 
			 try {
				 conn=getConnection();
				 
				 pstmt=conn.prepareStatement(
						 "delete from member2 where passwd=?");
				 
			 
			 }catch (Exception ex) {
				 ex.printStackTrace();
				}finally {
					if(pstmt !=null)
						try {pstmt.close();}catch(SQLException ex) {}
					if(conn!=null)
						try {conn.close();}catch(SQLException ex) {}
				}
			 return x;
		 }
	 
	 
	
}
