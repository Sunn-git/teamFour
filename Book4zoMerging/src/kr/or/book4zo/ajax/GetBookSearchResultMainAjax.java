package kr.or.book4zo.ajax;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dto.BookDto;
import net.sf.json.JSONArray;



@WebServlet("/GetBookSearchResultMain.ajax")
public class GetBookSearchResultMainAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public GetBookSearchResultMainAjax() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());
		
		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("url_Command : " + url_Command);
		
		String searchFilter = request.getParameter("searchFilter");
		String bookSearchInput = request.getParameter("bookSearchInput");

		BookDao dao = new BookDao();
		
		System.out.println("searchFilter : "+searchFilter);
		System.out.println("bookSearchInput : "+bookSearchInput);
		
		List<BookDto> bookList = null;
		
		if(searchFilter == null && bookSearchInput == null) {
			bookList = dao.getAllBookListForMain();
		}else if(searchFilter != null && bookSearchInput != null) {
			bookList = dao.getBookListForMain(searchFilter, bookSearchInput);
		}
		
		//System.out.println("bookList 확인 : "+ bookList);
		
		
		
		request.setAttribute("bookList", bookList);
//		System.out.println("bookList 확인 : " + bookList);
		
		JSONArray jsonBookList = JSONArray.fromObject(bookList);
		
//		System.out.println("jsonbookList 확인" + jsonBookList);
		
		try {
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonBookList);		
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
