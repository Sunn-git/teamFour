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



import kr.or.book4zo.dto.PostDto;

public class PostDao {
	  
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
		       //Context context = new InitialContext(); //이름기반 검색
		       //ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool 검색
		      
		   }
	
	   /////////////////////////////////////////////////////////////////////////////////DB연결부분
	   //연결 해제
	      public void closed(){
	         try{
	            if(rs!=null)rs.close();         
	            if(pstmt!=null)pstmt.close();
	            if(conn!=null)conn.close();
	         }catch(Exception e){
	            e.printStackTrace();
	         }
	      }
	      
		   // 글의 개수를 구하는 함수
			// List.jsp
			public int getListCount() {
				// select count(*) from post
				int rowcount = 0;
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement("select count(*) from post");
					rs = pstmt.executeQuery();
					if (rs.next()) {
						rowcount = rs.getInt(1);
					}
				} catch (Exception e) {

				} finally {
					closed();
				}
				return rowcount;
			}
	      
	      
	      
	      
	      // Post의 리스트 구성
			// List.jsp
			public List getpostList(int page, int limit) {
				// 글 목록 보기
				/*
				 * 18건 
				 * pagesize = 5 
				 * pagelist = 4개        1~5 , 5~10 , 11~15 , 16~18 
				 * pageindex = 3        11~15개의 데이터
				 * 
				 * BoardDto page = new BoardDto(); =>Table Row 한건 여러건의 데이터 배열
				 */
				// List.jsp
				// page =2 , limit =10(pagesize)
			
				String post_list_sql = "select * from "
						+ "(select rownum rnum,Post_Seq,User_Id,Book_Seq,"
						+ "Post_Title,Post_Contents,TO_CHAR(BOARD_DATE, 'YYYY/MM/DD') AS Post_Date"
						+ "nvl( Post_Upload_File, '*') Post_Upload_File from "
						+ "(select * from post )) "
						+ "where rnum>=? and rnum<=?";

				List list = new ArrayList();
				// List<Article> articleList = new ArrayList<Article>();
				// 권장방식 generic 사용
				int startrow = (page - 1) * 10 + 1;
				// Code //읽기 시작할 row 번호.
				// (2-1)*10+1 (1)*10+1 10 +1 11
				// page 없어 : 1
				int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
				// 11 +10 => 21-1 => 20
				// page 없어 : 10
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(post_list_sql);
					pstmt.setInt(1, startrow); // 11 21 code
					pstmt.setInt(2, endrow); // 20 30 code
					rs = pstmt.executeQuery();

					while (rs.next()) {
						PostDto postdto = new PostDto(); // 한 건의
						postdto.setPost_Seq(rs.getInt("Post_Seq"));
						postdto.setUser_Id(rs.getString("User_Id"));
						postdto.setBook_Seq(rs.getInt("Book_Seq"));
						postdto.setPost_Title(rs.getString("Post_Title"));
						postdto.setPost_Contents(rs.getString("Post_Contents"));
						postdto.setPost_Date(rs.getString("Post_Date"));
						postdto.setPost_Views(rs.getInt("Post_Views"));
						postdto.setPost_Upload_File(rs.getString("Post_Upload_File"));

						list.add(postdto); // key point (여러건의 데이터 collection사용)
					}

					return list;
				} catch (Exception ex) {
					System.out.println("getPostList 에러 : " + ex);
				} finally {
					closed();
				}
				return null;
			}
			// 글 내용 보기.
			// view.jsp
			public PostDto getDetail(int number) throws Exception {

				PostDto postdto = null;
				try {
					conn = ds.getConnection();
					pstmt = conn
							.prepareStatement("select Number,User_Id,Post_Title,"
						+ "Contents,Date,Post_Number,TO_CHAR(DATE, 'YYYY/MM/DD') AS DATE,"
						+ "Post_Upload_File from post where NUMBER = ?");
					pstmt.setInt(1, number);

					rs = pstmt.executeQuery();

					if (rs.next()) {
						postdto = new PostDto();
						postdto.setPost_Seq(rs.getInt("Post_Seq"));
						postdto.setUser_Id(rs.getString("User_Id"));
						postdto.setBook_Seq(rs.getInt("Book_Seq"));
						postdto.setPost_Title(rs.getString("Post_Title"));
						postdto.setPost_Contents(rs.getString("Post_Contents"));
						postdto.setPost_Date(rs.getString("Post_Date"));
						postdto.setPost_Views(rs.getInt("Post_Views"));
						postdto.setPost_Upload_File(rs.getString("Post_Upload_File"));
					}
					return postdto;
				} catch (Exception ex) {
					System.out.println("getDetail 에러 : " + ex);
				} finally {
					closed();
				}
				return null;
			}

			// 글 등록
			// write.jsp
			public boolean postInsert(PostDto postdto) {
				
				System.out.println("postdto 확인 : "+postdto);
				
				int num = 0;
				String sql = "";

				int result = 0;

				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement("select max(Post_Seq) from post");
					rs = pstmt.executeQuery();

					if (rs.next())
						num = rs.getInt(1) + 1;
					else
						num = 1;
					
					if(postdto.getPost_Upload_File() == null){
					    postdto.setPost_Upload_File("N");
					   }
					
					sql = "insert into post (POST_SEQ,USER_ID,BOOK_SEQ,POST_TITLE,";
					sql += "POST_CONTENTS,POST_DATE,POST_VIEWS,nvl( POST_UPLOAD_FILE, '*') POST_UPLOAD_FILE";
					sql	+= "values(post_seq.NEXTVAL, ?, ?, ?, ?, sysdate, ?, ? )";


					pstmt = conn.prepareStatement(sql);
					//pstmt.setInt(1, num);
					pstmt.setString(1, postdto.getUser_Id());
					pstmt.setInt(2, postdto.getBook_Seq());
					pstmt.setString(3, postdto.getPost_Title());
					pstmt.setString(4, postdto.getPost_Contents());
					pstmt.setString(5, postdto.getPost_Date());
					pstmt.setInt(6, postdto.getPost_Views());
					pstmt.setString(7, postdto.getPost_Upload_File());
				

					result = pstmt.executeUpdate();
					System.out.println("result:"+result);
					if (result == 0)
						return false;

					return true;
				} catch (Exception ex) {
					System.out.println("postInsert 에러 : " + ex);
				} finally {
					closed();
				}
				return false;
			}
			
			
			
			
			public boolean PostModify(PostDto modifyPost) throws Exception {

				String sql = "update post set POST_CONTENTS=?,POST_TITLE=? where POST_SEQ=?";

				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, modifyPost.getPost_Contents());
					pstmt.setString(2, modifyPost.getPost_Title());
					pstmt.setInt(3, modifyPost.getPost_Seq());
					pstmt.executeUpdate();
					return true;
				} catch (Exception ex) {
					System.out.println("postModify 에러 : " + ex);
				} finally {
					closed();
				}
				return false;
			}

			// 글 삭제
			// delete.jsp
			public boolean PostDelete(int num) {
				// 주의점
				// 규칙 : 원본글이 삭제되면 다 지워 (ref = 1 ) .....

				// 규칙 : state 컬럼 : T , F 글이 삭제하는 것이 아니라 상태
				// : update set state = F where num=1
				// : F (삭제된 글) 문자만

				// 규칙 : 원본글 답변 지워지지 않고 답변 이 있으면 삭제 금지
				// : 답변 1개라도 있으면 원본글(삭제)
				// : 답변에 답변이 1개라도 있다면 삭제금지

				// Table column : state : t , f
				// 원본글
				// ->답변 삭제 (x) 답변
				// ->답변_1
				String Post_delete_sql = "delete from post where POST_SEQ=?";

				int result = 0;

				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(Post_delete_sql);
					pstmt.setInt(1, num);
					result = pstmt.executeUpdate();
					if (result == 0)
						return false;

					return true;
				} catch (Exception ex) {
					System.out.println("postDelete 에러 : " + ex);
				} finally {
					closed();
				}

				return false;
			}

			
			
			
			/*
			//음 이거 대기
			// 조회수 업데이트
			// view.jsp
			public void setReadCountUpdate(int num) throws Exception {

				String sql = "update post set BOARD_READCOUNT = "
						+ "BOARD_READCOUNT+1 where BOARD_NUM = " + num;

				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.executeUpdate();
				} catch (SQLException ex) {
					System.out.println("setReadCountUpdate 에러 : " + ex);
				} finally {
					closed();
				}
			}

			// 글쓴이인지 확인
			// 인증형 게시판 (로그인) (글쓴이 = 로그인한 사용자)
			// 비인증형 게시판(일반 사용자) : 글을 수정 , 삭제 => 비번
			// 삭제 수정하려는 글에 확인작업 (비번)
			// Modify.jsp , Delete.jsp
			public boolean isPostWriter(int num, String pass) {
				String post_sql = "select * from post where number=?";
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(post_sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					rs.next();

					if (pass.equals(rs.getString("post_PASS"))) {
						return true;
					}
				} catch (SQLException ex) {
					System.out.println("ispostWriter 에러 : " + ex);
				} finally {
					closed();
				}
				return false;
			}
			*/

}
