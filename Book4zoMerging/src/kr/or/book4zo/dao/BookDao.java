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
			conn = ds.getConnection();
			
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

			String sql = "SELECT B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID ORDER BY RANK ASC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			allBookList = new ArrayList<BookDto>();
			
			while(rs.next()) {
				BookDto book = new BookDto();
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				//System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
//				System.out.println("book 확인 : "+book);
				allBookList.add(book);	
			}
						
		} catch (Exception e) {
			System.out.println("getAllBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return allBookList;
	}
	//도서 목록 메인에서 조회
	public List<BookDto> getAllBookListForMain(){
		List<BookDto> allBookList = null;
		
		try {
			conn = ds.getConnection();
			
			//String sql = "SELECT B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID ORDER BY RANK ASC";
			
			String sql = "select * from ";
			sql += "( select rownum rnum, B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID order by rank asc";
			sql += ") where rnum between 1 and 10";
//			select *
//			from
//			(
//			select rownum rnum, B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID order by rank asc
//			)
//			where rnum between 1 and 10
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			allBookList = new ArrayList<BookDto>();
			
			while(rs.next()) {
				BookDto book = new BookDto();
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				//System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
//				System.out.println("book 확인 : "+book);
				allBookList.add(book);	
			}
			
		} catch (Exception e) {
			System.out.println("getAllBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return allBookList;
	}
	
	
	//카테고리별 도서 목록 조회
	public List<BookDto> getBookListByTag(String categoryTag){
		List<BookDto> bookList = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "SELECT B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID WHERE C.CATEGORY_TAG = ? ORDER BY RANK ASC";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, categoryTag);
			rs = pstmt.executeQuery();

			bookList = new ArrayList<BookDto>();
			
			while(rs.next()) {
				BookDto book = new BookDto();
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				//System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
//				System.out.println("book 확인 : "+book);
				bookList.add(book);	
			}
						
		} catch (Exception e) {
			System.out.println("getBookListByTag 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return bookList;
	}
	//카테고리별 도서 목록 조회
	public List<BookDto> getBookListByTagForMain(String categoryTag){
		List<BookDto> bookList = null;
		
		try {
			conn = ds.getConnection();
			
			String  sql ="select * from (";
			sql += "SELECT rownum rnum, B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD,";
			sql +=" B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID ";
			if(!categoryTag.equals("total")) {
				System.out.println("if문 탐?");
				sql +="WHERE C.CATEGORY_TAG = ? ";
			}
			sql += ") where rnum between 1 and 10";
			
			System.out.println(categoryTag);
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			if(!categoryTag.equals("total")) {
				pstmt.setString(1, categoryTag);
			}
			rs = pstmt.executeQuery();
			
			bookList = new ArrayList<BookDto>();
			
			System.out.println(rs);
			while(rs.next()) {
				//System.out.println(rs);
				BookDto book = new BookDto();
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
				System.out.println("카테고리 태그 확인 " + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				//System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
//				System.out.println("book 확인 : "+book);
				bookList.add(book);	
			}
			System.out.println(bookList.toString());
		} catch (Exception e) {
			System.out.println("getBookListByTag 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return bookList;
	}
	
	
	
	
	//도서 목록 조건 조회 : 나중에 조건 에 따라서 다르게 검색되도록 하기
	public List<BookDto> getBookList(String searchFilter, String bookSearchInput){
		List<BookDto> bookList = null;
		System.out.println("getBookList");
		try {
			conn = ds.getConnection();
			String sql = "SELECT B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, NVL(B.TRANSLATOR, '국내도서') TRANSLATOR, B.COVER_URL, B.PUBLISHER," + 
							   " B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK" + 
						" FROM BOOK B" + 
						" JOIN CATEGORY C" + 
						" ON B.CATEGORY_ID = C.CATEGORY_ID";
			
			//System.out.println("searchFilter : "+searchFilter);
			//System.out.println("bookSearchInput : "+bookSearchInput);
			
			if(searchFilter.equals("제목")) {
				sql += " WHERE B.TITLE LIKE '%' ||?|| '%'";
			}else if(searchFilter.equals("저자")) {
				sql += " WHERE B.AUTHOR LIKE '%' ||?|| '%'";
			}else if(searchFilter.equals("출판사")) {
				sql += " WHERE B.PUBLISHER LIKE '%' ||?|| '%'";
			}
			
			//System.out.println("sql 확인 : "+ sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookSearchInput);
			rs = pstmt.executeQuery();
			
			bookList = new ArrayList<BookDto>();
			while(rs.next()) {
				BookDto book = new BookDto();
				//생성자를 만드는게 나을까?
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
				//System.out.println("book 확인 : "+book);
				bookList.add(book);	
			}
						
		} catch (Exception e) {
			System.out.println("getBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return bookList;
	}
	//도서 목록 조건 조회 : 나중에 조건 에 따라서 다르게 검색되도록 하기
	public List<BookDto> getBookListForMain(String searchFilter, String bookSearchInput){
		List<BookDto> bookList = null;
		System.out.println("getBookList");
		try {
			conn = ds.getConnection();
			String sql= "SELECT * FROM (";
			sql += "SELECT rownum rnum, B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, NVL(B.TRANSLATOR, '국내도서') TRANSLATOR, B.COVER_URL, B.PUBLISHER," + 
					" B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK" + 
					" FROM BOOK B" + 
					" JOIN CATEGORY C" + 
					" ON B.CATEGORY_ID = C.CATEGORY_ID )";
			sql += "where rnum between 1 and 10";
			
			//System.out.println("searchFilter : "+searchFilter);
			//System.out.println("bookSearchInput : "+bookSearchInput);
			
			if(searchFilter.equals("제목")) {
				sql += " WHERE B.TITLE LIKE '%' ||?|| '%'";
			}else if(searchFilter.equals("저자")) {
				sql += " WHERE B.AUTHOR LIKE '%' ||?|| '%'";
			}else if(searchFilter.equals("출판사")) {
				sql += " WHERE B.PUBLISHER LIKE '%' ||?|| '%'";
			}
			
			//System.out.println("sql 확인 : "+ sql);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookSearchInput);
			rs = pstmt.executeQuery();
			
			bookList = new ArrayList<BookDto>();
			while(rs.next()) {
				BookDto book = new BookDto();
				//생성자를 만드는게 나을까?
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
				//System.out.println("book 확인 : "+book);
				bookList.add(book);	
			}
			
		} catch (Exception e) {
			System.out.println("getBookList 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return bookList;
	}
	
	//도서번호로 도서 찾기
	public BookDto getABookByBookSeq(int bookSeq){
		BookDto book = null;
		
		try {
			conn = ds.getConnection();

			String sql = "SELECT B.BOOK_SEQ, B.ISBN, B.TITLE, B.AUTHOR, B.TRANSLATOR, B.COVER_URL, B.PUBLISHER, B.CATEGORY_ID, C.CATEGORY_TAG, B.PRICE_STANDARD, B.PUB_DATE, B.DESCRIPTION, B.RANK FROM BOOK B JOIN CATEGORY C ON B.CATEGORY_ID = C.CATEGORY_ID WHERE B.BOOK_SEQ = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookSeq);
			rs = pstmt.executeQuery();
			
			book = new BookDto();
			
			while(rs.next()) {
				
				book.setBookSeq(rs.getInt("BOOK_SEQ"));
				book.setIsbn(rs.getString("ISBN"));
				book.setTitle(rs.getString("TITLE"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setTranslator(rs.getString("TRANSLATOR"));
				book.setCoverUrl(rs.getString("COVER_URL"));
				book.setPublisher(rs.getString("PUBLISHER"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
//				System.out.println("카테고리 태그 확인" + rs.getString("CATEGORY_TAG"));
				book.setCategoryTag(rs.getString("CATEGORY_TAG"));
				System.out.println("들어갔는지 확인 : " + book.getCategoryTag());
				book.setPriceStandard(rs.getLong("PRICE_STANDARD"));
				book.setPubDate(rs.getString("PUB_DATE"));
				book.setDescription(rs.getString("DESCRIPTION"));
				book.setRank(rs.getLong("RANK"));
				
//				System.out.println("book 확인 : "+book);
			}
						
		} catch (Exception e) {
			System.out.println("getBookListByTag 에러 : "+e.getMessage());
			e.printStackTrace();			
		}finally {
			closed();
		}		
		return book;
	}
	
	
	
	
}
