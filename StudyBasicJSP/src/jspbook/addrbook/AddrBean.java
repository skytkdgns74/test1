package jspbook.addrbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddrBean {

	Connection conn=null;
	PreparedStatement pstmt=null;
	

		String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
		String dbId="jspid";
		String dbPass="jsppass";
		//DB 연결 메소드
		void connect() {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			} catch(Exception e ) {
				e.printStackTrace();
			}
		}
		
		void disconnect() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e ) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pstmt.close();
				} catch(Exception e ) {
					e.printStackTrace();
				}
			}
		}
	
		//업데이트
		public boolean updateDB(AddrBook addrbook) {
			connect();
			
			String sql="update addrbook set ab_name=?,ab_email=?, ab_birth=?, ab_tel=?, ab_comdept=?,ab_memo=? where ab_id=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,addrbook.getAb_name());
				pstmt.setString(2,addrbook.getAb_email());
				pstmt.setString(3,addrbook.getAb_birth());
				pstmt.setString(4,addrbook.getAb_tel());
				pstmt.setString(5,addrbook.getAb_comdept());
				pstmt.setString(6,addrbook.getAb_memo());
				pstmt.setInt(7,addrbook.getAb_id());
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}finally{ disconnect();	}
			
			
			return true;
			
		}
		
		//딜리트
		
		public boolean deleteDB(int gb_id) {
			connect();
			
			String sql="delete from addrbook where ab_id=?";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,gb_id);
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}finally{ disconnect();	}
			
			
			return true;
			
		}
		
		//인서트
		
		public boolean insertDB(AddrBook addrbook) {
			connect();
			//sql 문자열, gb_id 는 자동 등록 되므로 입력하지 않는다.
			String sql="insert into addrbook(ab_name,ab_email, ab_birth, ab_tel, ab_comdept,ab_memo) value(?,?,?,?,?,?)";
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,addrbook.getAb_name());
				pstmt.setString(2,addrbook.getAb_email());
				pstmt.setString(3,addrbook.getAb_birth());
				pstmt.setString(4,addrbook.getAb_tel());
				pstmt.setString(5,addrbook.getAb_comdept());
				pstmt.setString(6,addrbook.getAb_memo());
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}finally{ disconnect();	}
			
			
			return true;
			
		}
		
		// 셀렉트 - 특정 주소록 게시글 가져오는 메서드
		public AddrBook getDB(int gb_id) {
		connect();

		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();

		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,gb_id);
		ResultSet rs = pstmt.executeQuery();

		// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
		rs.next();
		addrbook.setAb_id(rs.getInt("ab_id"));
		addrbook.setAb_name(rs.getString("ab_name"));
		addrbook.setAb_email(rs.getString("ab_email"));
		addrbook.setAb_birth(rs.getString("ab_birth"));
		addrbook.setAb_tel(rs.getString("ab_tel"));
		addrbook.setAb_comdept(rs.getString("ab_comdept"));
		addrbook.setAb_memo(rs.getString("ab_memo"));
		rs.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally {disconnect();	}
		return addrbook;
		}

		// 전체 주소록 목록을 가져오는 메서드
		public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<AddrBook>();

		String sql = "select * from addrbook order by ab_id desc";
		try {
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
		AddrBook addrbook = new AddrBook();

		addrbook.setAb_id(rs.getInt("ab_id"));
		addrbook.setAb_name(rs.getString("ab_name"));
		addrbook.setAb_email(rs.getString("ab_email"));
		addrbook.setAb_comdept(rs.getString("ab_comdept"));
		addrbook.setAb_birth(rs.getString("ab_birth"));
		addrbook.setAb_tel(rs.getString("ab_tel"));
		addrbook.setAb_memo(rs.getString("ab_memo"));
		datas.add(addrbook);
		}
		rs.close();

		} catch (SQLException e) {
		e.printStackTrace();
		}
		finally { disconnect(); }
		return datas;
		}
		
				
}
