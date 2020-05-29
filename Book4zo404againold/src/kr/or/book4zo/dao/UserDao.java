package kr.or.book4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.book4zo.dto.UserDto;

public class UserDao {
	static DataSource ds;
	// 1. 생성자에서 ds 객체 초기화
	// 2. static 초기자 : static{ static 멤버 초기화 }
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	static {
		InitialContext ctx;
		try {
			ctx = new InitialContext();
			Context envctx = (Context) ctx.lookup("java:comp/env"); // 기본설정
			ds = (DataSource) envctx.lookup("/jdbc/oracle");// context.xml 에서 name="jdbc/oracle"
		} catch (Exception e) {
			System.out.println("look up Fail : " + e.getMessage());
		}
	}
	/////////////// DB연결부분////////////////
	
	// --------------- user insert 함수 ------------------
	
	
	public int insertRegister(UserDto dto) {
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into users(user_id,user_pwd,user_email,user_name,user_image) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_email());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_image());
 
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("writeOk Exception : " + e.getMessage());
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return row;
	}
	
	// ---------------- 로그인 확인 -----------------
	public boolean userLogin(String user_id, String user_pwd) {
		//관리자이면 True 아니면 False
		boolean isLogin = false;
		System.out.println("userLogin 실행 ");
		//DB연결
		
		try{
			conn = ds.getConnection();

			//관리자 테이블에 id,pw 맞는 데이터가 있는지...
			String sql_Login = "select user_id from users where user_id=? and user_pwd=?";
			pstmt = conn.prepareStatement(sql_Login);
			
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //맞는 데이터가 있으면
				isLogin = true;
			}
			
		} catch(Exception e){
			System.out.println("AdminLogin : " + e.getMessage());
		} finally{
			if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		} 
		return isLogin;
	}
	
	// ---------------- 로그인 한 유저 사진출력ㅜㅜ -----------------
	public String getUser_image(String user_id) {
	      
	      String user_image = null;
	      try {
	           conn = ds.getConnection();
	           String sql="select NVL(user_image,'default.png') user_image from users where user_id = ?";
	           
	           pstmt = conn.prepareStatement(sql);
	           pstmt.setString(1, user_id);
	                      
	           rs = pstmt.executeQuery();
	           
	           if(rs.next()) {
	           user_image = rs.getString("user_image");
	           }
	           
	      }catch (Exception e) {
	         System.out.println("오류 :" + e.getMessage());
	      }finally {
	         try {
	            pstmt.close();
	            rs.close();
	            conn.close();//반환
	         } catch (Exception e2) {
	            
	         }
	         
	      }
	      return user_image;
	   }
	//----------------- 전체 user List 조회 -----------------
	
	public List<UserDto> getUserList() {
		List<UserDto> userList = null;
		
		try { // 다중select던, 단일 select던, 쿼리문만 다르고 리스트로 받고 리스트로 출력하면 편하지않나? 내일 해보기
			conn = ds.getConnection();
			String sql="select user_id,user_pwd,user_email,user_name, NVL(user_image,'default.png') user_image from users";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			userList = new ArrayList<UserDto>();
			while(rs.next()) {
				UserDto dto = new UserDto();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_image(rs.getString("user_image"));
				
				userList.add(dto);
			}
			
		}catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			} catch (Exception e2) {
				
			}
			
		}
		return userList;
	}
	//----------------- user_id로 user List 조회 -----------------
	
		public List<UserDto> getUserListByUser_id(String user_id) {
	        List<UserDto> userList = null;
	        
	        try { // 다중select던, 단일 select던, 쿼리문만 다르고 리스트로 받고 리스트로 출력하면 편하지않나? 내일 해보기
	             conn = ds.getConnection();
	             String sql="select user_id,user_pwd,user_email,user_name, NVL(user_image,'default.png') user_image from users where user_id = ?";
	             pstmt = conn.prepareStatement(sql);
	             pstmt.setString(1, user_id);
	              
	              rs = pstmt.executeQuery();
	              userList = new ArrayList<UserDto>();
	              while(rs.next()) {
	                 UserDto dto = new UserDto();
	                 dto.setUser_id(rs.getString("user_id"));
	                 dto.setUser_pwd(rs.getString("user_pwd"));
	                 dto.setUser_email(rs.getString("user_email"));
	                 dto.setUser_name(rs.getString("user_name"));
	                 dto.setUser_image(rs.getString("user_image"));
	                 
	                 userList.add(dto);
	              }
	             
	        }catch (Exception e) {
	           System.out.println("오류 :" + e.getMessage());
	        }finally {
	           try {
	              pstmt.close();
	              rs.close();
	              conn.close();//반환
	           } catch (Exception e2) {
	              
	           }
	           
	        }
	        return userList;
	     }
}
