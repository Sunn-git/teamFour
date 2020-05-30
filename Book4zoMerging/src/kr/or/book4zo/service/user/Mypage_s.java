package kr.or.book4zo.service.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dao.UserDao;
import kr.or.book4zo.dto.BookDto;
import kr.or.book4zo.dto.PostDto;
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
			//이걸 설정해줄 필요가 있을까?
//			UserDto user = (userDao.getUserListByUser_id(userId)).get(0);
//			request.setAttribute("CurrentUser", user);
			
			PostDao postDao = new PostDao();
			List<PostDto> postList = postDao.getPostList(userId);
			request.setAttribute("postList", postList);
			System.out.println("postList 확인 : " + postList);
			
			BookDao bookDao = new BookDao();
			List<BookDto> bookList = bookDao.getAllBookList();
			request.setAttribute("bookList", bookList);
			
			
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
