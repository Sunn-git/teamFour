package kr.or.book4zo.service.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dao.ReplyDao;
import kr.or.book4zo.dao.UserDao;
import kr.or.book4zo.dto.BookDto;
import kr.or.book4zo.dto.PostDto;
import kr.or.book4zo.dto.ReplyDto;
import kr.or.book4zo.dto.UserDto;

public class Mypage_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("Mypage_s");
//		System.out.println("parameter 확인 "+request.getParameter("userId"));
		String userId = request.getParameter("userId");
		ActionForward forward = null;
		
		try {
			
			UserDao userDao = new UserDao();
			
			PostDao postDao = new PostDao();
			List<PostDto> postList = postDao.getPostList(userId);
			request.setAttribute("postList", postList);
			System.out.println("postList 확인 : " + postList);
			
			BookDao bookDao = new BookDao();
			List<BookDto> bookList = bookDao.getAllBookList();
			request.setAttribute("bookList", bookList);
			
			ReplyDao replyDao = new ReplyDao();
			List<ReplyDto> replyList = replyDao.getReplyList(userId);
			request.setAttribute("replyList", replyList);
			
		} catch (Exception e) {
			System.out.println("Mypage_s 에러 : " + e.getMessage());
			e.printStackTrace();
		}
	    
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/user/v_myPage.jsp");
	    
	return forward;
	
	}

}
