package kr.or.book4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.book4zo.dto.ReplyDto;


public class ReplyDao {
	static DataSource ds;
	   //1. 생성자에서 ds 객체 초기화
	   //2. static 초기자 : static{ static 멤버 초기화 }
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   static {
	      InitialContext ctx;
	      try {
	          ctx = new InitialContext();
	          Context envctx= (Context)ctx.lookup("java:comp/env"); //기본설정
	          ds =(DataSource)envctx.lookup("/jdbc/oracle");//context.xml 에서 name="jdbc/oracle"
	      }catch (Exception e) {
	         System.out.println("look up Fail : " + e.getMessage());
	      }
	       
	   }
	   
	   
	   //리플 리스트
	   public List<ReplyDto> getReplyList(String book_seq) {
		      List<ReplyDto> replyList = null;
//		      NVL(image,'default.png')
		      try {
		           conn = ds.getConnection();
		           String sql="select  NVL(image,'default.png') image,empno,ename,job,mgr,hiredate,sal,comm,deptno,  image from emp";
		           pstmt = conn.prepareStatement(sql);
		            
		            rs = pstmt.executeQuery();
		            replyList = new ArrayList<ReplyDto>();
		            while(rs.next()) {
		               ReplyDto reply = new ReplyDto();
		               reply.setReply_seq(rs.getInt("reply_seq"));
		               reply.setBook_seq(Integer.parseInt(book_seq));
		               reply.setReply_like(rs.getInt("reply_like"));
		               reply.setRefer(rs.getInt("refer"));
		               reply.setDepth(rs.getInt("depth"));
		               reply.setStep(rs.getInt("step"));
		               reply.setUser_id(rs.getString("user_id"));
		               reply.setReply_content(rs.getString("reply_content"));
		               reply.setReply_date(rs.getString("reply_date"));
		               
		               replyList.add(reply);
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
		      return replyList;
		   }
	   //리플 인서트
	   public boolean replyWrite(ReplyDto reply) {
		   //String user_id,int book_seq, int reply_star_rate, String reply_content, String reply_date, int reply_like, int refer, int depth, int step
			int num = 0;
			String sql = "";

			int result = 0;

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement("select ? from board");
				pstmt.setInt(1,reply.getBook_seq());
				rs = pstmt.executeQuery();

				if (rs.next()) { System.out.println("pstmt.executeQuery() : "+ rs);}
				
				
				sql = "insert into reply (REPLY_SEQ,USER_ID,BOOK_SEQ,REPLY_STAR_RATE,";
				sql += "REPLY_CONTENT, REPLY_DATE, REPLY_LIKE,"
						+ "REFER,DEPTH,STEP) values(REPLY_SEQ.NEXTVAL,?,?,?,?,sysdate,?,?,?,?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reply.getUser_id());
				pstmt.setInt(2, reply.getBook_seq());
				pstmt.setInt(3, reply.getReply_star_rate());
				pstmt.setString(4, reply.getReply_content());
				pstmt.setInt(5, reply.getReply_like());
				pstmt.setInt(6, reply.getRefer());
				pstmt.setInt(7, reply.getDepth());
				pstmt.setInt(8, reply.getStep());

				result = pstmt.executeUpdate();
				if (result == 0)
					return false;

				return true;
			} catch (Exception ex) {
				System.out.println("boardInsert 에러 : " + ex);
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
			return false;
		}
	   
}

