package kr.or.book4zo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.book4zo.dto.BookDto;

public class BookDao {
	
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
	
	//DB 연결
	static DataSource ds;
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
	      System.out.println("BookDao look up Fail : " + e.getMessage());
	   }  
	}
	
	
	
	////함수
	
	//API 도서목록 DB에 저장하기 
	public int insertBookListToDB(BookDto book) {
		int result = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//여기서 DB 아이디랑 바꿔주기
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "DBUSER", "1004");

			String sql = "INSERT INTO BOOK(BOOK_SEQ, ISBN, TITLE, AUTHOR, TRANSLATOR, COVER_URL, PUBLISHER," + 
						 				  "CATEGORY_ID, PRICE_STANDARD, PUB_DATE, DESCRIPTION, RANK)" + 
						 		   "VALUES(BOOK_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, book.getIsbn());
			pstmt.setString(2, book.getTitle());
			pstmt.setString(3, book.getAuthor());
			pstmt.setString(4, book.getTranslator());
			pstmt.setString(5, book.getCoverUrl());
			pstmt.setString(6, book.getPublisher());
			pstmt.setInt(7, book.getCategoryId());
			pstmt.setLong(8, book.getPriceStandard());
			pstmt.setString(9, book.getPubDate());
			pstmt.setString(10, book.getDescription());
			pstmt.setLong(11, book.getRank());
						
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertBookListToDB 에러 : "+e.getMessage());
			e.printStackTrace();
		}finally {
			closed();
		}
		return result;
	}
	
	
	
	//도서 목록 전체 조회
	public List<BookDto> getAllBookList(){
		List<BookDto> allBookList = null;
		
		try {
			conn = ds.getConnection();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			allBookList = new ArrayList<BookDto>();
			while(rs.next()) {
				BookDto book = new BookDto();
				
				//여기 SET하는 내용 추가해야함
				
			}
						
		} catch (Exception e) {
			System.out.println("getAllBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return allBookList;
	}
	
	
	//도서 목록 조건 조회 : 나중에 조건 에 따라서 다르게 검색되도록 하기
	public List<BookDto> getBookList(String title, String author, String publisher){
		List<BookDto> bookList = null;
		
		try {
			conn = ds.getConnection();
			String sql = "";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			bookList = new ArrayList<BookDto>();
			while(rs.next()) {
				BookDto book = new BookDto();
				
				//여기 SET하는 내용 추가해야함
				
			}
						
		} catch (Exception e) {
			System.out.println("getAllBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return bookList;
	}
	
	
	
	
}
