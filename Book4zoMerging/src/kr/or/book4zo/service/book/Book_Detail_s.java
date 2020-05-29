package kr.or.book4zo.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.BookDto;
import kr.or.book4zo.dto.PostDto;

public class Book_Detail_s implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println("Book_Detail_s");
		
		ActionForward forward = null;
		
		try {
			BookDao bookDao = new BookDao();
			BookDto book = bookDao.getABookByBookSeq(Integer.parseInt(request.getParameter("bookSeq")));
			request.setAttribute("book", book);
			
//			System.out.println("book.getBookSeq() : "+book.getBookSeq());
			
			PostDao postDao = new PostDao();
			List<PostDto> postList = postDao.getPostList(book.getBookSeq());
			System.out.println("postList 확인 : "+ postList);
			request.setAttribute("postList", postList);
			
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
