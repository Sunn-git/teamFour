package kr.or.book4zo.service.book;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dto.BookDto;

public class Book_Detail_s implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("Book_Detail_s");
		
		ActionForward forward = null;
		
		try {
			BookDao dao = new BookDao();
			BookDto book = dao.getABookByBookSeq(Integer.parseInt(request.getParameter("bookSeq")));
			request.setAttribute("book", book);
			
			//댓글 dao를 여기 만들어서 리뷰 리스트, 리뷰 평점 평균을  request에 set하기
			
		    forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/book/v_detail.jsp");
			
		} catch (Exception e) {
			System.out.println("Book_Detail_s 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		
		
		return forward;
	}
}
